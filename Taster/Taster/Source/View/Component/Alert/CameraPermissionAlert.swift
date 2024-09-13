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
            return "📷"
        case .album:
            return "🖼️"
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
        Alert(
            isPresented: $showPermissionAlert,
            emoji: image,
            title: title,
            message: description,
            buttonLabel: "설정으로") {
                showPermissionAlert = false
                openAppSetting()
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
