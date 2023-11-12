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
    @State var type: WineType = wineTypes[0]
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Info")
                        .font(.gmarketSansTitle)
                        .padding(.bottom)
                    Text("간단한 정보를 입력해주세요")
                        .font(.gmarketSansBody)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    VStack(alignment: .leading) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .frame(width: 100, height: 100)
                                .foregroundStyle(.appSheetBoxBackground)
                                .frame(maxWidth: .infinity, alignment: .center)
                            Image(type.typeImageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                        }
                        
                        Text("와인 이름")
                            .font(.gmarketSansSubHeadline)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                            .padding(.top, 5)
                        HStack {
                            TextField("와인 이름을 입력해주세요", text: $text, axis: .vertical)
                                .font(.gmarketSansBody)
                                .focused($isFocused)
                                .tint(.accent)
                                .onTapGesture {
                                    Haptic.impact(style: .soft)
                                }
                                .onChange(of: text) { _, _ in
                                    Haptic.impact(style: .soft)
                                }
                            Button {
                                Haptic.impact(style: .soft)
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
                                .frame(height: 40)
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
                    }
                    .padding(.horizontal)
                }
                
                Text("와인 이름을 입력해주세요")
                    .font(.gmarketSansCaption)
                    .foregroundStyle(.gray)
                    .transition(.opacity)
                    .opacity(text.isEmpty ? 1 : 0)
                    .animation(.bouncy, value: noteEnvironment.noteType)
                    .padding(.bottom, 5)
                
                NextButton(disabled: text.isEmpty) {
                    Haptic.impact(style: .soft)
                    navigate = true
                }
                .navigationDestination(isPresented: $navigate) {
                    AddWineLookView()
                }
            }
        }
        .navigationTitle("")
        .toolbar {
            CloseButton {
                noteEnvironment.showAlert = true
                Haptic.impact(style: .soft)
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
    NavigationStack {
        AddWineInfoView()
            .environment(NoteEnvironment())
    }
}
