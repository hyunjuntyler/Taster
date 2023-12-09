//
//  DeleteButton.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct DeleteButton: View {
    var label = "삭제"
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .foregroundStyle(.accent)
                .font(.gmarketSansButton)
                .frame(maxWidth: .infinity)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .foregroundStyle(.appListBoxBackground)
                }
        }
        .buttonStyle(PressButtonStyle())
    }
}

#Preview {
    ZStack {
        Color.appBackground.ignoresSafeArea()
        
        DeleteButton {
            
        }
        .padding(.horizontal)
    }
}
