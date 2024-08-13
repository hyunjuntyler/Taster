//
//  PermissionAlert.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/14/23.
//

import SwiftUI

enum PermissionType: String {
    case camera = "카메라"
    case album = "앨범"
}

struct PermissionAlert: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    
    var image: String {
        switch noteEnvironment.permissionType {
        case .camera:
            return "📷"
        case .album:
            return "🖼️"
        case .none:
            return "⚠️"
        }
    }
    
    var title: String {
        switch noteEnvironment.permissionType {
        case .camera:
            return "카메라에 접근할 수 없어요"
        case .album:
            return "앨범에 접근할 수 없어요"
        case .none:
            return "알 수 없는 오류"
        }
    }
    
    var description: String {
        switch noteEnvironment.permissionType {
        case .camera:
            return "설정에서 카메라 권한을 허용해주세요"
        case .album:
            return "설정에서 앨범 권한을 허용해주세요"
        case .none:
            return "알 수 없는 오류가 발생했습니다"
        }
    }
    
    var body: some View {
        @Bindable var noteEnvironment = noteEnvironment
        Alert(
            isPresented: $noteEnvironment.showCloseAlert,
            emoji: image,
            title: title,
            message: description,
            buttonLabel: "설정으로") {
                noteEnvironment.showPermissionAlert = false
                noteEnvironment.openAppSetting()
            }
    }
}

#Preview {
    PermissionAlert()
        .environment(NoteEnvironment())
}
