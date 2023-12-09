//
//  SignInView.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 11/25/23.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.modelContext) private var context
    @State private var moveToInput = false
    @State private var moveToThumbnail = false
    @State private var permissionDenied = false
    
    @State private var name = ""
    @State private var icon = ""
    @State private var image: UIImage?
    
    @FocusState var isFocused
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
                .onTapGesture {
                    isFocused = false
                }
            if !moveToInput {
                greet
                    .transition(.opacity)
            } else {
                signIn
                    .transition(.opacity.combined(with: .offset(y: 5)))
                    .overlay {
                        if permissionDenied {
                            SignInPermissionAlert(permissionDenied: $permissionDenied)
                        }
                    }
            }
        }
    }
    
    var greet: some View {
        VStack {
            Text("😍")
                .font(.tossFaceXLarge)
                .padding(.bottom, 5)
            Text("안녕하세요 반가워요!")
                .font(.gmarketSansTitle)
        }
        .padding(.bottom, 50)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeIn(duration: 1)) {
                    moveToInput = true
                }
            }
        }
    }
    
    private var signIn: some View {
        VStack {
            VStack {
                headline
                    .padding(.vertical, 60)
                nameInput
                if moveToThumbnail {
                    thumbnailInput
                        .transition(.opacity.combined(with: .offset(y: 5)))
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            if !moveToThumbnail {
                NextButton(label: "다음", disabled: name.isEmpty) {
                    withAnimation(.easeIn(duration: 0.5)) {
                        moveToThumbnail = true
                    }
                }
            } else {
                NextButton(label: "시작하기", disabled: name.isEmpty || image == nil && icon == "") {
                    withAnimation {
                        if let data = image?.jpegData(compressionQuality: 0.1) {
                            let user = User(name: name, icon: icon)
                            user.image = data
                            context.insert(user)
                        } else {
                            let user = User(name: name, icon: icon)
                            context.insert(user)
                        }
                    }
                }
            }
        }
    }
    
    private var headline: some View {
        VStack {
            Text(moveToThumbnail ? "🥳" : "😌")
                .font(.tossFaceXLarge)
                .padding(.bottom, 5)
            Text(moveToThumbnail ? "반가워요! 썸네일도 설정해주세요." : "어떻게 불러드릴까요?")
                .font(.gmarketSansTitle2)
                .padding(.bottom, 5)
            Text("지금 설정한 정보는 언제나 변경 가능해요")
                .font(.gmarketSansSubHeadline)
                .foregroundStyle(.gray)
        }
    }
    
    private var nameInput: some View {
        HStack {
            TextField("", text: $name, axis: .horizontal)
                .font(.gmarketSansTitle3)
                .focused($isFocused)
                .onAppear {
                    isFocused = true
                }
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
        .overlay(alignment: .leading) {
            Text("닉네임")
                .font(.gmarketSansTitle3)
                .foregroundStyle(.tertiary)
                .padding(.leading)
                .scaleEffect(name.isEmpty ? 1 : 0.8, anchor: .bottomLeading)
                .offset(y: name.isEmpty ? 0 : -40)
                .animation(.easeInOut, value: name.isEmpty)
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    private var thumbnailInput: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("썸네일")
                .font(.gmarketSansTitle3)
                .foregroundStyle(.tertiary)
                .scaleEffect(0.8, anchor: .bottomLeading)
                .padding(.leading)
                .padding(.leading, -2)
            ThumbnailPicker(selectedImage: $image, selectedIcon: $icon, permissionDenied: $permissionDenied)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SignInView()
}
