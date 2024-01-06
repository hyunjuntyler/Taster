//
//  UserView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/6/23.
//

import SwiftUI
import SwiftData

struct UserView: View {
    @Environment(\.modelContext) private var context
    @Query private var users: [User]
    private var user: User? { users.first }
    
    @State private var showDeleteAlert = false
    @State private var showUserEditSheet = false
    
    @Binding var navigateToUserView: Bool
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            ScrollView {
                if let user = user {
                    if let data = user.image {
                        if let image = UIImage(data: data) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .mask {
                                    Circle()
                                        .frame(width: 100)
                                }
                                .padding(.bottom, 5)
                                .padding(.top)
                        }
                    } else {
                        ZStack {
                            Circle()
                                .foregroundStyle(.appListBoxBackground)
                                .padding(.bottom, 5)
                            Text(user.icon)
                                .font(.tossFaceXXLarge)
                        }
                        .frame(width: 100)
                        .padding(.top)
                    }
                } else {
                    ZStack {
                        Circle()
                            .foregroundStyle(.appListBoxBackground)
                            .frame(width: 100)
                            .padding(.bottom, 5)
                        Text("🤢")
                            .font(.tossFaceXXLarge)
                    }
                    .padding(.top)
                }
                
                Text(user?.name ?? "이름 없음")
                    .font(.gmarketSansTitle3)
                
                Button {
                    showUserEditSheet = true
                    Haptic.impact(style: .soft)
                } label: {
                    Text("정보수정")
                        .font(.gmarketSansBody)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                        .padding()
                }
                .buttonStyle(PressButtonStyle())
                
                Button {
                    withAnimation {
                        showDeleteAlert = true
                    }
                    Haptic.notification(type: .warning)
                } label: {
                    Text("로그아웃")
                        .font(.gmarketSansBody)
                        .foregroundStyle(.accent)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.appSheetBoxBackground)
                        }
                        .padding(.horizontal)
                }
                .buttonStyle(PressButtonStyle())
            }
        }
        .sheet(isPresented: $showUserEditSheet) {
            UserEditView(showUserEditSheet: $showUserEditSheet)
                .presentationCornerRadius(24)
        }
        .overlay {
            if showDeleteAlert {
                UserDeleteAlert(showDeleteAlert: $showDeleteAlert, navigateToUserView: $navigateToUserView)
            }
        }
    }
}

#Preview {
    UserView(navigateToUserView: .constant(true))
}
