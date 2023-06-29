//
//  DetailCityWeatherViewController.swift
//  PSA
//
//  Created by syrine methlouthi on 29/06/2023.
//

import Foundation
import UIKit

class DetailCityWeatherViewController: UIViewController, Storyboarded{
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    var coordinator: AppRouter?
    var cityWeather: CityWeather?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherLoaded()
    }

}

extension DetailCityWeatherViewController{
    func weatherLoaded() {
        guard let weather = cityWeather else { return }
        self.cityLabel.text = weather.name
        
        self.descriptionLabel.text = weather.weather[0].description
        self.temperatureLabel.text = "\(weather.main.temp) °C"
        
        self.weatherImageView.image = UIImage(systemName: weather.conditionName)
        
    }
    
    
    
}
