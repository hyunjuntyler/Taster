//
//  ThumbnailPicker.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 11/26/23.
//

import SwiftUI
import PhotosUI

struct ThumbnailPicker: View {
    @State private var columns = Array(repeating: GridItem(.flexible()), count: 6)
    @State private var showImagePicker = false
    @State private var showIconPicker = false
    
    @Binding var selectedImage: UIImage?
    @Binding var selectedIcon: String
    @Binding var permissionDenied: Bool
    
    private let icons = ["😃", "😆", "😚", "🤓", "🥳", "👨", "👩‍🦰", "👧", "👦", "🧑‍💻", "💦", "🍷", "🥃", "🍸", "🍹", "🩷", "❤️", "💚", "🩵", "💙", "⚽️", "🏀", "🎾", "🎱","🇰🇷", "👻", "🤖",  "🐱", "🐰", "🐶", "🦊", "🐻", "🐼", "🐻‍❄️", "🐯", "🐮", "🐷", "🦋", "🐣", "🐥", "🪶", "🎄", "🌱", "🌞", "🌙", "🌼", "⭐️", "✨", "🌏", "🌵", "🐙", "💰", "🛩️", "🌠", "⚔️", "🔑", "🖋️", "🖍️", "🪐", "☃️", "🌩️", "🍭", "🏕️"]
    
    var body: some View {
        HStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(
                        Circle()
                    )
            } else {
                ZStack {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.appPickerGray.opacity(0.5))
                    Text(selectedIcon)
                        .font(.tossFace(.medium))
                }
            }
            
            Spacer()
            
            VStack {
                Text("선택한 이미지는 썸네일 이미지로 활용돼요")
                    .font(.pretendard(.caption))
                    .foregroundStyle(.gray)
                    .padding(.bottom, 5)
                HStack {
                    Button {
                        Haptic.impact(style: .soft)
                        showIconPicker = true
                    } label: {
                        Text("아이콘 고르기")
                            .font(.pretendard(.footnote))
                            .foregroundStyle(.gray)
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .foregroundStyle(.appPickerGray)
                            }
                    }
                    .buttonStyle(PressButtonStyle())
                    
                    Button {
                        Haptic.impact(style: .soft)
                        checkAlbumPermission()
                    } label: {
                        Text("앨범에서 선택")
                            .font(.pretendard(.footnote))
                            .foregroundStyle(.gray)
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .foregroundStyle(.appPickerGray)
                            }
                    }
                    .buttonStyle(PressButtonStyle())
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .foregroundStyle(.appSheetBoxBackground)
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerUI(selectedImage: $selectedImage)
                .ignoresSafeArea()
        }
        .sheet(isPresented: $showIconPicker) {
            iconPicker
                .presentationCornerRadius(24)
        }
    }
    
    private var iconPicker: some View {
        NavigationStack {
            ZStack {
                Color.appSheetBackground.ignoresSafeArea()
                VStack {
                    Text("원하시는 아이콘을 골라주세요")
                        .font(.pretendard(.title3))
                        .padding(.bottom)
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(icons, id: \.self) { icon in
                                Button(icon) {
                                    Haptic.impact(style: .soft)
                                    selectedImage = nil
                                    selectedIcon = icon
                                    showIconPicker = false
                                }
                                .font(.tossFace(.medium))
                                .padding(5)
                                .buttonStyle(PressButtonStyle())
                            }
                        }
                        .padding()
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.appSheetBoxBackground)
                    }
                    .padding(.horizontal)
                }
            }
            .toolbar {
                CloseButton {
                    showIconPicker = false
                }
            }
        }
    }
    
    private func checkAlbumPermission() {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                switch status {
                case .authorized:
                    self.showImagePicker = true
                case .denied, .restricted, .notDetermined:
                    self.permissionDenied = true
                default:
                    break
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.appSheetBackground.ignoresSafeArea()
        ThumbnailPicker(selectedImage: .constant(nil), selectedIcon: .constant("🥰"), permissionDenied: .constant(false))
            .padding(.horizontal)
    }
}
