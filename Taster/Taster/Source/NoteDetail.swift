//
//  NoteDetail.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/21/24.
//

import SwiftUI

struct NoteDetail<T: SchemaV2.TastingNote>: View {
    let note: T
    
    var body: some View {
        Form {
            Section("기본 정보") {
                HStack {
                    Thumnail(
                        data: note.thumnail,
                        category: note.category,
                        width: 80,
                        height: 80,
                        uiColor: .systemBackground
                    )
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("\(note.createdAt.formatted(date: .abbreviated, time: .omitted))")
                                .font(.caption2)
                            if let category = SchemaV2StoredProperty.Category(rawValue: note.category) {
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
                if let look = SchemaV2StoredProperty.Look(rawValue: note.look) {
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
                                    if let smell = SchemaV2StoredProperty.Smell(rawValue: smell) {
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
                
                VStack(alignment: .leading) {
                    Text("미각")
                        .font(.caption)
                        .foregroundStyle(.gray)
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
                    
                }
                
                Button("삭제", systemImage: "trash", role: .destructive) {
                    
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoteDetail(note: SchemaV2.wineTastingNotes[0])
    }
}
