//
//  CoffeeNoteEditView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI
import SwiftData

struct CoffeeNoteEditView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var note: CoffeeNote
    
    @State private var selectedImage: UIImage?
    @State private var defaultImageName = ""
    @State private var name = ""
    @State private var date = Date()
    @State private var type: CoffeeType = coffeeTypes[0]
    @State private var flavors: [CoffeeFlavor] = []
    @State private var taste: [Double] = [0, 0, 0, 0, 0]
    @State private var think = ""
    @State private var rating = 0.0
    
    @State private var permissionDenied = false
    @State private var permissionType: PermissionType = .album
    
    @State private var showDatePicker = false
    @State private var showTypePicker = false
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 6)
    private let tasteLabels = ["신맛", "쓴맛", "향미", "단맛", "바디"]
    private let symbolColors: [Color] = [.purple, .orange, .blue, .green, .red]
    
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
                        
                        Text("커피 이름")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack {
                            TextField("커피 이름을 입력해주세요", text: $name, axis: .vertical)
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
                        
                        Text("커피 종류")
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
                                showTypePicker = true
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
                        .padding(8)
                        .frame(height: 60)
                        .background {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                        
                        Text("Flavor")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(coffeeFlavors) { coffeeFlavor in
                                Button {
                                    if flavors.contains(coffeeFlavor) {
                                        if let index = flavors.firstIndex(of: coffeeFlavor) {
                                            flavors.remove(at: index)
                                        }
                                    } else {
                                        flavors.append(coffeeFlavor)
                                    }
                                    Haptic.impact(style: .soft)
                                } label: {
                                    VStack {
                                        Image(coffeeFlavor.imageName)
                                            .resizable()
                                            .scaledToFit()
                                        Text(coffeeFlavor.name)
                                            .font(.gmarketSansCaption2)
                                            .foregroundStyle(flavors.contains(coffeeFlavor) ? .accent : .appGrayButton)
                                    }
                                    .padding(4)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundStyle(flavors.contains(coffeeFlavor) ? .appPickerGray : .appSheetBoxBackground)
                                    }
                                }
                                .buttonStyle(PressButtonStyle())
                            }
                        }
                        .padding()
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
                            PentagonRadarChart(data: taste, valueList: ["신맛", "바디", "쓴맛", "향미", "단맛"], frame: 100)
                                .padding(.top, 30)
                                .padding(.bottom, 10)
                            ForEach(0..<5) { index in
                                CustomDivider()
                                HStack {
                                    Text(tasteLabels[index])
                                        .font(.gmarketSansCallout)
                                    Spacer()
                                    Rating(rating: $taste[index],
                                           symbolName: "circle.fill",
                                           symbolFont: Font.title3,
                                           symbolColor: symbolColors[index])
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 10)
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
            .sheet(isPresented: $showTypePicker) {
                VStack {
                    Text("커피 종류 변경")
                        .font(.gmarketSansTitle3)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            SheetCloseButton {
                                showTypePicker = false
                            }
                        }
                    ScrollView {
                        ForEach(coffeeTypes) { coffee in
                            Button {
                                type = coffee
                                defaultImageName = type.imageName
                                Haptic.impact(style: .soft)
                                showTypePicker = false
                            } label: {
                                HStack {
                                    Image(coffee.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                    Text(coffee.name)
                                        .font(.gmarketSansBody)
                                }
                            }
                            .buttonStyle(TypeButtonStyle())
                        }
                    }
                }
                .padding(.top, 24)
                .presentationDetents([.height(300)])
                .presentationCornerRadius(24)
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
        flavors = note.flavors
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
        note.flavors = flavors
        note.taste = taste
        note.think = think
        note.rating = rating
        
        try? context.save()
    }
}

#if DEBUG
struct CoffeeNoteEditPreview: View {
    @Query private var coffeeNotes: [CoffeeNote]
    
    var body: some View {
        CoffeeNoteEditView(note: coffeeNotes[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        CoffeeNoteEditPreview()
            .modelContainer(previewContainer)
    }
}
#endif
