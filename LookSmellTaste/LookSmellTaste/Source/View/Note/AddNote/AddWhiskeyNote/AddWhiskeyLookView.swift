//
//  AddWhiskeyLookView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

struct AddWhiskeyLookView: View {
    @Bindable private var observable = WhiskeyNoteObservable.shared
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @Environment(\.locale) var locale

    @State private var navigate = false
    @State private var color: WhiskeyColor = whiskeyColors[0]
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Look")
                        .font(.gmarketSansTitle)
                        .padding(.bottom)
                    Text("위스키의 색상을 선택해주세요")
                        .font(.gmarketSansBody)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    LazyVGrid(columns: columns, spacing: 0) {
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
                                    Text(LocalizedStringKey(whiskeyColor.name))
                                        .font(locale == .init(identifier: "ko") ? .gmarketSansSubHeadline : .gmarketSansCaption2)
                                        .foregroundStyle(color == whiskeyColor ? .accent : .appGrayButton)
                                }
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(color == whiskeyColor ? .appPickerGray : .appSheetBoxBackground)
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
                    AddWhiskeyFlavorView()
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

#Preview("Korean") {
    NavigationStack {
        AddWhiskeyLookView()
            .environment(NoteEnvironment())
            .environment(\.locale, .init(identifier: "ko"))
    }
}

#Preview("English") {
    NavigationStack {
        AddWhiskeyLookView()
            .environment(NoteEnvironment())
            .environment(\.locale, .init(identifier: "en"))
    }
}
