//
//  EditNote.swift
//  Taster
//
//  Created by hyunjun on 10/22/24.
//

import SwiftData
import SwiftUI
import PhotosUI

struct EditNote<T: TastingNote>: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var showCloseAlert = false
    
    @State private var selectedImage: UIImage?
    @State private var title = ""
    @State private var createdAt = Date()
    @State private var selectedCategory: Category?
    @State private var selectedLook: Look?
    @State private var selectedSmells: [Smell] = []
    @State private var tastes: [Taste] = []
    @State private var think = ""
    @State private var rating = 0.0
    @State private var ingredients: [Ingredient] = []
    @State private var containsIce = false
    
    let category: NoteCategory
    var note: T?
    
    private let lookColumns = Array(repeating: GridItem(.flexible()), count: 6)
    private let smellColumns = Array(repeating: GridItem(.flexible()), count: 6)
    
    var body: some View {
        NavigationStack {
            Form {
                Section("이미지 선택") {
                    EditThumnail(selectedImage: $selectedImage, category: selectedCategory)
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
                            ForEach(category.categories, id: \.self) { category in
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
                
                if !category.looks.isEmpty {
                    Section("시각") {
                        LazyVGrid(columns: lookColumns, spacing: 5) {
                            ForEach(category.looks, id: \.self) { look in
                                let isSelected = selectedLook == look
                                
                                Button {
                                    if isSelected {
                                        selectedLook = nil
                                    } else {
                                        selectedLook = look
                                    }
                                } label: {
                                    VStack {
                                        Image("\(look.rawValue + category.imageSuffix)")
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
                }
                
                if !category.smells.isEmpty {
                    Section("후각") {
                        LazyVGrid(columns: smellColumns, spacing: 8) {
                            ForEach(category.smells, id: \.self) { smell in
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
                }
                
                if category.categories.contains(where: { $0 == .homeCocktail }) {
                    Section("커스텀 칵테일") {
                        CocktailFactory(
                            ingredients: $ingredients,
                            containsIce: $containsIce
                        )
                    }
                }
                
                Section("미각") {
                    if tastes.count > 4 {
                        PolygonChart(
                            labels: tastes.map { $0.label },
                            values: tastes.map { $0.value },
                            maxValue: 5,
                            height: 120
                        )
                        .padding(.vertical, 8)
                    }
                    
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
            .navigationTitle(note == nil ? "\(category.description) 노트 추가" : "\(category.description) 노트 수정")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("닫기") {
                        showCloseAlert = true
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("저장") {
                        save()
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
            .onAppear {
                tastes = category.tastes
                
                if let note {
                    title = note.title
                    selectedCategory = Category(rawValue: note.category)
                    createdAt = note.createdAt
                    if let data = note.imageData {
                        selectedImage = UIImage(data: data)
                    }
                    selectedLook = Look(rawValue: note.look)
                    selectedSmells = note.smells.compactMap { Smell(rawValue: $0) }
                    tastes = note.tastes
                    think = note.think
                    rating = note.rating
                    
                    if let note = note as? CocktailTastingNote {
                        ingredients = note.ingredients
                        containsIce = note.containsIce
                    }
                }
            }
        }
    }
    
    func save() {
        if let note {
            note.title = title
            note.category = selectedCategory?.rawValue ?? ""
            note.createdAt = createdAt
            note.imageData = selectedImage?.pngData()
            note.look = selectedLook?.rawValue ?? ""
            note.smells = selectedSmells.map { $0.rawValue }
            note.tastes = tastes
            note.think = think
            note.rating = rating
            
            if let note = note as? CocktailTastingNote {
                note.ingredients = ingredients
                note.containsIce = containsIce
            }
            
            try? context.save()
        } else {
            if let note = category.model as? T {
                note.title = title
                note.category = selectedCategory?.rawValue ?? ""
                note.createdAt = createdAt
                note.imageData = selectedImage?.pngData()
                note.look = selectedLook?.rawValue ?? ""
                note.smells = selectedSmells.map { $0.rawValue }
                note.tastes = tastes
                note.think = think
                note.rating = rating
                
                if let note = note as? CocktailTastingNote {
                    note.ingredients = ingredients
                    note.containsIce = containsIce
                }
                
                context.insert(note)
            }
        }
    }
}

#Preview {
    Text("Preview")
        .sheet(isPresented: .constant(true)) {
            EditNote<CocktailTastingNote>(category: .cocktail)
        }
}
