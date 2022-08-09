//
//  Weather.swift
//  WeatherApp
//
//  Created by igor s on 09.08.2022.
//

import Foundation

struct Weather: Decodable {
    let temperature: String
    let wind: String
    let description: String
    let forecast: [Forecast]
    
    var weatherInfo: String {
        var forecastInfo = ""
        for day in forecast {
            forecastInfo += day.forecastInfo
        }
        
        let result =
        """
        
        Current weather:
            temperature: \(temperature)
            wind: \(wind)
            description: \(description)
            
        Weather forecast:
        \(forecastInfo)
        """
        return result
    }
}

struct Forecast: Decodable {
    let day: String
    let temperature: String
    let wind: String
    
    var forecastInfo: String {
        """
        
            day# \(day)
            temperature: \(temperature)
            wind: \(wind)
        
        """
    }
}
