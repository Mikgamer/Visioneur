//
//  PhotoCell.swift
//  Visioneur
//
//  Created by Michael Perard on 23/02/2021.
//  Copyright © 2021 Michael Perard. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgViewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure() {
        imgViewCell.backgroundColor = .green
    }
}
