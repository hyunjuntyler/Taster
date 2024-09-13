//
//  NavigationBar.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI
import SwiftData

enum ViewType: String {
    case note = "노트"
    case share = "공유"
}

struct NavigationTitle: View {
    @Query private var users: [User]
    private var user: User? { users.first }
    
    var type: ViewType = .note
    var scrollOffset = 11.0
    
    @Binding var navigateToUserView: Bool
    
    var body: some View {
        HStack {
            Text(LocalizedStringKey(type.rawValue))
                .font(.pretendard(.largeTitle, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .scaleEffect(min(1 + scrollOffset / 300, 1.2), anchor: .leading)
            if let user = user {
                if let data = user.image {
                    if let image = UIImage(data: data) {
                        Button {
                            navigateToUserView = true
                            Haptic.impact(style: .soft)
                        } label: {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .mask {
                                    Circle()
                                        .frame(width: 30)
                                }
                        }
                    }
                } else {
                    Button {
                        navigateToUserView = true
                        Haptic.impact(style: .soft)
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.appListBoxBackground)
                            Text(user.icon)
                                .font(.tossFace(.regular))
                        }
                        .frame(width: 30)
                        .scaleEffect(min(1 + scrollOffset / 300, 1.2), anchor: .center)
                    }
                }
            } else {
                Circle()
                    .foregroundStyle(.gray.opacity(0.5))
                    .frame(width: 30)
            }
        }
        .padding(.top, 10)
        .opacity(scrollOffset > 10 ? 1 : 0)
        .padding(.horizontal, 20)
    }
}

struct InlineNavigationTitle: View {
    @Query private var users: [User]
    private var user: User? { users.first }
        
    var type: ViewType = .note
    var scrollOffset = 0.0
    
    @Binding var navigateToUserView: Bool
    
    var body: some View {
        HStack {
            Text(LocalizedStringKey(type.rawValue))
                .font(.pretendard(.largeTitle, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            if let user = user {
                if let data = user.image {
                    if let image = UIImage(data: data) {
                        Button {
                            navigateToUserView = true
                            Haptic.impact(style: .soft)
                        } label: {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .mask {
                                    Circle()
                                        .frame(width: 30)
                                }
                        }
                    }
                } else {
                    Button {
                        navigateToUserView = true
                        Haptic.impact(style: .soft)
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.appListBoxBackground)
                            Text(user.icon)
                                .font(.tossFace(.regular))
                        }
                        .frame(width: 30)
                    }
                }
            } else {
                Circle()
                    .foregroundStyle(.gray.opacity(0.5))
                    .frame(width: 30)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 3)
        .background {
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .ignoresSafeArea()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .opacity(scrollOffset < 10.1 ? 1 : 0)
    }
}

#if DEBUG
#Preview { @MainActor in
    ScrollView {
        NavigationTitle(navigateToUserView: .constant(false))
            .modelContainer(previewContainer)
    }
    .overlay {
        InlineNavigationTitle(navigateToUserView: .constant(false))
            .modelContainer(previewContainer)
   }
}
#endif
