//
//  NetworkServiece.swift
//  COVID19
//
//  Created by Alaa Adel on 4/25/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Api {
    
    class func GetGlobalInfo(completion: @escaping (_ error: Error?,_ globaInfo: GlobalInfo?)-> Void) {
        let url = "https://corona-virus-stats.herokuapp.com/api/v1/cases/general-stats"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                completion(error, nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                if json["data"] != JSON.null {
                    let data = json["data"]
                    
                    let dataObject = GlobalInfo(last_update: data["last_update"].string, total_cases: data["total_cases"].string, recovery_cases: data["recovery_cases"].string, death_cases: data["death_cases"].string)
                    
                    completion(nil,dataObject)
                }
                
            }
        }
    }
    
    class func GetCountries(completion: @escaping (_ error: Error?,_ country: [Countries]?)-> Void) {
        let url = "https://corona-virus-stats.herokuapp.com/api/v1/cases/countries-search?limit=219&page=1"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                completion(error, nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                guard let dataArr = json["data"]["rows"].array else {
                    completion(nil,nil)
                    return
                }
                
                var countries = [Countries]()
                
                for data in dataArr {
                    guard let data = data.dictionary else {return}
                    let country = Countries()
                    country.country = data["country"]?.string ?? ""
                    country.totalCases = data["total_cases"]?.string ?? ""
                    country.totalDeaths = data["total_deaths"]?.string ?? ""
                    country.totalRecovered = data["total_recovered"]?.string ?? ""
                    country.flag = data["flag"]?.string ?? ""
                    countries.append(country)
                }
                completion(nil,countries)
                
            }
        }
    }
    
    class func GetSearchCountry(query: String,completion: @escaping (_ error: Error?,_ country: [Countries]?)-> Void) {
        let url = "https://corona-virus-stats.herokuapp.com/api/v1/cases/countries-search?search=\(query)"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result {
            case .failure(let error):
                completion(error, nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                guard let dataArr = json["data"]["rows"].array else {
                    completion(nil,nil)
                    return
                }
                
                var countries = [Countries]()
                
                for data in dataArr {
                    guard let data = data.dictionary else {return}
                    let country = Countries()
                    country.country = data["country"]?.string ?? ""
                    country.totalCases = data["total_cases"]?.string ?? ""
                    country.totalDeaths = data["total_deaths"]?.string ?? ""
                    country.totalRecovered = data["total_recovered"]?.string ?? ""
                    country.flag = data["flag"]?.string ?? ""
                    countries.append(country)
                }
                completion(nil,countries)
            }
        }
    }
    
}
