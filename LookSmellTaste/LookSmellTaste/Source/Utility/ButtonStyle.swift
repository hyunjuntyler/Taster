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
