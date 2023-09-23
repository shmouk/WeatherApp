//
//  UIImageView + Extension.swift
//  MyProject
//
//  Created by Марк on 18.06.23.
//

import Foundation

import Alamofire

extension UIImageView {
    
    func setImage(_ url: URL?) {
        guard let url = url else {
            image = nil
            return
        }
        AF.request(url).responseJSON { responce in
            DispatchQueue.main.async {
                if let data = responce.data {
                    self.image = UIImage(data: data)
                } else {
                    self.image = nil
                }
            }
        }
    }
    
    func setWeatherImage(_ weather: String) {
        let weatherImages = ["rain", "clouds", "clear", "drizzle"]
    
        for element in weatherImages {
            if weather.contains(element) {
                self.image = UIImage(named: element)
                self.contentMode = .scaleAspectFill
            }
        }
    }
}


