//
//  CityListTableViewCell.swift
//  PSA
//
//  Created by syrine methlouthi on 29/06/2023.
//

import Foundation
import UIKit

class CityListTableViewCell: UITableViewCell{

    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var weatherDescription: UILabel!
    
    @IBOutlet weak var weatherTemperature: UILabel!
    
    var cityWeather: CityWeather?
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(for cityWeather: CityWeather) {
        self.cityWeather = cityWeather
        setupLabels()
    }
    
    private func setupLabels() {
        cityName.text = cityWeather?.name
        weatherDescription.text = cityWeather?.weather[0].description
        if let temp = cityWeather?.main.temp {
            weatherTemperature.text = "\(temp ) °C"
        }else{
            weatherTemperature.text = "Undefined"
        }
        
    }
    
}
