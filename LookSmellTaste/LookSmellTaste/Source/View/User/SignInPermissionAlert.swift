//
//  SignInPermissionAlert.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 11/26/23.
//

import SwiftUI

struct SignInPermissionAlert: View {
    @Binding var permissionDenied: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            
            VStack(spacing: 5) {
                Image(systemName: "photo")
                    .foregroundStyle(.gray)
                    .font(.title)
                    .padding(.bottom)
                Text("앨범에 접근할 수 없어요")
                    .font(.gmarketSansHeadline)
                Text("설정에서 앨범 권한을 허용해주세요")
                    .font(.gmarketSansSubHeadline)
                    .padding(.bottom, 20)
                
                HStack {
                    Button("돌아가기") {
                        permissionDenied = false
                        Haptic.impact(style: .soft)
                    }
                    .buttonStyle(AlertButtonStyle(type: .cancel))
                    Button("설정으로") {
                        permissionDenied = false
                        openAppSetting()
                        Haptic.impact(style: .soft)
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
    
    private func openAppSetting() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    SignInPermissionAlert(permissionDenied: .constant(true))
}
