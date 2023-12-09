//
//  EditImagePicker.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI
import PhotosUI

struct EditImagePicker: View {
    @Binding var selectedImage: UIImage?
    @Binding var permissionDenied: Bool
    
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
                    .font(.gmarketSansCaption)
                    .foregroundStyle(.gray)
                    .frame(maxHeight: .infinity)
                HStack {
                    Button {
                        Haptic.impact(style: .soft)
                        selectedImage = nil
                    } label: {
                        Text("기본")
                            .font(.gmarketSansFootnote)
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
                            .font(.gmarketSansFootnote)
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
                            .font(.gmarketSansFootnote)
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
                    self.permissionDenied = true
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
        ScrollView {
            EditImagePicker(selectedImage: .constant(nil), permissionDenied: .constant(false))
                .padding(.horizontal)
                .padding(.top, 300)
        }
    }
}
