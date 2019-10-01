//
//  ViewController.swift
//  cameraTest
//
//  Created by Sabrina Sturtevant on 10/1/19.
//  Copyright © 2019 Sabrina Sturtevant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageViewOutlet: UIImageView!

    
    @IBAction func chooseImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let myActionSheet = UIAlertController(title: "Photo Source", message: "Choose a soure", preferredStyle: .actionSheet)
           
        myActionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                imagePickerController.sourceType = .camera
                         self.present(imagePickerController, animated: true, completion: nil)
            } else {
                print("No Camera Detected")
            }
            
        
        }))
        
        myActionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        myActionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(myActionSheet, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        imageViewOutlet.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    

}

