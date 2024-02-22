//
//  AddWineView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/13/23.
//

import SwiftUI

struct AddWineNoteView: View {
    @Bindable private var observable = WineNoteObservable.shared
    @State private var showDatePicker = false
    @State private var showTypePicker = false
    @FocusState private var isFocused
    
    @State private var name = ""
    @State private var date = Date()
    @State private var type: WineType = wineTypes[2]
    @State private var image: UIImage?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("와인 이름")
                .font(.gmarketSansSubHeadline)
                .foregroundStyle(.gray)
                .padding(.leading)
                .padding(.top, 5)
            HStack {
                TextField("와인 이름을 입력해주세요", text: $name, axis: .vertical)
                    .font(.gmarketSansBody)
                    .focused($isFocused)
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
                    isFocused = false
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
                Text(LocalizedStringKey(type.name))
                    .font(.gmarketSansBody)
                Spacer()
                Button {
                    isFocused = false
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
            
            Text("대표 이미지")
                .font(.gmarketSansSubHeadline)
                .foregroundStyle(.gray)
                .padding(.leading)
                .padding(.top, 5)
            ImagePicker(selectedImage: $image, defaultImageName: type.imageName)
                .padding(.bottom)
        }
        .padding(.horizontal)
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
                            Haptic.impact(style: .soft)
                            showTypePicker = false
                        } label: {
                            HStack {
                                Image(wine.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 40)
                                Text(LocalizedStringKey(wine.name))
                                    .font(.gmarketSansBody)
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
        .onTapGesture {
            isFocused = false
        }
        .onAppear {
            observable.reset()
        }
        .onDisappear {
            observable.name = name
            observable.date = date
            observable.type = type
            if let image = image {
                observable.image = image.jpegData(compressionQuality: 0.1)
            }
        }
    }
}

#Preview {
    AddNoteView()
        .environment(NoteEnvironment())
}
