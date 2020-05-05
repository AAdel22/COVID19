//
//  AboutVC.swift
//  COVID19
//
//  Created by Alaa Adel on 4/25/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var imageViewOne: UIImageView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet weak var imageViewThree: UIImageView!
    @IBOutlet weak var imageViewFour: UIImageView!
    
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var imageViewFive: UIImageView!
    @IBOutlet weak var imageViewSix: UIImageView!
    @IBOutlet weak var imageViewSeven: UIImageView!
    @IBOutlet weak var imageViewEight: UIImageView!
    @IBOutlet weak var imageViewNine: UIImageView!
    @IBOutlet weak var imageViewTen: UIImageView!
    @IBOutlet weak var imageViewEle: UIImageView!
    @IBOutlet weak var imageViewTe: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewOne.layer.cornerRadius = 25
        viewOne.layer.borderWidth = 3
        viewOne.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewOne.clipsToBounds = true
        
        viewTwo.layer.cornerRadius = 25
        viewTwo.layer.borderWidth = 3
        viewTwo.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewTwo.clipsToBounds = true
        
        imageViewOne.layer.cornerRadius = 25
        imageViewOne.clipsToBounds = true
        
        imageViewTwo.layer.cornerRadius = 25
        imageViewTwo.clipsToBounds = true
        
        imageViewThree.layer.cornerRadius = 25
        imageViewThree.clipsToBounds = true
        
        imageViewFour.layer.cornerRadius = 25
        imageViewFour.clipsToBounds = true
        
        imageViewFive.layer.cornerRadius = 25
        imageViewFive.clipsToBounds = true
        
        imageViewSix.layer.cornerRadius = 25
        imageViewSix.clipsToBounds = true
        
        imageViewSeven.layer.cornerRadius = 25
        imageViewSeven.clipsToBounds = true
        
        imageViewEight.layer.cornerRadius = 25
        imageViewEight.clipsToBounds = true
        
        imageViewNine.layer.cornerRadius = 25
        imageViewNine.clipsToBounds = true
        
        imageViewTen.layer.cornerRadius = 25
        imageViewTen.clipsToBounds = true
        
        imageViewEle.layer.cornerRadius = 25
        imageViewEle.clipsToBounds = true
        
        imageViewTe.layer.cornerRadius = 25
        imageViewTe.clipsToBounds = true
        
    }
}
