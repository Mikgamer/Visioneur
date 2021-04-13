//
//  ThirdViewController.swift
//  Visioneur
//
//  Created by Michael Perard on 09/03/2021.
//  Copyright © 2021 Michael Perard. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var imageMain: UIImageView!
    var imgMain : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Background blur
        view.backgroundColor = UIColor.clear
        let blurBgView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.dark))
        blurBgView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurBgView, at: 0)
        NSLayoutConstraint.activate([
            blurBgView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurBgView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        if imgMain != nil {
            imageMain?.image = imgMain
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(close(_:)))
        view.addGestureRecognizer(tap)

        
    }
    
    @IBAction func close(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func transfertimgmain(imgmain : UIImage) {
        imageMain?.image = imgMain
        imgMain = imgmain
    }
    
    
}
