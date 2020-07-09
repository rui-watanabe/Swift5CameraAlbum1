//
//  ViewController.swift
//  Swift5CameraAlbum1
//
//  Created by watar on 2020/07/08.
//  Copyright © 2020 rui watanabe. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var backImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PHPhotoLibrary.requestAuthorization{ (status) in
            switch(status)
            {
            case .authorized:
                print("authorized")
                
            case .denied:
                print("denied")
                
            case .notDetermined:
                print("not determined")
                
            case .restricted:
                print("restricted")
            }
        }
    }

    @IBAction func openCamera(_ sender: Any) {
        let sourceType = UIImagePickerController.SourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            let cameraPicker = UIImagePickerController()
            
            cameraPicker.sourceType = sourceType
            
            cameraPicker.delegate = self
            
            cameraPicker.allowsEditing = true
            
            present(cameraPicker, animated: true, completion: nil)
        }
        else
        {
            print("error")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func oprnAlbum(_ sender: Any) {
        let sourceType = UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            let cameraPicker = UIImagePickerController()
            
            cameraPicker.sourceType = sourceType
            
            cameraPicker.delegate = self
            
            cameraPicker.allowsEditing = true
            
            present(cameraPicker, animated: true, completion: nil)
        }
        else
        {
            print("error")
        }
    }
    
    //called when taked a photo or picked photo from album
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.editedImage] as? UIImage
        {
            backImageView.image = pickedImage
            
            // savaed photo
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, nil, nil)
            
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func share(_ sender: Any) {
        let text = "#tamridokoro"
        let image = backImageView.image?.jpegData(compressionQuality: 0.2)
        let items = [text, image] as [Any]
        
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
}

