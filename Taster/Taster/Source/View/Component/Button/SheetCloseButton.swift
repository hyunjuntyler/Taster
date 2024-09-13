//
//  SheetCloseButton.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

struct SheetCloseButton: View {
    @Environment(\.dismiss) private var dismiss
    var action: () -> Void
    
    var body: some View {
        Button {
            Haptic.impact(style: .soft)
            dismiss()
            action()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.appGrayButton)
                .padding()
        }
        .buttonStyle(PressButtonStyle())
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    SheetCloseButton {
        
    }
}
