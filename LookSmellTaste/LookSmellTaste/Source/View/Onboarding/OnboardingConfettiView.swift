//
//  OnboardingConfettiView.swift
//  LookSmellTaste
//
//  Created by hyunjun on 8/12/24.
//

import SwiftUI

struct OnboardingConfettiView: View {
    @State private var counter = 1
    private let rainHeight = UIScreen.main.bounds.height
    private let radius = UIScreen.main.bounds.width
    
    var body: some View {
        Confetti(counter: $counter,
                 num: 150,
                 confettiSize: 6,
                 rainHeight: rainHeight,
                 openingAngle: .degrees(40),
                 closingAngle: .degrees(140),
                 radius: radius,
                 repetitions: 0)
        .onAppear {
            counter += 1
        }
    }
}

#Preview {
    OnboardingConfettiView()
}
