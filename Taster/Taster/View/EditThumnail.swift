//
//  EditThumnail.swift
//  Taster
//
//  Created by hyunjun on 10/22/24.
//

import SwiftUI
import AVFoundation
import Photos

struct EditThumnail: View {
    @Binding var selectedImage: UIImage?
    
    @State private var showCamera = false
    @State private var showAlbum = false
    @State private var showAlert = false
    @State private var alertTitle = "권한이 없습니다."
    @State private var alertMessage = "설정에서 권한을 허용해 주세요"
    
    let category: Category?
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 70, height: 70)
                .foregroundStyle(Color(.systemGroupedBackground))
                .overlay {
                    if let uiImage = selectedImage {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                    } else if let uiImage = category?.uiImage {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
            VStack(alignment: .trailing) {
                Text("선택한 이미지는 썸네일 이미지로 활용돼요")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                HStack {
                    Button {
                        selectedImage = nil
                    } label: {
                        Image(systemName: "rectangle")
                            .font(.title3)
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        checkAlbumPermission()
                    } label: {
                        Image(systemName: "photo")
                            .font(.title3)
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        checkCameraPermission()
                    } label: {
                        Image(systemName: "camera.fill")
                            .font(.title3)
                    }
                    .buttonStyle(.bordered)
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .sheet(isPresented: $showAlbum) {
            PHPicker(selectedImage: $selectedImage)
                .ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $showCamera) {
            Camera(selectedImage: $selectedImage)
                .ignoresSafeArea()
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("설정 가기", role: .destructive) {
                guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
                UIApplication.shared.open(url)
            }
        } message: {
            Text(alertMessage)
        }
    }
    
    private func checkCameraPermission() {
        let cameraStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch cameraStatus {
        case .authorized:
            showCamera = true
        case .notDetermined:
            Task {
                await AVCaptureDevice.requestAccess(for: .video)
                checkCameraPermission()
            }
        default:
            alertTitle = "카메라 권한이 없습니다."
            showAlert = true
        }
    }

    private func checkAlbumPermission() {
        let photoStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        switch photoStatus {
        case .authorized, .limited:
            showAlbum = true
        case .notDetermined:
            Task {
                await PHPhotoLibrary.requestAuthorization(for: .readWrite)
                checkAlbumPermission()
            }
        default:
            alertTitle = "앨범 권한이 없습니다."
            showAlert = true
        }
    }

}

#Preview {
    List {
        EditThumnail(selectedImage: .constant(nil), category: .bourbonWhiskey)
    }
}
