//
//  NextButton.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct NextButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("다음")
                .foregroundStyle(.background)
                .font(.gmarketSansButton)
                .frame(maxWidth: .infinity)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .foregroundStyle(.accent)
                }
                .padding(.horizontal)
                .padding(.bottom)
        }
        .buttonStyle(NextButtonStyle())
    }
}

struct NextButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.bouncy, value: configuration.isPressed)
    }
}

#Preview {
    NextButton { 
        // action here
    }
}
