//
//  DeleteButton.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct DeleteButton: View {
    var label = "삭제하기"
    var action: () -> Void
    
    var body: some View {
        Button {
            Haptic.notification(type: .warning)
            action()
        } label: {
            HStack {
                Image(systemName: "trash.fill")
                    .font(.callout)
                Text(label)
                    .font(.gmarketSansCallout)
            }
            .foregroundStyle(.accent)
            .frame(maxWidth: .infinity)
            .padding(12)
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
