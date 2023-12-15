//
//  AddCocktailFactoryView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/12/23.
//

import SwiftUI

struct AddCocktailFactoryView: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @Bindable private var observable = CocktailNoteObservable.shared
    
    @State private var navigate = false
    @State private var addIngredientSheet = false
    
    @State private var ingredients: [CocktailIngredient] = []
    @State private var isIce = false
    
    @State private var name = ""
    @State private var amount = 0
    @State private var color = ""
    @State private var selectedColor = ""
    @State private var selectedIndex: Int?
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 9)
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Factory")
                        .font(.gmarketSansTitle)
                        .padding(.bottom)
                    Text("마셨던 칵테일을 만들어 보세요")
                        .font(.gmarketSansBody)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    VStack {
                        CocktailFactory(ingredients: ingredients, isIce: isIce)
                        
                        ZStack {
                            if !observable.name.isEmpty {
                                Text(observable.name)
                                    .font(.gmarketSansBody)
                                    .padding(5)
                                    .background {
                                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                                            .foregroundStyle(.appPickerGray)
                                    }
                            }
                            addIceButton
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .padding(.top, -10)
                        
                        if !ingredients.isEmpty {
                            VStack(alignment: .leading) {
                                ForEach(ingredients.indices, id: \.self) { index in
                                    CustomDivider()
                                    HStack {
                                        Text("\(index + 1)")
                                            .monospacedDigit()
                                            .fontDesign(.rounded)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(observable.getColor(for: ingredients[index].colorName))
                                        Text(ingredients[index].name)
                                            .font(.gmarketSansBody)
                                        Spacer()
                                        Text("\(ingredients[index].amount, specifier: "%.0f")")
                                            .monospacedDigit()
                                            .fontDesign(.rounded)
                                            .fontWeight(.medium)
                                            .padding(.trailing, 6)
                                        
                                        Button {
                                            Haptic.impact(style: .soft)
                                            selectedIndex = index
                                            addIngredientSheet = true
                                        } label: {
                                            Text("편집")
                                                .font(.gmarketSansFootnote)
                                                .foregroundStyle(.gray)
                                                .padding(12)
                                                .background {
                                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                                        .foregroundStyle(.appPickerGray)
                                                }
                                        }
                                        .buttonStyle(PressButtonStyle())
                                        
                                        Button {
                                            withAnimation {
                                                Haptic.impact(style: .soft)
                                                ingredients.remove(at: index)
                                            }
                                        } label: {
                                            Text("삭제")
                                                .font(.gmarketSansFootnote)
                                                .foregroundStyle(.gray)
                                                .padding(12)
                                                .background {
                                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                                        .foregroundStyle(.appPickerGray)
                                                }
                                        }
                                        .buttonStyle(PressButtonStyle())
                                    }
                                }
                            }
                        }
                        CustomDivider()
                        
                        addIngredientButton
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.appSheetBoxBackground)
                    }
                    .padding(.horizontal)
                }
                
                NextButton(disabled: false) {
                    observable.ingredients = ingredients
                    observable.isIce = isIce
                    navigate = true
                }
                .navigationDestination(isPresented: $navigate) {
                    AddCocktailTasteView()
                }
            }
        }
        .navigationTitle("")
        .sheet(isPresented: $addIngredientSheet) {
            selectedIndex = nil
            name = ""
            amount = 0
            selectedColor = ""
        } content: {
            addGredientSheet
        }
        .toolbar {
            CloseButton {
                noteEnvironment.showCloseAlert = true
            }
        }
    }
    
    private var addGredientSheet: some View {
        VStack {
            Text(selectedIndex == nil ? "재료 추가" : "재료 편집")
                .font(.gmarketSansTitle3)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .trailing) {
                    Button {
                        Haptic.impact(style: .soft)
                        addIngredientSheet = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.appGrayButton)
                            .padding()
                    }
                    .buttonStyle(PressButtonStyle())
                }
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("재료 이름")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack {
                            TextField("재료의 이름을 작성해 주세요", text: $name)
                                .font(.gmarketSansBody)
                            Button {
                                Haptic.impact(style: .soft)
                                name = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.appPickerGray, .appGrayButton)
                                    .font(.title3)
                            }
                            .buttonStyle(PressButtonStyle())
                            .opacity(name.isEmpty ? 0 : 1)
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundStyle(.appPickerGray)
                        }
                        Text("재료의 양 (비율로 입력해 주세요)")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack(spacing: 0) {
                            Text("\(amount)")
                                .font(.gmarketSansButton)
                                .frame(maxWidth: .infinity)
                            Button{
                                if amount > 0 {
                                    Haptic.impact(style: .soft)
                                    amount -= 1
                                } else {
                                    Haptic.notification(type: .error)
                                }
                            } label: {
                                Image(systemName: "minus.square.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(.appGrayButton)
                            }
                            .buttonStyle(PressButtonStyle())
                            Button{
                                Haptic.impact(style: .soft)
                                amount += 1
                            } label: {
                                Image(systemName: "plus.square.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(.appGrayButton)
                            }
                            .buttonStyle(PressButtonStyle())
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 20)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundStyle(.appPickerGray)
                        }
                        
                        Text("표시할 색상")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        LazyVGrid(columns: columns) {
                            ForEach(cocktailIngredientColors) { ingredientColor in
                                Button {
                                    Haptic.impact(style: .soft)
                                    if selectedColor == observable.getColorName(for: ingredientColor.color) {
                                        selectedColor = ""
                                    } else {
                                        selectedColor = observable.getColorName(for: ingredientColor.color)
                                    }
                                } label: {
                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                                        .scaledToFit()
                                        .foregroundColor(ingredientColor.color)
                                        .opacity(selectedColor == observable.getColorName(for: ingredientColor.color) ? 1 : 0.3)
                                        .overlay {
                                            if selectedColor == observable.getColorName(for: ingredientColor.color) {
                                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                                    .stroke(.accent, lineWidth: 3)
                                            }
                                        }
                                }
                                .buttonStyle(PressButtonStyle())
                            }
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundStyle(.appPickerGray)
                        }
                    }
                    .padding(.horizontal)
                }
                
                NextButton(label: selectedIndex == nil ? "추가하기" : "편집완료", disabled: selectedColor.isEmpty || amount == 0) {
                    addIngredientSheet = false
                    let ingredient = CocktailIngredient(name: name, amount: Double(amount), colorName: selectedColor)
                    withAnimation {
                        if let index = selectedIndex {
                            ingredients[index] = ingredient
                        } else {
                            ingredients.append(ingredient)
                        }
                    }
                    name = ""
                    amount = 0
                    selectedColor = ""
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .onAppear {
            if let index = selectedIndex {
                DispatchQueue.main.async {
                    name = ingredients[index].name
                    amount = Int(ingredients[index].amount)
                    selectedColor = ingredients[index].colorName
                }
            }
        }
        .padding(.top, 24)
        .presentationDetents([.medium])
        .presentationCornerRadius(24)
    }
    
    private var addIngredientButton: some View {
        Button {
            Haptic.impact(style: .soft)
            addIngredientSheet = true
        } label: {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.title3)
                Text("재료 추가하기")
                    .font(.gmarketSansBody)
            }
            .foregroundStyle(.accent)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 5)
        }
        .buttonStyle(PressButtonStyle())
    }
    
    private var addIceButton: some View {
        Button {
            Haptic.impact(style: .soft)
            withAnimation {
                isIce.toggle()
            }
        } label: {
            HStack(spacing: 3) {
                if isIce {
                    RoundedRectangle(cornerRadius: 3, style: .continuous)
                        .frame(width: 12, height: 12)
                } else {
                    RoundedRectangle(cornerRadius: 3, style: .continuous)
                        .strokeBorder(lineWidth: 2)
                        .frame(width: 12, height: 12)
                }
                Text("얼음")
                    .font(.gmarketSansSubHeadline)
            }
        }
        .foregroundStyle(.accent)
        .buttonStyle(PressButtonStyle())
    }
}

#Preview {
    NavigationStack {
        AddCocktailFactoryView()
            .environment(NoteEnvironment())
    }
}
