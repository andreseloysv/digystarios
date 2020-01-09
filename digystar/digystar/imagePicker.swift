//
//  imagePicker.swift
//  digystar
//
//  Created by Andres Sanchez Vargas on 09.01.20.
//  Copyright © 2020 digystar. All rights reserved.
//

import SwiftUI
import Combine

class ImagePicker: ObservableObject {
    static let shared: ImagePicker = ImagePicker()
    private init() {}
    
    let view = ImagePicker.View()
    let coordinator = ImagePicker.Coordinator()
    
    let willChange = PassthroughSubject<Image?, Never>()
    @Published var image:Image? = nil {
        didSet{
            if image != nil {
                willChange.send(image)
            }
        }
    }
}

extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate,
    UIImagePickerControllerDelegate {
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
        
        private func imagePickerController(_ picker: UINavigationController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            ImagePicker.shared.image = Image(uiImage: image)
            picker.dismiss(animated: true)
            
            
        }
    }
}

extension ImagePicker {
    struct View : UIViewControllerRepresentable {
        
        func makeCoordinator() -> Coordinator {
            return ImagePicker.shared.coordinator
        }
        
        func makeUIViewController(context:
            UIViewControllerRepresentableContext<ImagePicker.View>) ->
            UIImagePickerController {
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = context.coordinator
                return imagePickerController
        }
    
        func updateUIViewController(_ uiViewController: UIImagePickerController,
            context: UIViewControllerRepresentableContext<ImagePicker.View>) {
        
        }
    }
}
