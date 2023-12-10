//
//  CameraPermissionAlert.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct CameraPermissionAlert: View {
    @Binding var showPermissionAlert: Bool
    var type: PermissionType
    
    var image: String {
        switch type {
        case .camera:
            return "camera.fill"
        case .album:
            return "photo"
        }
    }
    
    var title: String {
        switch type {
        case .camera:
            return "카메라에 접근할 수 없어요"
        case .album:
            return "앨범에 접근할 수 없어요"
        }
    }
    
    var description: String {
        switch type {
        case .camera:
            return "설정에서 카메라 권한을 허용해주세요"
        case .album:
            return "설정에서 앨범 권한을 허용해주세요"
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            
            VStack(spacing: 5) {
                Image(systemName: image)
                    .foregroundStyle(.accent)
                    .font(.title)
                    .padding(.bottom)
                Text(title)
                    .font(.gmarketSansHeadline)
                Text(description)
                    .font(.gmarketSansSubHeadline)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 20)
                
                HStack {
                    Button("돌아가기") {
                        showPermissionAlert = false
                        Haptic.impact(style: .soft)
                    }
                    .buttonStyle(AlertButtonStyle(type: .cancel))
                    Button("설정으로") {
                        showPermissionAlert = false
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
    CameraPermissionAlert(showPermissionAlert: .constant(true), type: .album)
}
