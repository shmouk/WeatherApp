//
//  ValueType.swift
//  MyProject
//
//  Created by Марк on 18.06.23.
//

import Foundation

typealias ComplitionHandler = (String) -> Void

enum NetworkError: Error, LocalizedError {
    case wrongDataRequest
    case wrongStatusCode
    case wrongUrl
    
    var errorDescription: String? {
        switch self {
        case .wrongDataRequest:
            return "Неудалось распарсить данные"
            
        case .wrongStatusCode:
            return "Неуспешный код ответа"
            
        case .wrongUrl:
            return "Неправильный URL"
        }
    }
}

struct WeatherConditions: Codable {
    let description: String
    let icon: String
}

struct MainConditions: Codable {
    typealias Temperature = Double
    let temp: Temperature
    let temp_min: Temperature
    let temp_max: Temperature
    let feels_like: Temperature
    
    let pressure: Double
    let humidity: Double
}

struct WeatherResponse: Codable {
    let weather: [WeatherConditions]
    let main: MainConditions
    let name: String
}
