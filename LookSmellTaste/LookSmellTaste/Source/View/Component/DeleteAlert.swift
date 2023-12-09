//
//  DeleteAlert.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct DeleteAlert: View {
    @Binding var showDeleteAlert: Bool
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            
            VStack(spacing: 5) {
                Text("🗑️")
                    .font(.tossFaceXLarge)
                    .padding(.bottom, 5)
                Text("정말 노트를 삭제하시겠어요?")
                    .font(.gmarketSansHeadline)
                    .padding(.bottom, 20)
                HStack {
                    Button("돌아가기") {
                        showDeleteAlert = false
                        Haptic.impact(style: .soft)
                    }
                    .buttonStyle(AlertButtonStyle(type: .cancel))
                    Button("삭제하기") {
                        Haptic.impact(style: .soft)
                        action()
                    }
                    .buttonStyle(AlertButtonStyle(type: .destructive))
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundStyle(.appAlertBackground)
            }
            .padding(.horizontal, 50)
            .padding(.bottom)
        }
    }
}

#Preview {
    DeleteAlert(showDeleteAlert: .constant(true)) {
        // action here
    }
}
