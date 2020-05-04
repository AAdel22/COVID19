//
//  CountriesVC.swift
//  COVID19
//
//  Created by Alaa Adel on 4/25/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

class CountriesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var countries: [Countries] = [Countries]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        hundleRefreach()
    }
    
    func hundleRefreach() {
        Api.GetCountries { (error: Error?, country: [Countries]?) in
            if let country = country {
                self.countries = country
                
                self.tableView.reloadData()
            }
        }
    }
}

extension CountriesVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        cell.configure(with: countries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cell = cell as! CountryTableViewCell
        if !cell.isAnimated {
            // the init state of the cell
            cell.alpha = 0
            let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
            cell.layer.transform = transform
            
            // animate the cell to the final state
            UIView.animate(withDuration: 1.0) {
                cell.alpha = 1.0
                cell.layer.transform = CATransform3DIdentity
            }
            cell.isAnimated = true
        }
    }
}
