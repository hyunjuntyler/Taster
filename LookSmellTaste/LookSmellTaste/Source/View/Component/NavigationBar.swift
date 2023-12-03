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
            Text(type.rawValue)
                .font(.gmarketSansLargeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .scaleEffect(min(1 + scrollOffset / 300, 1.2), anchor: .leading)
            if let user = user {
                if let data = user.image {
                    if let image = UIImage(data: data) {
                        Button {
                            navigateToUserView = true
                        } label: {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .mask {
                                    Circle()
                                        .frame(width: 30)
                                }
                        }
                    }
                } else {
                    Button {
                        navigateToUserView = true
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.gray.opacity(0.5))
                            Text(user.icon)
                                .font(.tossFaceMedium)
                        }
                        .frame(width: 30)
                        .scaleEffect(min(1 + scrollOffset / 300, 1.2), anchor: .trailing)
                    }
                }
            }
        }
        .padding(.top, 10)
        .opacity(scrollOffset > 10 ? 1 : 0)
        .padding(.leading, 20)
        .padding(.trailing, 15)
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
            Text(type.rawValue)
                .font(.gmarketSansLargeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
            if let user = user {
                if let data = user.image {
                    if let image = UIImage(data: data) {
                        Button {
                            navigateToUserView = true
                        } label: {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .mask {
                                    Circle()
                                        .frame(width: 30)
                                }
                        }
                    }
                } else {
                    Button {
                        navigateToUserView = true
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.gray.opacity(0.5))
                            Text(user.icon)
                                .font(.tossFaceMedium)
                        }
                        .frame(width: 30)
                    }
                }
            }
        }
        .padding(.leading, 20)
        .padding(.trailing, 15)
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

#Preview {
    ScrollView {
        NavigationTitle(navigateToUserView: .constant(false))
    }
    .overlay {
        InlineNavigationTitle(navigateToUserView: .constant(false))
   }
}
