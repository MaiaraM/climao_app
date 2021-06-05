//
//  WeatherService.swift
//  weather_app
//
//  Created by Maiara Martins on 04/06/21.
//

import Foundation

class WeatherService {
    let baseURL:String = "http://api.weatherapi.com/v1/forecast.json?key=9ea8f2ab750e4e488ff112629213105&days=10&aqi=yes&q="
    
    func getWeatherInfos(_ city:String, completion: @escaping (WeatherInfo) -> ()){
        guard let url = URL(string: baseURL+city) else {
            print("The Url \(baseURL+city) has a error")
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, response, error ) in
            let infos = try! JSONDecoder().decode(WeatherInfo.self, from: data!)
            DispatchQueue.main.async {
                completion(infos)
            }
        }
        .resume()
    }
}
