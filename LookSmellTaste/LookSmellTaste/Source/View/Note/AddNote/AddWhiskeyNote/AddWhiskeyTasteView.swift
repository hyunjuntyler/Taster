//
//  AddWhiskeyTasteView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

struct AddWhiskeyTasteView: View {
    @Bindable private var observable = WhiskeyNoteObservable.shared
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State private var navigate = false
    
    @State private var taste: [Double] = [0, 0, 0, 0, 0, 0]
    
    private let tasteLabels = ["FRUIT", "SWEET", "SPICE", "HERBAL", "GRAIN", "OAK"]
    private let symbolColors: [Color] = [.purple, .orange, .red, .green, .blue, .brown]
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Taste")
                        .font(.gmarketSansTitle)
                        .padding(.bottom)
                    Text("아래의 차트를 채워주세요")
                        .font(.gmarketSansBody)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    VStack {
                        HexagonRadarChart(data: taste)
                            .padding(.bottom, 24)
                        ForEach(0..<6) { index in
                            CustomDivider()
                            HStack {
                                Text(tasteLabels[index])
                                    .font(.gmarketSansHeadline)
                                Spacer()
                                Rating(rating: $taste[index],
                                       symbolName: "circle.fill",
                                       symbolFont: Font.system(size: 24),
                                       symbolColor: symbolColors[index])
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 40)
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.appSheetBoxBackground)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                NextButton(disabled: false) {
                    observable.taste = taste
                    navigate = true
                }
                .navigationDestination(isPresented: $navigate) {
                    AddWhiskeyThinkView()
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
        AddWhiskeyTasteView()
            .environment(NoteEnvironment())
    }
}
