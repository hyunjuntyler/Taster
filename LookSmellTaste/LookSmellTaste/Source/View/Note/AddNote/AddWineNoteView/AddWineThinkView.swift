//
//  Add.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI

struct AddWineThinkView: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    @State private var navigate = false
    
    var body: some View {
        ZStack {
            Color.appSheetBackground.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Think")
                        .font(.gmarketSansTitle)
                        .padding(.bottom)
                    Text("와인의 향을 선택해주세요")
                        .font(.gmarketSansBody)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    Text("hello world")
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.appSheetBoxBackground)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                NextButton(label: "완료", disabled: false) {
                    Haptic.impact(style: .soft)
                    navigate = true
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
        AddWineThinkView()
            .environment(NoteEnvironment())
    }
}
