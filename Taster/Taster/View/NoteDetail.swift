//
//  NoteDetail.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftData
import SwiftUI

struct NoteDetail<T: TastingNote>: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var showEditNote = false
    @State private var showDeleteAlert = false
    
    let note: T
    
    var body: some View {
        Form {
            Section("기본 정보") {
                HStack {
                    Thumnail(
                        data: note.imageData,
                        category: note.category,
                        width: 80,
                        height: 80,
                        uiColor: .systemBackground
                    )
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("\(note.createdAt.formatted(date: .abbreviated, time: .omitted))")
                                .font(.caption2)
                            if let category = Category(rawValue: note.category) {
                                Text(category.description)
                                    .font(.caption)
                            }
                            Text(note.title)
                                .bold()
                                .lineLimit(1)
                            RatingDisplay(rating: note.rating)
                        }
                    }
                }
                .listRowInsets(.init())
            }
            .listRowBackground(Color.clear)
            
            Section("테이스팅 노트") {
                if let look = Look(rawValue: note.look) {
                    VStack(alignment: .leading) {
                        Text("시각")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 3, style: .continuous)
                                .frame(width: 16, height: 16)
                                .foregroundStyle(look.color)
                                .shadow(color: Color(.systemGray3), radius: 1)
                            
                            Text(look.description)
                                .font(.subheadline)
                        }
                    }
                }
                
                if !note.smells.isEmpty {
                    VStack(alignment: .leading) {
                        Text("후각")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(note.smells, id: \.self) { smell in
                                    if let smell = Smell(rawValue: smell) {
                                        VStack {
                                            Image(uiImage: smell.uiImage)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30, height: 30)
                                            Text(smell.description)
                                                .font(.caption2)
                                                .fontWeight(.regular)
                                        }
                                        .padding(8)
                                        .padding(.horizontal, 3)
                                        .background {
                                            RoundedRectangle(cornerRadius: 12)
                                                .foregroundStyle(Color(.systemGroupedBackground))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                if let note = note as? CocktailTastingNote {
                    VStack(alignment: .leading) {
                        Text("칵테일")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                        CustomCocktail(
                            ingredients: note.ingredients,
                            containsIce: note.containsIce,
                            width: 60,
                            height: 90
                        )
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("미각")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    if note.tastes.count > 4 {
                        PolygonChart(
                            labels: note.tastes.map { $0.label },
                            values: note.tastes.map { $0.value },
                            maxValue: 5,
                            height: 80)
                        .padding(.vertical, 8)
                    }
                    
                    ForEach(Array(zip(Property.labelColors, note.tastes)), id: \.1) { color, taste in
                        if taste != note.tastes.first {
                            Divider()
                        }
                        
                        LabeledContent {
                            RatingDisplay(rating: taste.value, color: color, systemName: "circle.fill", font: .subheadline)
                        } label: {
                            Text(taste.label)
                                .font(.subheadline)
                        }
                    }
                }
            }
            
            Section("추가 노트") {
                Text(note.think)
            }
        }
        .navigationTitle(note.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Menu("메뉴", systemImage: "ellipsis") {
                Button("수정", systemImage: "pencil") {
                    showEditNote = true
                }
                
                Button("삭제", systemImage: "trash", role: .destructive) {
                    showDeleteAlert = true
                }
            }
        }
        .sheet(isPresented: $showEditNote) {
            EditNote(category: NoteCategory.getCategory(from: note), note: note)
        }
        .alert("정말 삭제하시겠어요?", isPresented: $showDeleteAlert) {
            Button("삭제", role: .destructive) {
                dismiss()
                context.delete(note)
            }
        } message: {
            Text("삭제한 노트는 복구가 불가능해요.")
        }
    }
}

#Preview {
    NavigationStack {
        NoteDetail(note: SchemaV2.cocktailTastingNotes[0])
    }
}
