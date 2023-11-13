//
//  AddWineSmellView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI

struct AddWineSmellView: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State private var columns = Array(repeating: GridItem(.flexible()), count: 5)
    @State private var navigate = false
    
    @State var scents: [WineScent] = []
    
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
                                    Image(wineScent.scentImageName)
                                        .resizable()
                                        .scaledToFit()
                                    Text(wineScent.scentName)
                                        .font(.gmarketSansCaption2)
                                        .foregroundStyle(scents.contains(wineScent) ? .accent : .appGrayButton)
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
                    Haptic.impact(style: .soft)
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
                noteEnvironment.showAlert = true
                Haptic.impact(style: .soft)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddWineSmellView()
            .environment(NoteEnvironment())
    }
}
