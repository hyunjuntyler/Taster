//
//  AddCoffeeTasteView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct AddCoffeeTasteView: View {
    @Bindable private var observable = CoffeeNoteObservable.shared
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State private var navigate = false
    
    @State private var taste: [Double] = [0, 0, 0, 0, 0]
    
    private let tasteLabels = ["신맛", "쓴맛", "향미", "단맛", "바디"]
    private let symbolColors: [Color] = [.purple, .orange, .blue, .green, .red]
    
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
                        RadarChart(data: taste, valueList: ["신맛", "바디", "쓴맛", "향미", "단맛"])
                        ForEach(0..<5) { index in
                            Divider()
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
                    Haptic.impact(style: .soft)
                    navigate = true
                }
                .navigationDestination(isPresented: $navigate) {
                    AddCoffeeThinkView()
                }
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
}

#Preview {
    NavigationStack {
        AddCoffeeTasteView()
            .environment(NoteEnvironment())
    }
}
