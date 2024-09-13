//
//  AddCoffeeThinkView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct AddCoffeeThinkView: View {
    @Bindable private var observable = CoffeeNoteObservable.shared
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @FocusState private var isFocused

    @State private var think = ""
    @State private var rating = 0.0
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    VStack {
                        Text("Think")
                            .font(.pretendard(.title))
                            .padding(.bottom)
                        Text("더 추가하고 싶은 내용이 있으신가요?")
                            .font(.pretendard(.body))
                            .foregroundStyle(.gray)
                            .padding(.bottom)
                        HStack(alignment: .top, spacing: 3) {
                            TextField("더 추가하고 싶은 내용을 입력해주세요", text: $think, axis: .vertical)
                                .focused($isFocused)
                                .frame(height: 200, alignment: .topLeading)
                                .font(.pretendard(.body))
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
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                        VStack(alignment: .leading) {
                            Text("평점")
                                .font(.pretendard(.subheadline))
                                .foregroundStyle(.gray)
                                .padding(.leading)
                                .padding(.top, 5)
                            HStack {
                                Rating(rating: $rating)
                                Spacer()
                                Text("\(rating, specifier: "%.1f")")
                                    .monospacedDigit()
                                    .animation(nil, value: rating)
                                    .font(.title2)
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
                        .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
                NextButton(label: "작성 완료", disabled: false) {
                    isFocused = false
                    observable.think = think
                    observable.rating = rating
                    withAnimation {
                        noteEnvironment.showCompleteView = true
                    }
                }
            }
            .onTapGesture {
                isFocused = false
            }
        }
        .navigationTitle("")
        .toolbar {
            CloseButton {
                noteEnvironment.showCloseAlert = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddCoffeeThinkView()
            .environment(NoteEnvironment())
    }
}
