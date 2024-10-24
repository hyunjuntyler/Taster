//
//  CocktailFactory.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/23/24.
//

import SwiftUI

struct CocktailFactory: View {
    @State private var showIngredientSheet = false
    @State private var selectedIndex: Int?
    
    @Binding var ingredients: [Ingredient]
    @Binding var containsIce: Bool
    
    var body: some View {
        CustomCocktail(
            ingredients: ingredients,
            containsIce: containsIce,
            width: 60,
            height: 80
        )
        
        Toggle("얼음", isOn: $containsIce)
            .tint(.cyan)
        
        ForEach(ingredients.indices, id: \.self) { index in
            LabeledContent {
                HStack {
                    Text("\(ingredients[index].amount, specifier: "%.0f")")
                        .padding(.trailing, 8)
                    
                    Button("편집") {
                        selectedIndex = index
                        showIngredientSheet = true
                    }
                    .font(.subheadline)
                    .buttonStyle(.bordered)
                    
                    Button("삭제") {
                        ingredients.remove(at: index)
                    }
                    .font(.subheadline)
                    .buttonStyle(.bordered)
                }
            } label: {
                HStack {
                    Text(ingredients[index].name)
                }
            }
        }
        
        Button("재료 추가") {
            selectedIndex = nil
            showIngredientSheet = true
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .sheet(isPresented: $showIngredientSheet) {
            IngredientSheet(ingredients: $ingredients, selectedIndex: $selectedIndex)
        }
    }
}

struct IngredientSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var ingredients: [Ingredient]
    @Binding var selectedIndex: Int?
    
    @State var name = ""
    @State var amount = 0.0
    @State var selectedColor: IngredientColor?
        
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        NavigationStack {
            Form {
                LabeledContent("재료 이름") {
                    TextField("재료의 이름을 입력해주세요.", text: $name)
                        .multilineTextAlignment(.trailing)
                        .onAppear {
                            UITextField.appearance().clearButtonMode = .whileEditing
                        }
                }
                
                LabeledContent("재료의 양") {
                    HStack {
                        Text("\(amount, specifier: "%.0f")")
                            .contentTransition(.numericText(value: amount))
                            .monospacedDigit()
                            .padding(.trailing, 8)
                        Stepper("", value: $amount, in: 0...100)
                            .labelsHidden()
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("재료의 색")
                    
                    LazyVGrid(columns: columns) {
                        ForEach(IngredientColor.allCases, id: \.self) { color in
                            Button {
                                if selectedColor == color {
                                    selectedColor = nil
                                } else {
                                    selectedColor = color
                                }
                            } label: {
                                color.color
                                    .frame(height: 25)
                                    .cornerRadius(5)
                                    .opacity(selectedColor == color ? 1 : 0.3)
                                    .shadow(radius: selectedColor == color ? 1 : 0)
                                    .animation(.bouncy, value: selectedColor)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .navigationTitle(selectedIndex == nil ? "재료 추가" : "재료 편집")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("닫기") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(selectedIndex == nil ? "추가" : "저장") {
                        if let selectedColor = selectedColor {
                            let ingredient = Ingredient(name: name, amount: amount, colorString: selectedColor.rawValue)
                            
                            if let index = selectedIndex {
                                ingredients[index] = ingredient
                            } else {
                                ingredients.append(ingredient)
                            }
                        }
                        
                        dismiss()
                    }
                    .disabled(selectedColor == nil)
                }
            }
            .onAppear {
                if let selectedIndex {
                    name = ingredients[selectedIndex].name
                    amount = ingredients[selectedIndex].amount
                    selectedColor = IngredientColor(rawValue: ingredients[selectedIndex].colorString)
                }
            }
        }
        .presentationDetents([.medium])
    }
}

#Preview {
    List {
        Section("커스텀") {
            CocktailFactory(
                ingredients: .constant([Ingredient(name: "재료", amount: 1, colorString: "red")]),
                containsIce: .constant(true)
            )
        }
    }
}
