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


}

