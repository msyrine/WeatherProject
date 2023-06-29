//
//  CityDetailViewModel.swift
//  PSA
//
//  Created by syrine methlouthi on 29/06/2023.
//

import Foundation

protocol WeatherDetailVMDelegate {
    func weatherLoaded()
}

class CityDetailViewModel {
    var delegate: WeatherDetailVMDelegate?
    var weatherData: CityWeather?
    
}
