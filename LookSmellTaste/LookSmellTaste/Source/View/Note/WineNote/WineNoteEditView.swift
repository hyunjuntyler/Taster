//
//  WineNoteEditView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI
import SwiftData

struct WineNoteEditView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var note: WineNote
    
    @State private var selectedImage: UIImage?
    @State private var defaultImageName = ""
    @State private var name = ""
    @State private var date = Date()
    @State private var type: WineType = wineTypes[2]
    @State private var color: WineColor = wineColors[0]
    @State private var scents: [WineScent] = []
    @State private var taste: [Double] = [0, 0, 0, 0, 0]
    @State private var think = ""
    @State private var rating = 0.0
    
    @State private var permissionDenied = false
    @State private var permissionType: PermissionType = .album
    
    @State private var showDatePicker = false
    @State private var showTypePicker = false
    
    private let lookColumns = Array(repeating: GridItem(.flexible()), count: 6)
    private let smellColumns = Array(repeating: GridItem(.flexible()), count: 6)
    private let tasteLabels = ["바디", "당도", "산도", "타닌", "알코올"]
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
                        
                        Text("와인 이름")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack {
                            TextField("와인 이름을 입력해주세요", text: $name, axis: .vertical)
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
                        
                        Text("와인 종류")
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
                        
                        Text("Look")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        LazyVGrid(columns: lookColumns, spacing: 5) {
                            ForEach(wineColors) { wineColor in
                                Button {
                                    withAnimation(.easeInOut) {
                                        color = wineColor
                                    }
                                    Haptic.impact(style: .soft)
                                } label: {
                                    VStack {
                                        Image(wineColor.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .padding(.bottom, 5)
                                        Text(wineColor.name)
                                            .font(.gmarketSansCaption2)
                                            .foregroundStyle(color == wineColor ? .accent : .appGrayButton)
                                    }
                                    .padding(5)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundStyle(color == wineColor ? .appPickerGray : .appSheetBoxBackground)
                                    }
                                }
                                .buttonStyle(PressButtonStyle())
                            }
                        }
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                        
                        Text("Smell")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        LazyVGrid(columns: smellColumns, spacing: 8) {
                            ForEach(wineScents) { wineScent in
                                Button {
                                    if scents.contains(wineScent) {
                                        if let index = scents.firstIndex(of: wineScent) {
                                            scents.remove(at: index)
                                        }
                                    } else {
                                        scents.append(wineScent)
                                    }
                                    Haptic.impact(style: .soft)
                                } label: {
                                    VStack {
                                        Image(wineScent.imageName)
                                            .resizable()
                                            .scaledToFit()
                                        Text(wineScent.name)
                                            .font(.gmarketSansCaption2)
                                            .foregroundStyle(scents.contains(wineScent) ? .accent : .appGrayButton)
                                    }
                                    .padding(4)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundStyle(scents.contains(wineScent) ? .appPickerGray : .appSheetBoxBackground)
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
                            PentagonRadarChart(data: taste, frame: 100)
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
                    Text("와인 종류 변경")
                        .font(.gmarketSansTitle3)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            SheetCloseButton {
                                showTypePicker = false
                            }
                        }
                    ScrollView {
                        ForEach(wineTypes) { wine in
                            Button {
                                type = wine
                                defaultImageName = type.imageName
                                Haptic.impact(style: .soft)
                                showTypePicker = false
                            } label: {
                                HStack {
                                    Image(wine.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                    Text(wine.name)
                                        .font(.gmarketSansBody)
                                }
                            }
                            .buttonStyle(WineTypeButtonStyle())
                        }
                    }
                }
                .padding(.top, 24)
                .presentationDetents([.medium])
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
        color = note.color
        scents = note.scents
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
        note.color = color
        note.scents = scents
        note.taste = taste
        note.think = think
        note.rating = rating
        
        try? context.save()
    }
}

#if DEBUG
struct WineNoteEditPreview: View {
    @Query private var wineNotes: [WineNote]
    
    var body: some View {
        WineNoteEditView(note: wineNotes[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        WineNoteEditPreview()
            .modelContainer(previewContainer)
    }
}
#endif
