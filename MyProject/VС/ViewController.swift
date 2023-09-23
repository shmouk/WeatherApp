//
//  ViewController.swift
//  MyProject
//
//  Created by Марк on 13.06.23.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    lazy var refreshControl = userInterfaceBuilder.refreshControl()
    lazy var weatherStateChangerImage: UIImageView = userInterfaceBuilder.createImageView()
    lazy var scrollView: UIScrollView = userInterfaceBuilder.createScrollView()
    lazy var containerStackView: UIStackView = userInterfaceBuilder.createContainerStackView()
    lazy var cityView: UIView = userInterfaceBuilder.createView()
    lazy var temperatureWeatherView: UIView = userInterfaceBuilder.createView()
    lazy var minMaxView: UIView = userInterfaceBuilder.createView()
    lazy var feelView: UIView = userInterfaceBuilder.createView()
    lazy var humidityPresureView: UIView = userInterfaceBuilder.createView()
    lazy var weatherImage: UIImageView = userInterfaceBuilder.createImageView()
    lazy var cityLabel: UILabel = userInterfaceBuilder.createLabel()
    lazy var temperatureLabel: UILabel = userInterfaceBuilder.createLabel()
    lazy var feelLabel: UILabel = userInterfaceBuilder.createLabel()
    lazy var weatherLabel: UILabel = userInterfaceBuilder.createLabel()
    lazy var minLabel: UILabel = userInterfaceBuilder.createLabel()
    lazy var maxLabel: UILabel = userInterfaceBuilder.createLabel()
    lazy var humidityLabel: UILabel = userInterfaceBuilder.createLabel()
    lazy var presureLabel: UILabel = userInterfaceBuilder.createLabel()

    let locationService = LocationService.shared
    let userInterfaceBuilder = UserInterfaceBuilder()
    let configurateWeatherData = ConfigurateWeatherData()
    
    var imageView: UIImageView?
    var cityName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        addSubviews()
        setupViews()
        setupTargets()
        setLocationName()
    }
    
    private func setupViews() {
        scrollView.delegate = self
        setupConstraints()
    }
    
    private func addSubviews() {
        self.view.addSubview(weatherStateChangerImage)
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(refreshControl)
        self.scrollView.addSubview(containerStackView)
        self.containerStackView.addArrangedSubview(cityView)
        self.containerStackView.addArrangedSubview(temperatureWeatherView)
        self.containerStackView.addArrangedSubview(feelView)
        self.containerStackView.addArrangedSubview(minMaxView)
        self.containerStackView.addArrangedSubview(humidityPresureView)
        self.cityView.addSubview(cityLabel)
        self.temperatureWeatherView.addSubview(weatherImage)
        self.temperatureWeatherView.addSubview(weatherLabel)
        self.temperatureWeatherView.addSubview(temperatureLabel)
        self.minMaxView.addSubview(minLabel)
        self.minMaxView.addSubview(maxLabel)
        self.feelView.addSubview(feelLabel)
        self.humidityPresureView.addSubview(humidityLabel)
        self.humidityPresureView.addSubview(presureLabel)
    }
    
    private func setupTargets() {
        addTarget()
    }
    
    private func addTarget() {
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }

    private func setLocationName() {
        
        locationService.getLocation(locationDidChange: { locationName in
            
            self.cityName = locationName
            self.configurateWeatherData.configure(city: self.cityName ?? "Minsk", completion: { data, url, error in

                if !data.isEmpty {
                    self.cityLabel.text = data["cityName"]
                    self.temperatureLabel.text = data["temperatureName"]
                    self.weatherLabel.text = data["weatherName"]
                    self.maxLabel.text = data["maxName"]
                    self.minLabel.text = data["minName"]
                    self.feelLabel.text = data["feelName"]
                    self.humidityLabel.text = data["humidityName"]
                    self.presureLabel.text = data["presureName"]
                    self.weatherImage.setImage(url)
                    self.weatherStateChangerImage.setWeatherImage(data["weatherName"] ?? "clear")
                }
            })
        })
    }
}

private extension ViewController {
    @objc private func refreshData(_ sender: Any) {
        setLocationName()
        refreshControl.endRefreshing()
    }
    
}

