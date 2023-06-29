//
//  Environnement.swift
//  PSA
//
//  Created by syrine methlouthi on 29/06/2023.
//

import Foundation

class Environment {
    
    
    func APIBasePath() -> String {
      return "https://api.openweathermap.org/data/2.5/weather?"
    }
    
    func APIKEY() -> String {
            return "&appid=dde69e811b5e1d5c582164f9969fc5e3"
    }
    
     func CityName() -> String {
        return "&q="
    }
    
    func Units() -> String{
        return "&units=metric"
    }
    
    func getPathByCityName(cityName: String) -> String {
        return "\(APIBasePath())\(APIKEY())\(Units())\(CityName())\(cityName)"
    }
}
