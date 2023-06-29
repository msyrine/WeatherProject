//
//  Service.swift
//  PSA
//
//  Created by syrine methlouthi on 29/06/2023.
//

import Foundation


enum WeatherError: Error {
    case dataNotAvailable
    case noNetWorkAccess
    case inValidURL
    case cannotProcessData
    case invalidResponse
}


struct Service {
    
    static let sharedInstance = Service()
  
    func fetchWeather(cityName: String, completion: @escaping (Result<CityWeather, WeatherError>) -> Void) {
        let urlString = Environment().getPathByCityName(cityName: cityName)
        
      performRequest(with: urlString, completion: completion)
        
    }
    
    func performRequest(with urlString: String, completion: @escaping (Result<CityWeather, WeatherError>) -> Void){
        
         let session = URLSession.shared
        guard let url = URL(string: urlString) else {
            completion(.failure(.inValidURL))
            return
        }
                       
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.cannotProcessData))
                return
            }
            guard response is HTTPURLResponse else{
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.dataNotAvailable))
                return
            }
            let decoder = JSONDecoder()
            do {
                let cityWeather = try? decoder.decode(CityWeather.self, from: data)
                completion(.success(cityWeather!))
            } catch {
                completion(.failure(.cannotProcessData))
            }
         }
        task.resume()
                       
    }
}
