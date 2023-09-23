//
//  SecondViewController.swift
//  MyProject
//
//  Created by Марк on 16.06.23.
//

import UIKit

class SecondViewController: UIViewController {
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
    lazy var changeDataButton: UIButton = userInterfaceBuilder.createButton()
    var userInterfaceBuilder = UserInterfaceBuilder()
    var configurateWeatherData = ConfigurateWeatherData()
    
    var cityName: String = "Minsk" {
        didSet {
            changeData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        addSubviews()
        setupTargets()
        changeData()
        setupViews()
    }
    
    private func setupViews() {
        setupConstraints()
    }
    
    private func addSubviews() {
        self.view.addSubview(weatherStateChangerImage)
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(containerStackView)
        self.containerStackView.addArrangedSubview(cityView)
        self.containerStackView.addArrangedSubview(temperatureWeatherView)
        self.containerStackView.addArrangedSubview(feelView)
        self.containerStackView.addArrangedSubview(minMaxView)
        self.containerStackView.addArrangedSubview(humidityPresureView)
        self.cityView.addSubview(cityLabel)
        self.cityView.addSubview(changeDataButton)
        self.temperatureWeatherView.addSubview(weatherImage)
        self.temperatureWeatherView.addSubview(weatherLabel)
        self.temperatureWeatherView.addSubview(temperatureLabel)
        self.minMaxView.addSubview(minLabel)
        self.minMaxView.addSubview(maxLabel)
        self.feelView.addSubview(feelLabel)
        self.humidityPresureView.addSubview(humidityLabel)
        self.humidityPresureView.addSubview(presureLabel)
    }
    
    private func showErrorAlert(_ error: Error) {
        let alertController = UIAlertController(
            title: "Error",
            message: "\(error.localizedDescription), удалите или измените данные",
            preferredStyle: UIAlertController.Style.alert
        )
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: UIAlertAction.Style.destructive) { (action) in
            }
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func showTextFieldAlert() {
        let alert = UIAlertController(title: "New City", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Name"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak self] _ in
            guard let text = alert.textFields?[0].text else { return }
            self?.cityName = text
        }))
        present(alert, animated: true)
    }
    
    private func changeData() {

        configurateWeatherData.configure(city: cityName, completion: { data, url, error in
            if !data.isEmpty {
                self.changeDataButton.setTitle(">>Изменить город<<", for: .normal)
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
            } else {
                self.showErrorAlert(error!)
            }
        })
    }
    
    private func setupTargets() {
        addTarget()
    }
    
    private func addTarget() {
        changeDataButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}

private extension SecondViewController {
    @objc private func buttonTapped() {
        showTextFieldAlert()
    }
}
