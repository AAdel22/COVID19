//
//  CountriesVC.swift
//  COVID19
//
//  Created by Alaa Adel on 4/25/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

class CountriesVC: UIViewController {

    @IBOutlet weak var countrySearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var countries: [Countries] = [Countries]()
    
    private var refreshController:UIRefreshControl = UIRefreshControl()
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var searchQuery: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfigure()
    }
    
    func viewConfigure() {
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        
        countrySearchBar.delegate = self
        countrySearchBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        countrySearchBar.layer.borderWidth = 2
        countrySearchBar.layer.cornerRadius = 20
        countrySearchBar.returnKeyType = .search
        
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshController.addTarget(self, action: #selector(refreshTheTableView), for: UIControlEvents.valueChanged)
        self.tableView.refreshControl = refreshController
        self.tableView.addSubview(refreshController)
        
        loadCountry()
    }
    func startActivityIndicator(){
        
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        //        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopActivityIndicator(){
        activityIndicator.stopAnimating()
        //        UIApplication.shared.endIgnoringInteractionEvents()
        
    }
    @objc func refreshTheTableView(){
        self.countrySearchBar.text = nil
        self.loadCountry()
        self.refreshController.endRefreshing()
    }
    func loadCountry() {
        startActivityIndicator()
        Api.GetCountries { (error: Error?, country: [Countries]?) in
            if let country = country {
                self.countries = country
                
                self.tableView.reloadData()
                self.stopActivityIndicator()
            }
        }
    }
    func searchCountries() {
        Api.GetSearchCountry(query: searchQuery) { (error: Error?, country: [Countries]?) in
            if let country = country {
                self.countries = country
                
                self.tableView.reloadData()
            }
        }
    }
}

extension CountriesVC: UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if let queryTerm = searchBar.text, queryTerm.trimmingCharacters(in: [" "]) != ""{
            
            self.countries.removeAll()
            
            self.searchQuery = queryTerm
            
            searchCountries()
        }
        self.view.endEditing(true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        cell.configure(with: countries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
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
