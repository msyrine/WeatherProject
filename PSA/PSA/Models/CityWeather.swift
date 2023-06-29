//
//  CityWeather.swift
//  PSA
//
//  Created by syrine methlouthi on 29/06/2023.
//

import Foundation


struct CityWeather: Codable {
    
    let weather: [Weather]
    let main: Main
    let name: String
    
    var conditionName: String {
        switch weather[0].id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}

struct Main: Codable{
    let temp: Double
}


struct Weather: Codable{
    let id: Int
    let description: String
}
