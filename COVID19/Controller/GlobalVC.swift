//
//  ViewController.swift
//  COVID19
//
//  Created by Alaa Adel on 4/25/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

class GlobalVC: UIViewController {
    
    
    @IBOutlet weak var coronaImageView: UIImageView!
    @IBOutlet weak var recoveredImageView: UIImageView!
    
    @IBOutlet weak var deathsImageView: UIImageView!
    @IBOutlet weak var worldBackgroundView: UIView!
    
    @IBOutlet weak var casesLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    
    var globalInfo: GlobalInfo = GlobalInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designView()
       hundleRefreach()
    }
    func designView() {
        
        worldBackgroundView.layer.cornerRadius = 25
        worldBackgroundView.layer.borderWidth = 3
        worldBackgroundView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        worldBackgroundView.clipsToBounds = true
        
        coronaImageView.layer.cornerRadius = coronaImageView.frame.width / 1.5
        coronaImageView.layer.masksToBounds = true
        
        recoveredImageView.layer.cornerRadius = recoveredImageView.frame.width / 2
        recoveredImageView.layer.masksToBounds = true
        
        deathsImageView.layer.cornerRadius = deathsImageView.frame.width / 2
        deathsImageView.layer.masksToBounds = true
        
    }
    
    func hundleRefreach() {
        Api.GetGlobalInfo { (error: Error?,globaInfo: GlobalInfo?) in
            if let globalInfo = globaInfo {
                self.globalInfo = globalInfo
                self.casesLabel.text = globalInfo.total_cases
                self.recoveredLabel.text = globalInfo.recovery_cases
                self.deathsLabel.text = globalInfo.death_cases
            }
        }
    }
   
}


