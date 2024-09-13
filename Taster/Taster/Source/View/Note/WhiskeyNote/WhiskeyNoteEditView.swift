//
//  WhiskeyNoteEditView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI
import SwiftData

struct WhiskeyNoteEditView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var note: WhiskeyNote
    
    @State private var selectedImage: UIImage?
    @State private var defaultImageName = ""
    @State private var name = ""
    @State private var date = Date()
    @State private var type: WhiskeyType = whiskeyTypes[2]
    @State private var color: WhiskeyColor = whiskeyColors[0]
    @State private var flavors: [WhiskeyFlavor] = []
    @State private var taste: [Double] = [0, 0, 0, 0, 0, 0]
    @State private var think = ""
    @State private var rating = 0.0
    
    @State private var permissionDenied = false
    @State private var permissionType: PermissionType = .album
    
    @State private var showDatePicker = false
    @State private var showTypePicker = false
    
    private let lookColumns = Array(repeating: GridItem(.flexible()), count: 6)
    private let flavorColumns = Array(repeating: GridItem(.flexible()), count: 6)
    private let tasteLabels = ["FRUIT", "SWEET", "SPICE", "HERBAL", "GRAIN", "OAK"]
    private let symbolColors: [Color] = [.purple, .orange, .red, .green, .blue, .brown]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackground.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("대표 이미지")
                            .font(.pretendard(.subheadline))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        EditImagePicker(selectedImage: $selectedImage, permissionDenied: $permissionDenied, permissionType: $permissionType, defaultImageName: defaultImageName)
                        
                        Text("와인 이름")
                            .font(.pretendard(.subheadline))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack {
                            TextField("와인 이름을 입력해주세요", text: $name, axis: .vertical)
                                .font(.pretendard(.body))
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
                            .font(.pretendard(.subheadline))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack {
                            Text("\(date.formatted(date: .complete, time: .omitted))")
                                .font(.pretendard(.body))
                                .onChange(of: date) { _, _ in
                                    Haptic.impact(style: .soft)
                                }
                            Spacer()
                            Button {
                                showDatePicker = true
                                Haptic.impact(style: .soft)
                            } label: {
                                Text("바꾸기")
                                    .font(.pretendard(.footnote))
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
                        
                        Text("위스키 종류")
                            .font(.pretendard(.subheadline))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            Text(type.name)
                                .font(.pretendard(.body))
                            Spacer()
                            Button {
                                showTypePicker = true
                                Haptic.impact(style: .soft)
                            } label: {
                                Text("바꾸기")
                                    .font(.pretendard(.footnote))
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
                            .font(.pretendard(.subheadline))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        LazyVGrid(columns: lookColumns, spacing: 5) {
                            ForEach(whiskeyColors) { whiskeyColor in
                                Button {
                                    withAnimation(.easeInOut) {
                                        color = whiskeyColor
                                    }
                                    Haptic.impact(style: .soft)
                                } label: {
                                    VStack {
                                        Image(whiskeyColor.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .padding(.bottom, 5)
                                        Text(whiskeyColor.name)
                                            .font(.pretendard(.caption2))
                                            .foregroundStyle(color == whiskeyColor ? .accent : .appGrayButton)
                                    }
                                    .padding(5)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundStyle(color == whiskeyColor ? .appPickerGray : .appSheetBoxBackground)
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
                        
                        Text("Flavor")
                            .font(.pretendard(.subheadline))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        LazyVGrid(columns: flavorColumns, spacing: 8) {
                            ForEach(whiskeyFlavors) { whiskeyFlavor in
                                Button {
                                    if flavors.contains(whiskeyFlavor) {
                                        if let index = flavors.firstIndex(of: whiskeyFlavor) {
                                            flavors.remove(at: index)
                                        }
                                    } else {
                                        flavors.append(whiskeyFlavor)
                                    }
                                    Haptic.impact(style: .soft)
                                } label: {
                                    VStack {
                                        Image(whiskeyFlavor.imageName)
                                            .resizable()
                                            .scaledToFit()
                                        Text(whiskeyFlavor.name)
                                            .font(.pretendard(.caption2))
                                            .foregroundStyle(flavors.contains(whiskeyFlavor) ? .accent : .appGrayButton)
                                    }
                                    .padding(4)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundStyle(flavors.contains(whiskeyFlavor) ? .appPickerGray : .appSheetBoxBackground)
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
                            .font(.pretendard(.subheadline))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        VStack {
                            HexagonRadarChart(data: taste, frame: 100)
                                .padding(.top, 30)
                                .padding(.bottom, 15)
                            ForEach(0..<5) { index in
                                CustomDivider()
                                HStack {
                                    Text(tasteLabels[index])
                                        .font(.pretendard(.callout))
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
                            .font(.pretendard(.subheadline))
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack(alignment: .top, spacing: 3) {
                            TextField("더 추가하고 싶은 내용을 입력해주세요", text: $think, axis: .vertical)
                                .frame(height: 150, alignment: .topLeading)
                                .font(.pretendard(.callout))
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
                            .font(.pretendard(.subheadline))
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
                        .font(.pretendard(.title3))
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
                    Text("위스키 종류 변경")
                        .font(.pretendard(.title3))
                        .frame(maxWidth: .infinity)
                        .overlay {
                            SheetCloseButton {
                                showTypePicker = false
                            }
                        }
                    ScrollView {
                        ForEach(whiskeyTypes) { whiskeyType in
                            Button {
                                type = whiskeyType
                                defaultImageName = type.imageName
                                Haptic.impact(style: .soft)
                                showTypePicker = false
                            } label: {
                                HStack {
                                    Image(whiskeyType.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                    Text(whiskeyType.name)
                                        .font(.pretendard(.body))
                                }
                            }
                            .buttonStyle(TypeButtonStyle())
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
                    .font(.pretendard(.body))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("저장") {
                        Haptic.notification(type: .success)
                        saveData()
                        dismiss()
                    }
                    .font(.pretendard(.body))
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
        note.color = color
        note.flavors = flavors
        note.taste = taste
        note.think = think
        note.rating = rating
        
        try? context.save()
    }
}

#if DEBUG
struct WhiskeyNoteEditPreview: View {
    @Query private var whiskeyNotes: [WhiskeyNote]
    
    var body: some View {
        WhiskeyNoteEditView(note: whiskeyNotes[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        WhiskeyNoteEditPreview()
            .modelContainer(previewContainer)
    }
}
#endif
