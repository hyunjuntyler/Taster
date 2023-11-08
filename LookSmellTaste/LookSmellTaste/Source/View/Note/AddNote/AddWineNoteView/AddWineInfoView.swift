//
//  AddWineInfoView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/7/23.
//

import SwiftUI

struct AddWineInfoView: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State private var navigate = false
    @State private var showDatePicker = false
    @State private var showWindTypePicker = false
    @FocusState private var isFocused
    
    @State var text = ""
    @State var date = Date()
    @State var type: WineType = WineType(typeName: "화이트 와인", typeImageName: "whiteWine")
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("기본정보")
                        .font(.gmarketSansTitle)
                        .padding(.bottom)
                    VStack(alignment: .leading) {
                        Text("와인 이름")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack {
                            TextField("와인 이름을 입력해주세요", text: $text)
                                .focused($isFocused)
                                .tint(.accent)
                                .font(.gmarketSansBody)
                            Button {
                                text = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.gray, .appPickerGray)
                                    .font(.title3)
                            }
                            .buttonStyle(PressButtonStyle())
                            .opacity(text.isEmpty ? 0 : 1)
                        }
                        .padding()
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
                            Spacer()
                            Button {
                                isFocused = false
                                showDatePicker = true
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
                        .padding()
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
                                .frame(height: 40)
                            Text(type.typeName)
                                .font(.gmarketSansBody)
                            Spacer()
                            Button {
                                isFocused = false
                                showWindTypePicker = true
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
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                    }
                    .padding(.horizontal)
                }
                NextButton(disabled: false) {
                    navigate = true
                }
            }
        }
        .toolbar {
            CloseButton {
                noteEnvironment.showAlert = true
            }
        }
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
                    ForEach(wineTypes, id: \.typeName) { wine in
                        Button {
                            type = wine
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
    NavigationStack {
        AddWineInfoView()
            .environment(NoteEnvironment())
    }
}
