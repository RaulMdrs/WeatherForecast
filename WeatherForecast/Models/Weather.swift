//
//  Weather.swift
//  WeatherForecast
//
//  Created by Raul de Medeiros on 24/11/22.
//

import Foundation


struct Weather : Codable{
    var id : Int
    var main : String
    var description : String
    var icon : String
}
