//
//  AddWineTasteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI

struct AddWineTasteView: View {
    @Bindable private var observable = WineNoteObservable.shared
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State private var navigate = false
    
    @State var taste: [Double] = [0, 0, 0, 0, 0]
    
    private let tasteLabels = ["바디", "당도", "산도", "타닌", "알코올"]
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
                        RadarChart(data: taste)
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
                    AddWineThinkView()
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
        AddWineTasteView()
            .environment(NoteEnvironment())
    }
}
