//
//  CloseAlert.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct CloseAlert: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 5) {
                Text("정말 작성을 종료하시겠어요?")
                    .font(.gmarketSansHeadline)
                Text("작성된 내용은 저장되지 않아요")
                    .font(.gmarketSansSubHeadline)
                    .padding(.bottom, 20)
                HStack {
                    Button("돌아가기") {
                        noteEnvironment.showAlert = false
                    }
                    .buttonStyle(AlertButtonStyle(type: .cancel))
                    Button("종료하기") {
                        noteEnvironment.showAlert = false
                        noteEnvironment.addNote = false
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
            .font(.gmarketSansCallout)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(10)
            .background {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .foregroundStyle(type == .cancel ? .appGrayButton : .accent)
            }
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.bouncy, value: configuration.isPressed)
    }
}

#Preview {
    CloseAlert()
        .environment(NoteEnvironment())
}
