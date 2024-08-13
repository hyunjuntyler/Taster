//
//  AddCocktailTasteView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/12/23.
//

import SwiftUI

struct AddCocktailTasteView: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @Bindable private var observable = CocktailNoteObservable.shared

    @State private var taste: [Double] = [0, 0, 0]
    @State private var navigate = false
    
    private let tasteLabels = ["단맛", "신맛", "도수"]
    private let symbolColors: [Color] = [.orange, .blue, .red]

    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Taste")
                        .font(.pretendard(.title))
                        .padding(.bottom)
                    Text("아래의 내용을 채워주세요")
                        .font(.pretendard(.body))
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    VStack {
                        ForEach(0..<3) { index in
                            HStack {
                                Text(LocalizedStringKey(tasteLabels[index]))
                                    .font(.pretendard(.headline))
                                Spacer()
                                Rating(rating: $taste[index],
                                       symbolName: "circle.fill",
                                       symbolFont: Font.system(size: 24),
                                       symbolColor: symbolColors[index])
                            }
                            if index < 2 {
                                CustomDivider()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
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
                    AddCocktailThinkView()
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
        AddCocktailTasteView()
            .environment(NoteEnvironment())
    }
}
