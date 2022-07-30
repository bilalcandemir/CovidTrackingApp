//
//  TakePhotoViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 3/23/21.
//

import UIKit
import AVKit
import MobileCoreServices

class TakePhotoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var btnTakePhoto: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func takePressed(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
                print("No image found")
                return
            }

            // print out the image size as a test
            print(image.size)
    }

}
