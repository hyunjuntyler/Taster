//
//  AddNote.swift
//  Taster
//
//  Created by hyunjun on 10/22/24.
//

import SwiftUI

typealias Category = SchemaV2StoredProperty.Category
typealias Look = SchemaV2StoredProperty.Look
typealias Smell = SchemaV2StoredProperty.Smell

struct AddNote: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var createdAt = Date()
    @State private var selectedCategory: Category?
    @State private var selectedLook: Look?
    @State private var selectedSmells: [Smell] = []
    @State private var tastes: [Double] = []
    @State private var think = ""
    @State private var rating = 0.0
    
    let categories: [Category]
    let looks: [Look]
    let smells: [Smell]
    
    private let lookColumns = Array(repeating: GridItem(.flexible()), count: 6)
    private let smellColumns = Array(repeating: GridItem(.flexible()), count: 6)
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
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
                            ForEach(SchemaV2StoredProperty.Wine.categories, id: \.self) { category in
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
                } header: {
                    Text("기본 정보")
                }
                
                Section {
                    LazyVGrid(columns: lookColumns, spacing: 5) {
                        ForEach(looks, id: \.self) { look in
                            Button {
                                selectedLook = look
                            } label: {
                                VStack {
                                    WaveFilledGlass(width: 30, height: 45, category: .wine, foregroundColor: look.color)
                                    Text(look.description)
                                        .foregroundStyle(.accent)
                                        .font(.caption2)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                } header: {
                    Text("시각")
                }
                
                Section {
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
                } header: {
                    Text("후각")
                }
                
                
                Section {
                    PolygonChart(labels: [], values: [2,3,3,4,3], maxValue: 5, height: 60)
                    LabeledContent("미각") {
                        Rating(rating: .constant(4.0), systemName: "circle.fill", font: .title3, foregroundColor: .accent)
                    }
                } header: {
                    Text("미각")
                }
                
                Section {
                    TextField("더 추가하고 싶은 내용을 입력해주세요", text: $think, axis: .vertical)
                        .frame(height: 150, alignment: .top)
                } header: {
                    Text("추가 노트")
                }
                
                Section {
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
                } header: {
                    Text("평점")
                }
            }
            .navigationTitle("노트 추가")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("닫기") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("저장") {
                        dismiss()
                    }
                }
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
