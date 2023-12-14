//
//  AddWhiskeyFlavorView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

struct AddWhiskeyFlavorView: View {
    @Bindable private var observable = WhiskeyNoteObservable.shared
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    
    @State private var navigate = false
    @State private var flavors: [WhiskeyFlavor] = []
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 5)
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Flavor")
                        .font(.gmarketSansTitle)
                        .padding(.bottom)
                    Text("어떠한 향과 맛이 나나요?")
                        .font(.gmarketSansBody)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(whiskeyFlavors) { scent in
                            Button {
                                if flavors.contains(scent) {
                                    if let index = flavors.firstIndex(of: scent) {
                                        flavors.remove(at: index)
                                    }
                                } else {
                                    flavors.append(scent)
                                }
                                Haptic.impact(style: .soft)
                            } label: {
                                VStack {
                                    Image(scent.imageName)
                                        .resizable()
                                        .scaledToFit()
                                    Text(scent.name)
                                        .font(.gmarketSansCaption2)
                                        .foregroundStyle(flavors.contains(scent) ? .accent : .appGrayButton)
                                }
                                .padding(4)
                                .background {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(flavors.contains(scent) ? .appPickerGray : .appSheetBoxBackground)
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
                    observable.flavors = flavors
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
        AddWhiskeyFlavorView()
            .environment(NoteEnvironment())
    }
}
