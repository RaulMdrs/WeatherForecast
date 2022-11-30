//
//  Main.swift
//  WeatherForecast
//
//  Created by Raul de Medeiros on 24/11/22.
//

import Foundation

struct TemperatureOfTheDay : Codable{
    var temp : Float 
    var feelsLike: Float
    var tempMin : Float
    var tempMax : Float
    var pressure : Int
    var humidity : Int
    
    private enum CodingKeys : String, CodingKey {
        case temp = "temp",
             feelsLike = "feels_like",
             tempMin = "temp_min",
             tempMax = "temp_max",
             pressure = "pressure",
             humidity = "humidity"
    }
}
