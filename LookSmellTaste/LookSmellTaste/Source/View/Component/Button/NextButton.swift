//
//  NextButton.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct NextButton: View {
    var label = "다음"
    var disabled = false
    var action: () -> Void
    
    var body: some View {
        Button {
            Haptic.impact(style: .soft)
            action()
        } label: {
            Text(LocalizedStringKey(label))
                .foregroundStyle(.background)
                .font(.pretendard(.body, weight: .medium))
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
    NextButton {
        // action here
    }
}
