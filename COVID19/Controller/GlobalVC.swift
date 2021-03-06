//
//  ViewController.swift
//  COVID19
//
//  Created by Alaa Adel on 4/25/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

class GlobalVC: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var refreshControl = UIRefreshControl()
    
    @IBOutlet weak var lastUbdateLabel: UILabel!
    
    @IBOutlet weak var coronaImageView: UIImageView!
    @IBOutlet weak var recoveredImageView: UIImageView!
    @IBOutlet weak var deathsImageView: UIImageView!
    
    @IBOutlet weak var worldBackgroundView: UIView!
    
    @IBOutlet weak var casesLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    
//    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var globalInfo: GlobalInfo = GlobalInfo()
    
    private var refreshController:UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        activityIndicator.center = self.view.center
//        activityIndicator.hidesWhenStopped = true
//        activityIndicator.activityIndicatorViewStyle = .gray
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        self.scrollView.isScrollEnabled = true
        self.scrollView.alwaysBounceVertical = true
        scrollView.addSubview(refreshControl)
        hundleRefreach()
        viewDesign()
    }
//    func startActivityIndicator(){
//        self.view.addSubview(activityIndicator)
//        activityIndicator.startAnimating()
//    }
//
//    func stopActivityIndicator(){
//        activityIndicator.stopAnimating()
//    }
    @objc func refresh(sender:AnyObject) {
        // Code to refresh table view

        self.hundleRefreach()
        refreshControl.endRefreshing()

    }

    func viewDesign() {
        
        
        worldBackgroundView.layer.cornerRadius = 25
        worldBackgroundView.layer.borderWidth = 3
        worldBackgroundView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        worldBackgroundView.clipsToBounds = true
        worldBackgroundView.backgroundColor = #colorLiteral(red: 0.00140971283, green: 0.5991161466, blue: 0.8007747531, alpha: 1)
        coronaImageView.layer.cornerRadius = coronaImageView.frame.width / 1.5
        coronaImageView.layer.masksToBounds = true
        
        recoveredImageView.layer.cornerRadius = recoveredImageView.frame.width / 2
        recoveredImageView.layer.masksToBounds = true
        
        deathsImageView.layer.cornerRadius = deathsImageView.frame.width / 2
        deathsImageView.layer.masksToBounds = true
    }
    func hundleRefreach() {
//        startActivityIndicator()
        Api.GetGlobalInfo { (error: Error?,globaInfo: GlobalInfo?) in
            if let globalInfo = globaInfo {
                self.globalInfo = globalInfo
                self.lastUbdateLabel.text = globalInfo.last_update
                self.casesLabel.text = globalInfo.total_cases
                self.recoveredLabel.text = globalInfo.recovery_cases
                self.deathsLabel.text = globalInfo.death_cases
//                self.stopActivityIndicator()
            }
            
        }
    }
   
}


