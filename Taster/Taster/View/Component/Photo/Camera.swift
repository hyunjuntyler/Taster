//
//  Camera.swift
//  Taster
//
//  Created by hyunjun on 10/22/24.
//

import SwiftUI

struct Camera: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        imagePickerController.sourceType = .camera
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: Camera

        init(parent: Camera) {
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
