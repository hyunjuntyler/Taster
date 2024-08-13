//
//  ImagePicker.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/14/23.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    
    @Binding var selectedImage: UIImage?
    
    @State var showCamera = false
    @State var showImagePicker = false
    
    var defaultImageName: String = ""
    
    var body: some View {
        HStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                    )
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.appPickerGray)
                    Image(defaultImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                }
            }
            
            Spacer()
            
            VStack {
                Text("선택한 이미지는 썸네일 이미지로 활용돼요")
                    .font(.pretendard(.caption))
                    .foregroundStyle(.gray)
                    .lineSpacing(5)
                    .frame(maxHeight: .infinity)
                HStack {
                    Button {
                        Haptic.impact(style: .soft)
                        selectedImage = nil
                    } label: {
                        Text("기본")
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
                    
                    Button {
                        Haptic.impact(style: .soft)
                        checkCameraPermission()
                    } label: {
                        Text("사진찍기")
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
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundStyle(.appSheetBoxBackground)
        }
        .fullScreenCover(isPresented: $showCamera) {
            ImagePickerUI(selectedImage: $selectedImage, sourceType: .camera)
                .ignoresSafeArea()
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerUI(selectedImage: $selectedImage)
                .ignoresSafeArea()
        }
    }
    
    private func checkCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                if granted {
                    self.showCamera = true
                } else {
                    noteEnvironment.showPermissionAlert = true
                    noteEnvironment.permissionType = .camera
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
                    noteEnvironment.showPermissionAlert = true
                    noteEnvironment.permissionType = .album
                default:
                    break
                }
            }
        }
    }
}

#Preview("Korean") {
    ZStack {
        Color.appSheetBackground.ignoresSafeArea()
        ScrollView {
            ImagePicker(selectedImage: .constant(nil))
                .padding(.horizontal)
                .padding(.top, 300)
                .environment(NoteEnvironment())
                .environment(\.locale, .init(identifier: "ko"))
        }
    }
}

#Preview("English") {
    ZStack {
        Color.appSheetBackground.ignoresSafeArea()
        ScrollView {
            ImagePicker(selectedImage: .constant(nil))
                .padding(.horizontal)
                .padding(.top, 300)
                .environment(NoteEnvironment())
                .environment(\.locale, .init(identifier: "en"))
        }
    }
}
