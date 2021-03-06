//
//  CountryTableViewCell.swift
//  COVID19
//
//  Created by Alaa Adel on 5/4/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit
import Kingfisher

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var casesLabel: UILabel!
    @IBOutlet weak var newCasesLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var countryBackgroundView: UIView!
    
    var isAnimated = false
    
    override func awakeFromNib() {
        super.awakeFromNib()

        cellDesign()
    }
    func cellDesign() {
        
        self.countryBackgroundView.layer.cornerRadius = 25
        self.countryBackgroundView.layer.borderWidth = 3
        self.countryBackgroundView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.countryBackgroundView.clipsToBounds = true
        self.countryBackgroundView.backgroundColor = #colorLiteral(red: 0.00140971283, green: 0.5991161466, blue: 0.8007747531, alpha: 1)
    }

    func configure(with data: Countries){
        
        self.flagImageView.kf.setImage(with: URL(string: data.flag ?? ""))
        self.countryNameLabel.text = data.country
        self.casesLabel.text = data.totalCases
        self.newCasesLabel.text = data.newCases
        self.deathsLabel.text = data.totalDeaths
        self.newDeathsLabel.text = data.newDeaths
        self.recoveredLabel.text = data.totalRecovered
    }

}
