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
    @State private var tastes: [Double] = []
    @State private var think = ""
    @State private var rating = 0.0
    
    @State private var showCloseAlert = false
    
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
                            Button {
                                selectedLook = look
                            } label: {
                                VStack {
                                    Image("\(look.rawValue + "Wine")")
                                        .resizable()
                                        .scaledToFit()
                                    Text(look.description)
                                        .foregroundStyle(.accent)
                                        .font(.caption2)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                Section("후각") {
                    LazyVGrid(columns: smellColumns, spacing: 8) {
                        ForEach(smells, id: \.self) { smell in
                            Button {
                                if selectedSmells.contains(smell) {
                                    if let index = selectedSmells.firstIndex(of: smell) {
                                        selectedSmells.remove(at: index)
                                    }
                                } else {
                                    selectedSmells.append(smell)
                                }
                            } label: {
                                VStack {
                                    Image(uiImage: smell.uiImage)
                                        .resizable()
                                        .scaledToFit()
                                    Text(smell.description)
                                        .foregroundStyle(.accent)
                                        .font(.caption2)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                
                Section("미각") {
                    PolygonChart(labels: [], values: [2,3,3,4,3], maxValue: 5, height: 60)
                    LabeledContent("미각") {
                        Rating(rating: .constant(4.0), systemName: "circle.fill", font: .title3, foregroundColor: .accent)
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
                categories: SchemaV2StoredProperty.Wine.categories,
                looks: SchemaV2StoredProperty.Wine.looks,
                smells: SchemaV2StoredProperty.Wine.smells
            )
        }
}
