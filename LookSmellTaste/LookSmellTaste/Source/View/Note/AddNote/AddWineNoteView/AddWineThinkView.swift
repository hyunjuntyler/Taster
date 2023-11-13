//
//  Add.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI

struct AddWineThinkView: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State private var showCompleteView = false
    @FocusState private var isFocused

    @State var think = ""
    @State var rating = 0.0
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    VStack {
                        Text("Think")
                            .font(.gmarketSansTitle)
                            .padding(.bottom)
                        Text("더 추가하고 싶은 내용이 있으신가요?")
                            .font(.gmarketSansBody)
                            .foregroundStyle(.gray)
                            .padding(.bottom)
                        HStack(alignment: .top, spacing: 3) {
                            TextField("더 추가하고 싶은 내용을 입력해주세요", text: $think, axis: .vertical)
                                .focused($isFocused)
                                .frame(height: 200, alignment: .topLeading)
                                .font(.gmarketSansBody)
                                .onChange(of: think) { _, _ in
                                    Haptic.impact(style: .soft)
                                }
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
                                .font(.gmarketSansSubHeadline)
                                .foregroundStyle(.gray)
                                .padding(.leading)
                                .padding(.top, 5)
                            HStack {
                                Rating(rating: $rating)
                                Spacer()
                                Text("\(roundedRating, specifier: "%.1f")")
                                    .monospacedDigit()
                                    .animation(nil, value: rating)
                                    .font(.gmarketSansTitle3)
                                    .foregroundStyle(.gray)
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
                NextButton(label: "완료", disabled: false) {
                    isFocused = false
                    Haptic.impact(style: .soft)
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
                Haptic.impact(style: .soft)
            }
        }
    }
    
    private var roundedRating: Double {
        let boundedRating = min(max(rating, 0.0), 5.0)
        return (boundedRating * 2).rounded() / 2
    }
}

#Preview {
    NavigationStack {
        AddWineThinkView()
            .environment(NoteEnvironment())
    }
}
