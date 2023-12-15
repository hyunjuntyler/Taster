//
//  ButtonStyle.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/7/23.
//

import SwiftUI

struct PressButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.bouncy, value: configuration.isPressed)
    }
}

struct TypeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(5)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .foregroundStyle(configuration.isPressed ? .appSheetBackground : .appSheetBoxBackground)
            }
            .padding(.horizontal)
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}
