//
//  ExtensionVC.swift
//  MyProject
//
//  Created by Марк on 17.06.23.
//
import UIKit

extension MainTabBarController {
    
    func setupConstraints() {
     
//        NSLayoutConstraint.activate([
//            buttonOnTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
//            buttonOnTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
//            buttonOnTabBar.topAnchor.constraint(equalTo: tabBar.topAnchor),
//            buttonOnTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
//        ])
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension ViewController {
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            weatherStateChangerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherStateChangerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherStateChangerImage.topAnchor.constraint(equalTo: view.topAnchor),
            weatherStateChangerImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 37),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            containerStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            containerStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20)
        ])
        
        
        NSLayoutConstraint.activate([
            cityView.heightAnchor.constraint(equalToConstant: view.frame.height / 10)
        ])
        
        NSLayoutConstraint.activate([
            temperatureWeatherView.heightAnchor.constraint(equalToConstant: view.frame.height / 4)
        ])
        
        NSLayoutConstraint.activate([
            feelView.heightAnchor.constraint(equalToConstant: view.frame.height / 8)
        ])
        
        
        NSLayoutConstraint.activate([
            minMaxView.heightAnchor.constraint(equalToConstant: view.frame.height / 8)
        ])
        
        NSLayoutConstraint.activate([
            humidityPresureView.heightAnchor.constraint(equalToConstant: view.frame.height / 8)
        ])
        
        NSLayoutConstraint.activate([
            weatherImage.topAnchor.constraint(equalTo: temperatureWeatherView.topAnchor),
            weatherImage.leadingAnchor.constraint(equalTo: temperatureWeatherView.leadingAnchor),
            weatherImage.trailingAnchor.constraint(equalTo: temperatureWeatherView.trailingAnchor),
            weatherImage.heightAnchor.constraint(equalToConstant: temperatureWeatherView.frame.height * 0.8)
            
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: cityView.topAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: cityView.leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: cityView.trailingAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: cityView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor),
            temperatureLabel.leadingAnchor.constraint(equalTo: temperatureWeatherView.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: temperatureWeatherView.trailingAnchor),
            temperatureLabel.heightAnchor.constraint(equalToConstant: temperatureWeatherView.frame.height * 0.3)
        ])
        
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            weatherLabel.leadingAnchor.constraint(equalTo: temperatureWeatherView.leadingAnchor),
            weatherLabel.trailingAnchor.constraint(equalTo: temperatureWeatherView.trailingAnchor),
            weatherLabel.bottomAnchor.constraint(equalTo: temperatureWeatherView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            feelLabel.topAnchor.constraint(equalTo: feelView.topAnchor),
            feelLabel.leadingAnchor.constraint(equalTo: feelView.leadingAnchor),
            feelLabel.trailingAnchor.constraint(equalTo: feelView.trailingAnchor),
            feelLabel.bottomAnchor.constraint(equalTo: feelView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            maxLabel.topAnchor.constraint(equalTo: minMaxView.topAnchor),
            maxLabel.leadingAnchor.constraint(equalTo: minMaxView.leadingAnchor),
            maxLabel.trailingAnchor.constraint(equalTo: minMaxView.trailingAnchor),
            maxLabel.heightAnchor.constraint(equalToConstant: minMaxView.frame.height / 2)
        ])
        
        NSLayoutConstraint.activate([
            minLabel.topAnchor.constraint(equalTo: maxLabel.bottomAnchor),
            minLabel.leadingAnchor.constraint(equalTo: minMaxView.leadingAnchor),
            minLabel.trailingAnchor.constraint(equalTo: minMaxView.trailingAnchor),
            minLabel.bottomAnchor.constraint(equalTo: minMaxView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            humidityLabel.topAnchor.constraint(equalTo: humidityPresureView.topAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: humidityPresureView.leadingAnchor),
            humidityLabel.trailingAnchor.constraint(equalTo: humidityPresureView.trailingAnchor),
            humidityLabel.heightAnchor.constraint(equalToConstant: humidityPresureView.frame.height / 2)
            
        ])
        
        NSLayoutConstraint.activate([
            presureLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor),
            presureLabel.leadingAnchor.constraint(equalTo: humidityPresureView.leadingAnchor),
            presureLabel.trailingAnchor.constraint(equalTo: humidityPresureView.trailingAnchor),
            presureLabel.bottomAnchor.constraint(equalTo: humidityPresureView.bottomAnchor)
        ])
        
        
    }
}
extension SecondViewController {
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 37),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            containerStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            containerStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20)
        ])
        
        
        NSLayoutConstraint.activate([
            cityView.heightAnchor.constraint(equalToConstant: view.frame.height / 10)
        ])
        
        NSLayoutConstraint.activate([
            temperatureWeatherView.heightAnchor.constraint(equalToConstant: view.frame.height / 4)
        ])
        
        NSLayoutConstraint.activate([
            minMaxView.heightAnchor.constraint(equalToConstant: view.frame.height / 8)
        ])
        
        NSLayoutConstraint.activate([
            feelView.heightAnchor.constraint(equalToConstant: view.frame.height / 8)
        ])
        
        NSLayoutConstraint.activate([
            humidityPresureView.heightAnchor.constraint(equalToConstant: view.frame.height / 8)
        ])
        
        NSLayoutConstraint.activate([
            weatherImage.topAnchor.constraint(equalTo: temperatureWeatherView.topAnchor),
            weatherImage.leadingAnchor.constraint(equalTo: temperatureWeatherView.leadingAnchor, constant: 10),
            weatherImage.trailingAnchor.constraint(equalTo: temperatureWeatherView.trailingAnchor, constant: -10),
            weatherImage.heightAnchor.constraint(equalToConstant: temperatureWeatherView.frame.height * 0.8)
            
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: cityView.topAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: cityView.leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: cityView.trailingAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: cityView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            changeDataButton.topAnchor.constraint(equalTo: cityView.topAnchor, constant: 55),
            changeDataButton.leadingAnchor.constraint(equalTo: cityView.leadingAnchor),
            changeDataButton.trailingAnchor.constraint(equalTo: cityView.trailingAnchor),
            changeDataButton.bottomAnchor.constraint(equalTo: cityView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor),
            temperatureLabel.leadingAnchor.constraint(equalTo: temperatureWeatherView.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: temperatureWeatherView.trailingAnchor),
            temperatureLabel.heightAnchor.constraint(equalToConstant: temperatureWeatherView.frame.height * 0.3)
        ])
        
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            weatherLabel.leadingAnchor.constraint(equalTo: temperatureWeatherView.leadingAnchor),
            weatherLabel.trailingAnchor.constraint(equalTo: temperatureWeatherView.trailingAnchor),
            weatherLabel.bottomAnchor.constraint(equalTo: temperatureWeatherView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            feelLabel.topAnchor.constraint(equalTo: feelView.topAnchor),
            feelLabel.leadingAnchor.constraint(equalTo: feelView.leadingAnchor),
            feelLabel.trailingAnchor.constraint(equalTo: feelView.trailingAnchor),
            feelLabel.bottomAnchor.constraint(equalTo: feelView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            maxLabel.topAnchor.constraint(equalTo: minMaxView.topAnchor),
            maxLabel.leadingAnchor.constraint(equalTo: minMaxView.leadingAnchor),
            maxLabel.trailingAnchor.constraint(equalTo: minMaxView.trailingAnchor),
            maxLabel.heightAnchor.constraint(equalToConstant: minMaxView.frame.height / 2)
        ])
        
        NSLayoutConstraint.activate([
            minLabel.topAnchor.constraint(equalTo: maxLabel.bottomAnchor),
            minLabel.leadingAnchor.constraint(equalTo: minMaxView.leadingAnchor),
            minLabel.trailingAnchor.constraint(equalTo: minMaxView.trailingAnchor),
            minLabel.bottomAnchor.constraint(equalTo: minMaxView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            humidityLabel.topAnchor.constraint(equalTo: humidityPresureView.topAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: humidityPresureView.leadingAnchor),
            humidityLabel.trailingAnchor.constraint(equalTo: humidityPresureView.trailingAnchor),
            humidityLabel.heightAnchor.constraint(equalToConstant: humidityPresureView.frame.height / 2)
            
        ])
        
        NSLayoutConstraint.activate([
            presureLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor),
            presureLabel.leadingAnchor.constraint(equalTo: humidityPresureView.leadingAnchor),
            presureLabel.trailingAnchor.constraint(equalTo: humidityPresureView.trailingAnchor),
            presureLabel.bottomAnchor.constraint(equalTo: humidityPresureView.bottomAnchor)
        ])
    }
}

