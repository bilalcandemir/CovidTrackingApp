//
//  RecordVideoViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 3/21/21.
//

import UIKit
import MobileCoreServices
import AVKit

class RecordVideoViewController: UIViewController {
    
    var controller = UIImagePickerController()
    let videoFileName = "/video.mp4"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func recordPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            // 2 Present UIImagePickerController to take video
            controller.sourceType = .camera
            controller.mediaTypes = [kUTTypeMovie as String]
            controller.delegate = self
            controller.videoMaximumDuration = 10
            present(controller, animated: true, completion: nil)
        }
        else {
            print("Camera is not available")
        }
    }
}

extension RecordVideoViewController: UIImagePickerControllerDelegate {
    
}

// MARK: - UINavigationControllerDelegate
extension RecordVideoViewController: UINavigationControllerDelegate {
}
