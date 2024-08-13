//
//  AddCoffeeFlavorView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct AddCoffeeFlavorView: View {
    @Bindable private var observable = CoffeeNoteObservable.shared
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    
    @State private var navigate = false
    @State private var flavors: [CoffeeFlavor] = []
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 5)
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Flavor")
                        .font(.pretendard(.title))
                        .padding(.bottom)
                    Text("어떠한 향과 맛이 나나요?")
                        .font(.pretendard(.body))
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(coffeeFlavors) { coffeeFlavor in
                            Button {
                                if flavors.contains(coffeeFlavor) {
                                    if let index = flavors.firstIndex(of: coffeeFlavor) {
                                        flavors.remove(at: index)
                                    }
                                } else {
                                    flavors.append(coffeeFlavor)
                                }
                                Haptic.impact(style: .soft)
                            } label: {
                                VStack {
                                    Image(coffeeFlavor.imageName)
                                        .resizable()
                                        .scaledToFit()
                                    Text(LocalizedStringKey(coffeeFlavor.name))
                                        .font(.pretendard(.caption2))
                                        .foregroundStyle(flavors.contains(coffeeFlavor) ? .accent : .appGrayButton)
                                }
                                .padding(4)
                                .background {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(flavors.contains(coffeeFlavor) ? .appPickerGray : .appSheetBoxBackground)
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
                    AddCoffeeTasteView()
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
        AddCoffeeFlavorView()
            .environment(NoteEnvironment())
    }
}
