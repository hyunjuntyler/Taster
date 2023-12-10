//
//  UserDeleteAlert.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/8/23.
//

import SwiftUI
import SwiftData

struct UserDeleteAlert: View {
    @Environment(\.modelContext) private var context
    @Query private var users: [User]
    private var user: User? { users.first }
    
    @Binding var showDeleteAlert: Bool
    @Binding var navigateToUserView: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            
            VStack(spacing: 5) {
                Image(systemName: "person.crop.circle.badge.exclamationmark.fill")
                    .foregroundStyle(.accent)
                    .font(.largeTitle)
                    .padding(.bottom, 5)
                Text("정말 로그아웃 하시겠어요?")
                    .font(.gmarketSansHeadline)
                Text("모든 노트가 사라져요")
                    .font(.gmarketSansSubHeadline)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 20)
                HStack {
                    Button("돌아가기") {
                        withAnimation {
                            showDeleteAlert = false
                        }
                        Haptic.impact(style: .soft)
                    }
                    .buttonStyle(AlertButtonStyle(type: .cancel))
                    Button("로그아웃") {
                        Haptic.impact(style: .soft)
                        if let user = user {
                            context.delete(user)
                        }
                        navigateToUserView = false
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
            .padding(.bottom, 30)
        }

    }
}

#Preview {
    UserDeleteAlert(showDeleteAlert: .constant(true), navigateToUserView: .constant(true))
}
