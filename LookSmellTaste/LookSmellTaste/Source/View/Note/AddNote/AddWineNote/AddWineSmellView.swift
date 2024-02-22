//
//  AddWineSmellView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI

struct AddWineSmellView: View {
    @Bindable private var observable = WineNoteObservable.shared
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @Environment(\.locale) var locale
    
    @State private var navigate = false
    @State private var scents: [WineScent] = []
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 5)
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Smell")
                        .font(.gmarketSansTitle)
                        .padding(.bottom)
                    Text("어떠한 향이 나나요?")
                        .font(.gmarketSansBody)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(wineScents) { wineScent in
                            Button {
                                if scents.contains(wineScent) {
                                    if let index = scents.firstIndex(of: wineScent) {
                                        scents.remove(at: index)
                                    }
                                } else {
                                    scents.append(wineScent)
                                }
                                Haptic.impact(style: .soft)
                            } label: {
                                VStack {
                                    Image(wineScent.imageName)
                                        .resizable()
                                        .scaledToFit()
                                    Text(LocalizedStringKey(wineScent.name))
                                        .font(.gmarketSansCaption2)                 .foregroundStyle(scents.contains(wineScent) ? .accent : .appGrayButton)
                                }
                                .padding(4)
                                .background {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(scents.contains(wineScent) ? .appPickerGray : .appSheetBoxBackground)
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
                    .padding(.bottom)
                }
                NextButton(disabled: false) {
                    observable.scents = scents
                    navigate = true
                }
                .navigationDestination(isPresented: $navigate) {
                    AddWineTasteView()
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
        AddWineSmellView()
            .environment(NoteEnvironment())
            .environment(\.locale, .init(identifier: "ko"))
    }
}

#Preview("English") {
    NavigationStack {
        AddWineSmellView()
            .environment(NoteEnvironment())
            .environment(\.locale, .init(identifier: "en"))
    }
}
