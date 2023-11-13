//
//  AddWineCompleteView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI

struct AddNoteCompleteView: View {
    @State var counter = 1
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            VStack {
                Text("🎉")
                    .font(.tossFaceLarge)
                    .padding(.bottom)
                Text("성공적으로 기록되었어요")
                    .font(.gmarketSansTitle2)
                    .overlay(confetti)
            }
            .padding(.bottom, 100)
        }
    }
    
    private var confetti: some View {
        Confetti(counter: $counter,
                 num: 80,
                 confettiSize: 6,
                 rainHeight: UIScreen.main.bounds.height,
                 openingAngle: .degrees(60),
                 closingAngle: .degrees(120),
                 radius: UIScreen.main.bounds.width,
                 repetitions: 1,
                 repetitionInterval: 0.5)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    counter += 1
                }
            }
    }
}

#Preview {
    AddNoteCompleteView()
}
