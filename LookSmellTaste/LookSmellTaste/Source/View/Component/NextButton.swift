//
//  NextButton.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct NextButton: View {
    var disabled: Bool
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
                        .foregroundStyle(disabled ? .gray : .accent)
                }
                .padding(.horizontal)
                .padding(.bottom)
        }
        .disabled(disabled)
        .animation(.easeInOut, value: disabled)
        .buttonStyle(PressButtonStyle())
    }
}

#Preview {
    NextButton(disabled: false) {
        // action here
    }
}
