//
//  ConfigurateWeatherData.swift
//  MyProject
//
//  Created by Марк on 18.06.23.
//

import UIKit

class ConfigurateWeatherData: NSObject {
    lazy var weatherService = WeatherServiсe()
    
    func configure(city: String, completion: @escaping ([String : String], URL?, Error?) -> Void) {
        var url: URL?
        var data: [String: String] = [ : ]
        
        let checkCity = city.contains("Могилев") ? "Могилёв" : city
        
        weatherService.requestWeather(city: checkCity) { result in
            switch result {
            case let .success((json, response)):
                data["cityName"] = response.name
                data["temperatureName"] = "Температура: \(Int(response.main.temp)) °С"
                data["weatherName"] = "Погода:  \(response.weather.first?.description ?? "")"
                data["maxName"] = "Макс. температура: \(Int(response.main.temp_max)) °С"
                data["minName"] = "Мин. температура: \(Int(response.main.temp_min)) °С"
                data["feelName"] = "Ощущается: \(Int(response.main.feels_like)) °С"
                data["humidityName"] = "Влажность: \(Int(response.main.humidity)) %"
                data["presureName"] = "Давление: \(Int(response.main.pressure)) Mb"
                if let icon = response.weather.first?.icon,
                   let iconUrl = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png") {
                    url = iconUrl
                }
                
                completion(data, url, nil)
                
            case let .failure(error):
                completion([:], nil, error)
            }
        }
    }
}
