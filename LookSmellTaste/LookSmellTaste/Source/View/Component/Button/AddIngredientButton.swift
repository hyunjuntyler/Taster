//
//  AddIngredientButton.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/13/23.
//

import SwiftUI

struct AddIngredientButton: View {
    var action: () -> Void
    
    var body: some View {
        Button {
            Haptic.impact(style: .soft)
            action()
        } label: {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.title3)
                Text("재료 추가하기")
                    .font(.pretendard(.body))
            }
            .foregroundStyle(.accent)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 5)
        }
        .buttonStyle(PressButtonStyle())
    }
}

#Preview {
    AddIngredientButton {
        // action here
    }
}
