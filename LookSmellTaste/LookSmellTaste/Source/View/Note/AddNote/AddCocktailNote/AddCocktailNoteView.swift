//
//  AddCocktailNoteView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/10/23.
//

import SwiftUI

struct AddCocktailNoteView: View {
    @Bindable private var observable = CocktailNoteObservable.shared
    @State private var showDatePicker = false
    @FocusState private var isFocused
    
    @State private var name = ""
    @State private var date = Date()
    @State private var type: CocktailType = cocktailTypes[0]
    @State private var image: UIImage?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("칵테일 이름")
                .font(.pretendard(.subheadline))
                .foregroundStyle(.gray)
                .padding(.leading)
                .padding(.top, 5)
            HStack {
                TextField("칵테일 이름을 입력해주세요", text: $name, axis: .vertical)
                    .font(.pretendard(.body))
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
                    isFocused = false
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
            
            Text("칵테일 종류")
                .font(.pretendard(.subheadline))
                .foregroundStyle(.gray)
                .padding(.leading)
                .padding(.top, 5)
            HStack {
                Image(type.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                Text(LocalizedStringKey(type.name))
                    .font(.pretendard(.body))
                Spacer()
                Button {
                    withAnimation {
                        isFocused = false
                        type = cocktailTypes[0]
                    }
                    Haptic.impact(style: .soft)
                } label: {
                    Text("홈")
                        .font(.pretendard(.footnote))
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
                        isFocused = false
                        type = cocktailTypes[1]
                    }
                    Haptic.impact(style: .soft)
                } label: {
                    Text("칵테일 바")
                        .font(.pretendard(.footnote))
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
            
            Text("대표 이미지")
                .font(.pretendard(.subheadline))
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
