//
//  CloseButton.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct CloseButton: View {
    var action: () -> Void
    
    var body: some View {
        Button {
            Haptic.notification(type: .warning)
            action()
        } label: {
            Image(systemName: "xmark")
                .foregroundStyle(.accent)
                .fontWeight(.semibold)
        }
        .buttonStyle(PressButtonStyle())
    }
}

#Preview {
    CloseButton {
        // action here
    }
}
