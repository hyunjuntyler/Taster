//
//  AddNote.swift
//  Taster
//
//  Created by hyunjun on 10/22/24.
//

import SwiftData
import SwiftUI
import PhotosUI

struct AddNote: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedImage: UIImage?
    @State private var title = ""
    @State private var createdAt = Date()
    @State private var selectedCategory: Category?
    @State private var selectedLook: Look?
    @State private var selectedSmells: [Smell] = []
    @State private var think = ""
    @State private var rating = 0.0
    
    @State private var showCloseAlert = false
    
    @State var tastes: [Taste]
    let categories: [Category]
    let looks: [Look]
    let smells: [Smell]
    
    private let lookColumns = Array(repeating: GridItem(.flexible()), count: 6)
    private let smellColumns = Array(repeating: GridItem(.flexible()), count: 6)
    
    var body: some View {
        NavigationStack {
            Form {
                Section("이미지 선택") {
                    AddThumnail(selectedImage: $selectedImage, category: selectedCategory)
                }

                Section("기본 정보") {
                    LabeledContent("이름") {
                        TextField("이름을 입력해주세요", text: $title)
                            .multilineTextAlignment(.trailing)
                            .onAppear {
                                UITextField.appearance().clearButtonMode = .whileEditing
                            }
                    }
                    
                    DatePicker("날짜", selection: $createdAt, displayedComponents: .date)
                    
                    LabeledContent("종류") {
                        Menu {
                            ForEach(categories, id: \.self) { category in
                                Button {
                                    selectedCategory = category
                                } label: {
                                    HStack {
                                        Text(category.description)
                                        Image(uiImage: category.uiImage)
                                    }
                                }
                            }
                        } label: {
                            if let selectedCategory {
                                HStack {
                                    Image(uiImage: selectedCategory.uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 20)
                                    Text(selectedCategory.description)
                                }
                            } else {
                                Text("선택")
                            }
                        }
                    }
                }
                
                Section("시각") {
                    LazyVGrid(columns: lookColumns, spacing: 5) {
                        ForEach(looks, id: \.self) { look in
                            let isSelected = selectedLook == look
                            
                            Button {
                                if isSelected {
                                    selectedLook = nil
                                } else {
                                    selectedLook = look
                                }
                            } label: {
                                VStack {
                                    Image("\(look.rawValue + "Wine")")
                                        .resizable()
                                        .scaledToFit()
                                    Text(look.description)
                                        .bold(isSelected)
                                        .foregroundStyle(isSelected ? .accent : .secondary)
                                        .font(.caption2)
                                }
                                .padding(2)
                                .background {
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .foregroundStyle(isSelected ? Color(.systemGroupedBackground) : .clear)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                Section("후각") {
                    LazyVGrid(columns: smellColumns, spacing: 8) {
                        ForEach(smells, id: \.self) { smell in
                            let isContains = selectedSmells.contains(smell)
                            
                            Button {
                                if isContains {
                                    selectedSmells.removeAll(where: { $0 == smell })
                                } else {
                                    selectedSmells.append(smell)
                                }
                            } label: {
                                VStack {
                                    Image(uiImage: smell.uiImage)
                                        .resizable()
                                        .scaledToFit()
                                    Text(smell.description)
                                        .bold(isContains)
                                        .foregroundStyle(isContains ? .accent : .secondary)
                                        .font(.caption2)
                                }
                                .padding(2)
                                .background {
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .foregroundStyle(isContains ? Color(.systemGroupedBackground) : .clear)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                
                Section("미각") {
                    PolygonChart(
                        labels: tastes.map { $0.label },
                        values: tastes.map { $0.value },
                        maxValue: 5,
                        height: 120
                    )
                    .padding(.vertical, 8)
                    
                    ForEach(tastes.indices, id: \.self) { index in
                        LabeledContent(tastes[index].label) {
                            Rating(rating: $tastes[index].value, systemName: "circle.fill", font: .title3, foregroundColor: Property.labelColors[index])
                        }
                    }
                }
                
                Section("추가 노트") {
                    TextField("더 추가하고 싶은 내용을 입력해주세요", text: $think, axis: .vertical)
                        .frame(height: 150, alignment: .top)
                }
                
                Section("평점") {
                    LabeledContent {
                        Text("\(rating, specifier: "%.1f")")
                            .contentTransition(.numericText(value: rating))
                            .font(.title3)
                            .fontDesign(.rounded)
                            .fontWeight(.medium)
                            .monospacedDigit()
                    } label: {
                        Rating(rating: $rating)
                    }
                }
            }
            .navigationTitle("노트 추가")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("닫기") {
                        showCloseAlert = true
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("저장") {
                        dismiss()
                    }
                }
            }
            .alert("정말 닫으시겠어요?", isPresented: $showCloseAlert) {
                Button("닫기", role: .destructive) {
                    dismiss()
                }
            } message: {
                Text("작성된 내용은 저장되지 않아요")
            }
        }
    }
}

#Preview {
    Text("Preview")
        .sheet(isPresented: .constant(true)) {
            AddNote(
                tastes: zip(Wine.labels, [4, 4, 3, 3, 2]).map { Taste(label: $0, value: $1) },
                categories: Wine.categories,
                looks: Wine.looks,
                smells: Wine.smells
            )
        }
}
