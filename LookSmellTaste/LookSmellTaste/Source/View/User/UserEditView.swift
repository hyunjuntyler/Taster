//
//  UserEditView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/8/23.
//

import SwiftUI
import SwiftData

struct UserEditView: View {
    @Environment(\.modelContext) private var context
    @Query private var users: [User]
    private var user: User? { users.first }
    
    @State private var name = ""
    @State private var icon = ""
    @State private var image: UIImage?
    @State private var permissionDenied = false
        
    @Binding var showUserEditSheet: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appSheetBackground.ignoresSafeArea()
                
                ScrollView {
                    if let image = image {
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
                    } else if !icon.isEmpty {
                        ZStack {
                            Circle()
                                .foregroundStyle(.appListBoxBackground)
                                .frame(width: 100)
                                .padding(.bottom, 5)
                            Text(icon)
                                .font(.tossFaceXXLarge)
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
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("이름 변경")
                            .font(.gmarketSansTitle3)
                            .foregroundStyle(.tertiary)
                            .scaleEffect(0.8, anchor: .bottomLeading)
                            .padding(.leading)
                            .padding(.leading, -2)
                        HStack {
                            TextField("이름을 입력해주세요", text: $name, axis: .horizontal)
                                .onAppear {
                                    if let user = user {
                                        name = user.name
                                    }
                                }
                                .font(.gmarketSansTitle3)
                                .padding(.leading)
                                .padding(.vertical)
                            
                            Button {
                                Haptic.impact(style: .soft)
                                name = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.gray, .appPickerGray)
                                    .font(.title)
                                    .padding(.trailing, 10)
                            }
                            .buttonStyle(PressButtonStyle())
                            .opacity(name.isEmpty ? 0 : 1)
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .foregroundStyle(.appListBoxBackground)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("썸네일 변경")
                            .font(.gmarketSansTitle3)
                            .foregroundStyle(.tertiary)
                            .scaleEffect(0.8, anchor: .bottomLeading)
                            .padding(.leading)
                            .padding(.leading, -2)
                        ThumbnailPicker(selectedImage: $image, selectedIcon: $icon, permissionDenied: $permissionDenied)
                            .onAppear {
                                if let user = user {
                                    if let data = user.image {
                                        image = UIImage(data: data)
                                    } else {
                                        icon = user.icon
                                    }
                                }
                            }
                    }
                    .padding(.horizontal)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showUserEditSheet = false
                    } label: {
                        Text("취소")
                            .font(.gmarketSansBody)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showUserEditSheet = false
                        if let user = user {
                            user.name = name
                            if let data = image?.jpegData(compressionQuality: 0.1) {
                                user.image = data
                            } else {
                                user.image = nil
                                user.icon = icon
                            }
                        }
                    } label: {
                        Text("저장")
                            .font(.gmarketSansBody)
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
        .overlay {
            if permissionDenied {
                SignInPermissionAlert(permissionDenied: $permissionDenied)
            }
        }
    }
}

#Preview {
    UserEditView(showUserEditSheet: .constant(false))
}
