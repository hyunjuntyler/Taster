//
//  AddWineLookView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/8/23.
//

import SwiftUI

struct AddWineLookView: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State private var columns = Array(repeating: GridItem(.flexible()), count: 4)
    @State private var navigate = false
    
    @State var color: WineColor = wineColors[0]
    
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
                                    Image(wineColor.colorImageName)
                                        .resizable()
                                        .scaledToFit()
                                        .padding(.bottom, 5)
                                    Text(wineColor.colorName)
                                        .font(.gmarketSansSubHeadline)
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
                    Haptic.impact(style: .soft)
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
                noteEnvironment.showAlert = true
                Haptic.impact(style: .soft)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddWineLookView()
            .environment(NoteEnvironment())
    }
}
