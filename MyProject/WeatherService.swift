
import UIKit
import Alamofire

class WeatherServiсe {
    
    private let baseUrl = "api.openweathermap.org/data/2.5/"
    private let apiId = "6f6fa0b266ccd7c09e73b8a6768305ef"
    private let lang = "en"
    private let units = "metric"
    
    private func makeUrl(_ method: String, parameters: [URLQueryItem]) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.path = baseUrl + method
        
        var queryItems = [
            URLQueryItem(name: "appid", value: apiId),
            URLQueryItem(name: "units", value: units),
            URLQueryItem(name: "lang", value: lang)
        ]
        
        queryItems.append(contentsOf: parameters)
        components.queryItems = queryItems
        return components.url
    }
    
    func requestWeather(city: String, completionHandler: ((Result<(String, WeatherResponse), Error>) -> Void)?) {
        
        let parameters = [
            URLQueryItem(name: "q", value: city)
        ]
        
        guard let weatherUrl = makeUrl("weather", parameters: parameters) else {
            DispatchQueue.main.async {
                completionHandler?(.failure(NetworkError.wrongUrl))
            }
            return
        }
        
        AF.request(weatherUrl).responseJSON { responce in
            if let data = responce.data {
                if let jsonString = String(data: data, encoding: .utf8),
                   let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) {
                    DispatchQueue.main.async {
                        completionHandler?(.success((jsonString, weatherResponse)))
                    }
                } else {
                    DispatchQueue.main.async {
                        completionHandler?(.failure(NetworkError.wrongDataRequest))
                    }
                }
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
}


