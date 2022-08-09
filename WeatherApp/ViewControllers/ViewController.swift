//
//  ViewController.swift
//  WeatherApp
//
//  Created by igor s on 09.08.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Private Properties
    private let link = "https://goweather.herokuapp.com/weather/Kazan"
    
    //MARK: - IB Actions
    @IBAction func getJsonTapped() {
        fetchWeather()
    }
    
    //MARK: - Private Methods
    private func fetchWeather() {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { [unowned self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                print(weather.weatherInfo)
                self.successAlert()
            } catch let error {
                print(error)
                self.failedAlert()
            }
        }.resume()
    }
    
    
}

//MARK: - AlertController
extension ViewController {
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}


