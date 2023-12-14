//
//  AddWhiskeySmellView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

struct AddWhiskeySmellView: View {
    @Bindable private var observable = WhiskeyNoteObservable.shared
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    
    @State private var navigate = false
    @State private var scents: [WhiskeyScent] = []
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 5)
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Flavor")
                        .font(.gmarketSansTitle)
                        .padding(.bottom)
                    Text("어떠한 향이 나나요?")
                        .font(.gmarketSansBody)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(whiskeyScents) { scent in
                            Button {
                                if scents.contains(scent) {
                                    if let index = scents.firstIndex(of: scent) {
                                        scents.remove(at: index)
                                    }
                                } else {
                                    scents.append(scent)
                                }
                                Haptic.impact(style: .soft)
                            } label: {
                                VStack {
                                    Image(scent.imageName)
                                        .resizable()
                                        .scaledToFit()
                                    Text(scent.name)
                                        .font(.gmarketSansCaption2)
                                        .foregroundStyle(scents.contains(scent) ? .accent : .appGrayButton)
                                }
                                .padding(4)
                                .background {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(scents.contains(scent) ? .appPickerGray : .appSheetBoxBackground)
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
                    AddWhiskeyTasteView()
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
        AddWhiskeySmellView()
            .environment(NoteEnvironment())
    }
}
