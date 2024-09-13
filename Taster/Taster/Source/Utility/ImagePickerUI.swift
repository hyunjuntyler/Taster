//
//  ImagePickerUI.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/14/23.
//

import SwiftUI

struct ImagePickerUI: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        imagePickerController.sourceType = sourceType
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerUI

        init(parent: ImagePickerUI) {
            self.parent = parent
        }

        func imagePickerController(
           _ picker: UIImagePickerController,
           didFinishPickingMediaWithInfo
           info: [UIImagePickerController.InfoKey: Any]
        ) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = selectedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

