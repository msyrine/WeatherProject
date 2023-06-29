//
//  CityListViewModel.swift
//  PSA
//
//  Created by syrine methlouthi on 29/06/2023.
//

import Foundation


protocol CityListDelegate {
    func fetchCityWeather(_ data: CityWeather)
}


class CityListViewModel {
    
    var delegate: CityListDelegate?
    let service: Service = Service.sharedInstance
    var cityWeatherListArray = [CityWeather]()
    var reloadUI: () -> Void = { }
    
    var isLoading: Bool = false {
        didSet {
            self.reloadUI()
        }
    }

    func fetchCiyWeatherData(cityName: String){
        isLoading = true
            service.fetchWeather(cityName: cityName) { [weak self] result in
                switch result {
                case .success(let cityWeather):
                    DispatchQueue.main.async {
                        self?.cityWeatherListArray.append(cityWeather)
                        self?.isLoading = true
                    }
                case .failure(let errors):
                    print(errors)
                }
            }

        
    }
}
