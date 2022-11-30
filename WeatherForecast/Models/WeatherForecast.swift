//
//  WeatherForecast.swift
//  WeatherForecast
//
//  Created by Raul de Medeiros on 24/11/22.
//

import Foundation

struct WeatherForecast : Codable{
    var temperatureOfTheDay : TemperatureOfTheDay
    var cityName : String
    var tempString : String {
        return String(format: "%.0f", temperatureOfTheDay.temp)
    }
    
    private enum CodingKeys : String, CodingKey {
        case temperatureOfTheDay = "main",
        cityName = "name"
    }
}
