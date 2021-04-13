//
//  ViewController.swift
//  Visioneur
//
//  Created by Michael Perard on 03/02/2021.
//  Copyright © 2021 Michael Perard. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, TransfertImgDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var deleteButton: UIButton!
    
    var tabs : [Data] = [Data]()
    let defaults = UserDefaults.standard
    
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Delete Button
        // deleteButton.setTitle("0", for: .normal)
        // if let images = defaults.object(forKey: "Tab") as? [Data] {
         //    self.tabs = images
         //    DispatchQueue.main.async {
         //        self.deleteButton.setTitle(String(self.tabs.count), for: .normal)
         //        self.collectionView.reloadData()
        //     }
        // } else { deleteButton.setTitle("eror", for: .normal) }
        
        // Gestion du Tap de l'image
        let tap = UITapGestureRecognizer(target: self, action: #selector(gesture(_:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        collectionView?.addGestureRecognizer(tap)
        
    }
    
    
    // Gestion du Tap de l'image
    @IBAction func gesture(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: collectionView)
        if let indexPath = collectionView?.indexPathForItem(at: point) {
            print(#function, indexPath)
            let img = tabs[indexPath.row]
            let imageImp = UIImage(data: img)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let thirdViewController = storyboard.instantiateViewController(withIdentifier:"ThirdViewController") as! ThirdViewController
            thirdViewController.modalPresentationStyle = .overCurrentContext
            thirdViewController.transfertimgmain(imgmain : imageImp!)
            self.present(thirdViewController, animated: true, completion: nil)
        }
    }
    
    
    // Génération des images dans le CollectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2) }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return tabs.count }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell", for: indexPath) as! ImgCollectionViewCell
        let img = tabs[indexPath.row]
        let imgUI = UIImage(data: img)
        cell.imgCell.image = imgUI
        return cell
    }
    
    
    // Delete Button (supprime les données)
    @IBAction func ImgAff() {
        defaults.removeObject(forKey: "Tab")
        defaults.synchronize()
        tabs = [Data]()
        DispatchQueue.main.async { self.collectionView.reloadData() }
    }
    
    
    // Ouverture du SecondViewController pour choisir une image
    @IBAction func buttonPress() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier:"SecondViewController") as! SecondViewController
        secondViewController.delegate = self
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    
    // Récupère l'image ajoutée
    func transfertimg(imgs : UIImage) {
        let imgsdata = imgs.jpegData(compressionQuality: 0.1)
        if imgsdata != nil {
            tabs.append(imgsdata!)
            defaults.set(tabs, forKey: "Tab")
            defaults.synchronize()
        }
        DispatchQueue.main.async { self.collectionView.reloadData() }
    }
    

}


// Bouttons ronds
@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
        self.layer.cornerRadius = cornerRadius
        }
    }
}

protocol TransfertImgDelegate : class {
    func transfertimg(imgs : UIImage)
}
