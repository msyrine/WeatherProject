//
//  AppRouter.swift
//  PSA
//
//  Created by syrine methlouthi on 29/06/2023.
//

import Foundation
import UIKit

final class AppRouter: Coordinator {
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let viewController = ViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func presentDetailFor(cityWeather: CityWeather) {
        let detailCityWeatherViewController = DetailCityWeatherViewController.instantiate()
        detailCityWeatherViewController.cityWeather = cityWeather
        detailCityWeatherViewController.coordinator = self
        navigationController.pushViewController(detailCityWeatherViewController, animated: true)
        print("instanciated")
    }
}
