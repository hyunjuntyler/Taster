//
//  AddWineView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/13/23.
//

import SwiftUI

struct AddWineView: View {
    @State private var showDatePicker = false
    @State private var showWindTypePicker = false
    @FocusState private var isFocused
    
    @State var name = ""
    @State var date = Date()
    @State var type: WineType = wineTypes[2]
    @State var image: UIImage?
    
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
                    .onChange(of: name) { _, _ in
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
                Image(type.typeImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                Text(type.typeName)
                    .font(.gmarketSansBody)
                Spacer()
                Button {
                    isFocused = false
                    showWindTypePicker = true
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
            ImagePicker(selectedImage: $image, defaultImageName: type.typeImageName)
            .padding(.bottom)
        }
        .padding(.horizontal)
        .sheet(isPresented: $showDatePicker) {
            VStack {
                DatePicker("마신 날짜", selection: $date, in: ...Date(), displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .frame(height: 300)
                    .tint(.accent)
                    .padding()
                NextButton(label: "선택 완료") {
                    showDatePicker = false
                }
            }
            .padding(.top, 30)
            .presentationDetents([.medium])
            .presentationCornerRadius(UIScreen.main.displayCornerRadius)
            .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $showWindTypePicker) {
            VStack {
                Text("와인 종류 변경")
                    .font(.gmarketSansBody)
                ScrollView {
                    ForEach(wineTypes) { wine in
                        Button {
                            type = wine
                            Haptic.impact(style: .soft)
                            showWindTypePicker = false
                        } label: {
                            HStack {
                                Image(wine.typeImageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 40)
                                Text(wine.typeName)
                                    .font(.gmarketSansBody)
                            }
                        }
                        .buttonStyle(WineTypeButtonStyle())
                    }
                }
            }
            .padding(.top, 30)
            .presentationDetents([.medium])
            .presentationCornerRadius(UIScreen.main.displayCornerRadius)
            .presentationDragIndicator(.visible)
        }
        .onTapGesture {
            isFocused = false
        }
    }
}

#Preview {
    AddNoteView()
        .environment(NoteEnvironment())
}
