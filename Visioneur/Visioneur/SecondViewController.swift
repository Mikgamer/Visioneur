//
//  SecondViewController.swift
//  Visioneur
//
//  Created by Michael Perard on 03/02/2021.
//  Copyright © 2021 Michael Perard. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    weak var delegate : TransfertImgDelegate?
    
    @IBAction func imgPick() {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self
        present(imagePickerVC, animated: true)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)

        if let image = info[.originalImage] as? UIImage {
            delegate?.transfertimg(imgs: image)
            dismiss(animated: true, completion: nil)
        }
    }
    
    
}
