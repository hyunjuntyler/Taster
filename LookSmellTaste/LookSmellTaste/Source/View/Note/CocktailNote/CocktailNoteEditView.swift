//
//  CocktailNoteEditView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 12/13/23.
//

import SwiftUI
import SwiftData

struct CocktailNoteEditView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var note: CocktailNote
    
    @State private var selectedImage: UIImage?
    @State private var defaultImageName = ""
    @State private var name = ""
    @State private var ingredientName = ""
    @State private var date = Date()
    @State private var type: CocktailType = cocktailTypes[0]
    @State private var ingredients: [CocktailIngredient] = []
    @State private var isIce = false
    @State private var taste: [Double] = [0, 0, 0]
    @State private var think = ""
    @State private var rating = 0.0
    
    @State private var amount = 0
    @State private var color = ""
    @State private var selectedColor = ""
    @State private var selectedIndex: Int?
    
    @State private var permissionDenied = false
    @State private var permissionType: PermissionType = .album
    
    @State private var showDatePicker = false
    @State private var addIngredientSheet = false
    
    private let tasteLabels = ["단맛", "신맛", "도수"]
    private let symbolColors: [Color] = [.orange, .blue, .red]
    private let columns = Array(repeating: GridItem(.flexible()), count: 9)

    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackground.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("대표 이미지")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        EditImagePicker(selectedImage: $selectedImage, permissionDenied: $permissionDenied, permissionType: $permissionType, defaultImageName: defaultImageName)
                        
                        Text("칵테일 이름")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack {
                            TextField("칵테일 이름을 입력해주세요", text: $name, axis: .vertical)
                                .font(.gmarketSansBody)
                                .tint(.accent)
                                .onTapGesture {
                                    Haptic.impact(style: .soft)
                                }
                            Button {
                                Haptic.impact(style: .soft)
                                name = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.gray, .appPickerGray)
                                    .font(.title3)
                            }
                            .buttonStyle(PressButtonStyle())
                            .opacity(name.isEmpty ? 0 : 1)
                        }
                        .padding()
                        .frame(height: 60)
                        .background {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                        
                        Text("마신 날짜")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack {
                            Text("\(date.formatted(date: .complete, time: .omitted))")
                                .font(.gmarketSansBody)
                                .onChange(of: date) { _, _ in
                                    Haptic.impact(style: .soft)
                                }
                            Spacer()
                            Button {
                                showDatePicker = true
                                Haptic.impact(style: .soft)
                            } label: {
                                Text("바꾸기")
                                    .font(.gmarketSansFootnote)
                                    .foregroundStyle(.gray)
                                    .padding()
                                    .background {
                                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                                            .foregroundStyle(.appPickerGray)
                                    }
                            }
                            .buttonStyle(PressButtonStyle())
                        }
                        .padding(.leading, 10)
                        .padding(8)
                        .frame(height: 60)
                        .background {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                        
                        Text("칵테일 종류")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            Text(type.name)
                                .font(.gmarketSansBody)
                            Spacer()
                            Button {
                                withAnimation {
                                    type = cocktailTypes[0]
                                    defaultImageName = type.imageName
                                }
                                Haptic.impact(style: .soft)
                            } label: {
                                Text("홈")
                                    .font(.gmarketSansFootnote)
                                    .foregroundStyle(type == cocktailTypes[0] ? .accent : .gray)
                                    .padding()
                                    .background {
                                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                                            .foregroundStyle(.appPickerGray)
                                    }
                            }
                            .buttonStyle(PressButtonStyle())
                            Button {
                                withAnimation {
                                    type = cocktailTypes[1]
                                    defaultImageName = type.imageName
                                }
                                Haptic.impact(style: .soft)
                            } label: {
                                Text("칵테일 바")
                                    .font(.gmarketSansFootnote)
                                    .foregroundStyle(type == cocktailTypes[1] ? .accent : .gray)
                                    .padding()
                                    .background {
                                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                                            .foregroundStyle(.appPickerGray)
                                    }
                            }
                            .buttonStyle(PressButtonStyle())
                        }
                        .padding(8)
                        .frame(height: 60)
                        .background {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                        
                        Text("Factory")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        VStack {
                            CocktailFactory(ingredients: ingredients, isIce: isIce)
                            
                            ZStack {
                                if !note.name.isEmpty {
                                    Text(note.name)
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
                                                .bold()
                                                .foregroundStyle(getColor(for: ingredients[index].colorName))
                                            Text(ingredients[index].name)
                                                .font(.gmarketSansBody)
                                            Spacer()
                                            Text("\(ingredients[index].amount, specifier: "%.0f")")
                                                .monospacedDigit()
                                                .fontDesign(.rounded)
                                                .bold()
                                                .padding(.trailing, 8)
                                            
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
                        
                        Text("Taste")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        VStack {
                            ForEach(0..<3) { index in
                                HStack {
                                    Text(tasteLabels[index])
                                        .font(.gmarketSansCallout)
                                    Spacer()
                                    Rating(rating: $taste[index],
                                           symbolName: "circle.fill",
                                           symbolFont: .title3,
                                           symbolColor: symbolColors[index])
                                }
                                if index < 2 {
                                    CustomDivider()
                                }
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                        
                        Text("Think")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack(alignment: .top, spacing: 3) {
                            TextField("더 추가하고 싶은 내용을 입력해주세요", text: $think, axis: .vertical)
                                .frame(height: 150, alignment: .topLeading)
                                .font(.gmarketSansCallout)
                            Button {
                                Haptic.impact(style: .soft)
                                think = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.gray, .appPickerGray)
                                    .font(.title3)
                            }
                            .buttonStyle(PressButtonStyle())
                            .opacity(think.isEmpty ? 0 : 1)
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                        
                        Text("평점")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack {
                            Rating(rating: $rating, symbolFont: Font.title3)
                            Spacer()
                            Text("\(rating, specifier: "%.1f")")
                                .monospacedDigit()
                                .animation(nil, value: rating)
                                .font(.title3)
                                .fontDesign(.rounded)
                                .fontWeight(.medium)
                                .foregroundStyle(.gray)
                                .padding(.trailing, 3)
                        }
                        .padding()
                        .frame(height: 60)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                    }
                    .padding(.bottom)
                    .padding(.horizontal)
                }
            }
            .onAppear {
                getNoteData()
            }
            .overlay {
                if permissionDenied {
                    CameraPermissionAlert(showPermissionAlert: $permissionDenied, type: permissionType)
                }
            }
            .sheet(isPresented: $showDatePicker) {
                VStack {
                    Text("마신 날짜 변경")
                        .font(.gmarketSansTitle3)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            SheetCloseButton {
                                showDatePicker = false
                            }
                        }
                    DatePicker("마신 날짜", selection: $date, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .tint(.accent)
                        .onChange(of: date) { _, _ in
                            showDatePicker = false
                        }
                        .padding()
                }
                .padding(.top, 24)
                .presentationDetents([.medium])
                .presentationCornerRadius(24)
            }
            .sheet(isPresented: $addIngredientSheet) {
                selectedIndex = nil
                ingredientName = ""
                amount = 0
                selectedColor = ""
            } content: {
                addGredientSheet
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("취소") {
                        dismiss()
                    }
                    .font(.gmarketSansBody)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("저장") {
                        Haptic.notification(type: .success)
                        saveData()
                        dismiss()
                    }
                    .font(.gmarketSansBody)
                }
            }
        }
    }
    
    private func getNoteData() {
        if let data = note.image {
            if let image = UIImage(data: data) {
                selectedImage = image
            }
        }
        name = note.name
        date = note.date
        type = note.type
        ingredients = note.ingredients
        isIce = note.isIce
        taste = note.taste
        think = note.think
        rating = note.rating
        
        defaultImageName = type.imageName
    }
    
    private func saveData() {
        if let selectedImage {
            note.image = selectedImage.jpegData(compressionQuality: 0.1)
        } else {
            note.image = nil
        }
        note.name = name
        note.date = date
        note.type = type
        note.ingredients = ingredients
        note.isIce = isIce
        note.taste = taste
        note.think = think
        note.rating = rating
        
        try? context.save()
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
                            TextField("재료의 이름을 작성해 주세요", text: $ingredientName)
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
                                    if selectedColor == getColorName(for: ingredientColor.color) {
                                        selectedColor = ""
                                    } else {
                                        selectedColor = getColorName(for: ingredientColor.color)
                                    }
                                } label: {
                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                                        .scaledToFit()
                                        .foregroundColor(ingredientColor.color)
                                        .opacity(selectedColor == getColorName(for: ingredientColor.color) ? 1 : 0.3)
                                        .overlay {
                                            if selectedColor == getColorName(for: ingredientColor.color) {
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
                    let ingredient = CocktailIngredient(name: ingredientName, amount: Double(amount), colorName: selectedColor)
                    withAnimation {
                        if let index = selectedIndex {
                            ingredients[index] = ingredient
                        } else {
                            ingredients.append(ingredient)
                        }
                    }
                    ingredientName = ""
                    amount = 0
                    selectedColor = ""
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .onAppear {
            if let index = selectedIndex {
                DispatchQueue.main.async {
                    ingredientName = ingredients[index].name
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
    
    private func getColorName(for color: Color) -> String {
        if let ingredientColor = cocktailIngredientColors.first(where: { $0.color == color }) {
            return ingredientColor.name
        }
        return "black"
    }
    
    private func getColor(for name: String) -> Color {
        if let ingredientColor = cocktailIngredientColors.first(where: { $0.name == name }) {
            return ingredientColor.color
        }
        return .black
    }
}

#if DEBUG
struct CocktailNoteEditPreview: View {
    @Query private var cocktailNotes: [CocktailNote]
    
    var body: some View {
        CocktailNoteEditView(note: cocktailNotes[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        CocktailNoteEditPreview()
            .modelContainer(previewContainer)
    }
}
#endif
