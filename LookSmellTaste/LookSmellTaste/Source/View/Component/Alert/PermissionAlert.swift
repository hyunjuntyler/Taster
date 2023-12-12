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
            return "camera.fill"
        case .album:
            return "photo"
        case .none:
            return "exclamationmark.triangle.fill"
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
        ZStack {
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
            
            VStack(spacing: 5) {
                Image(systemName: image)
                    .foregroundStyle(.accent)
                    .font(.largeTitle)
                    .padding(.bottom, 5)
                Text(title)
                    .font(.gmarketSansHeadline)
                Text(description)
                    .font(.gmarketSansSubHeadline)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 20)
                
                HStack {
                    Button("돌아가기") {
                        noteEnvironment.showPermissionAlert = false
                        Haptic.impact(style: .soft)
                    }
                    .buttonStyle(AlertButtonStyle(type: .cancel))
                    Button("설정으로") {
                        noteEnvironment.showPermissionAlert = false
                        noteEnvironment.openAppSetting()
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
}

#Preview {
    PermissionAlert()
        .environment(NoteEnvironment())
}
