//
//  Alert.swift
//  LookSmellTaste
//
//  Created by hyunjun on 8/13/24.
//

import SwiftUI

struct Alert: View {
    @Binding var isPresented: Bool
    let emoji: String
    let title: String
    let message: String
    let buttonLabel: String
    let actions: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            
            VStack(spacing: 5) {
                Text(emoji)
                    .font(.tossFace(.large))
                Text(title)
                    .font(.pretendard(.headline))
                Text(message)
                    .font(.pretendard(.subheadline))
                    .foregroundStyle(.gray)
                    .padding(.bottom, 20)
                HStack {
                    Button("돌아가기") {
                        Haptic.impact(style: .soft)
                        isPresented = false
                    }
                    .buttonStyle(AlertButtonStyle(type: .cancel))
                    Button(buttonLabel) {
                        Haptic.impact(style: .soft)
                        actions()
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

enum AlertButtonType {
    case destructive
    case cancel
}

struct AlertButtonStyle: ButtonStyle {
    var type: AlertButtonType
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.pretendard(.callout))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(10)
            .background {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .foregroundStyle(type == .cancel ? .appGrayButton : .accent)
            }
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.bouncy, value: configuration.isPressed)
    }
}

#Preview {
    Alert(isPresented: .constant(true), emoji: "💎", title: "제목", message: "메세지", buttonLabel: "버튼라벨") {
        
    }
}
