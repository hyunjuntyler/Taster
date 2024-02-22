//
//  AddWineLookView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/8/23.
//

import SwiftUI

struct AddWineLookView: View {
    @Bindable private var observable = WineNoteObservable.shared
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @Environment(\.locale) var locale
    
    @State private var navigate = false
    @State private var color: WineColor = wineColors[0]
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Look")
                        .font(.gmarketSansTitle)
                        .padding(.bottom)
                    Text("와인의 색상을 선택해주세요")
                        .font(.gmarketSansBody)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    LazyVGrid(columns: columns, spacing: 0) {
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
                                    Text(LocalizedStringKey(wineColor.name))
                                        .font(locale == .init(identifier: "ko") ? .gmarketSansSubHeadline : .gmarketSansCaption2)
                                        .foregroundStyle(color == wineColor ? .accent : .appGrayButton)
                                }
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(color == wineColor ? .appPickerGray : .appSheetBoxBackground)
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
                    .padding(.horizontal)
                }
                NextButton(disabled: false) {
                    observable.color = color
                    navigate = true
                }
                .navigationDestination(isPresented: $navigate) {
                    AddWineSmellView()
                }
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
        AddWineLookView()
            .environment(NoteEnvironment())
            .environment(\.locale, .init(identifier: "en"))
    }
}
