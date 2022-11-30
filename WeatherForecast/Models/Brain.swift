//
//  Brain.swift
//  WeatherForecast
//
//  Created by Raul de Medeiros on 30/11/22.
//

import Foundation

protocol WeatherBrainProtocol{
    func didUpdateWeather(brain : WeatherBrain, data : WeatherForecast?)
    func fail(error : Error)
}

struct WeatherBrain{
    let key = "ed7359ec21a9c3a88c08209e74247b11"
    let apiURL = "https://api.openweathermap.org/data/2.5/weather"
    var delegate : WeatherBrainProtocol?
    
    func fetchWeather(city : String){
        let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? ""
        let url = URL(string: "\(apiURL)?q=\(encodedCity),br&units=metric&appid=\(key)")
        
        if url != nil{
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                if let data = data, error == nil{
                    do{
                        let decoder = JSONDecoder()
                        var weatherForecast = try decoder.decode(WeatherForecast.self, from: data)
                        self.delegate?.didUpdateWeather(brain: self, data: weatherForecast)
                    }catch let error {
                        print(error.localizedDescription)
                        print(error)
                        delegate?.fail(error: error)
                    }
                }
            }
            
            task.resume()
           // showLoader()
        }

    }
}

//
//func getWeatherForCity(city : String = "Porto alegre"){
//    let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? ""
//
//    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(encodedCity),br&units=metric&appid=aeefba332b49db396d425480b21571b2")
//    if let url = url{
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let session = URLSession.shared
//        let task = session.dataTask(with: request) { data, response, error in
//            if let data = data, error == nil{
//                do{
//                    let decoder = JSONDecoder()
//                    self.weatherForecast = try decoder.decode(WeatherForecast.self, from: data)
//
//                    print(self.weatherForecast!.cityName)
//                    DispatchQueue.main.async {
//                        self.configureLayout()
//                        self.hiddeLoader()
//                    }
//
//                }catch let error {
//                    print(error.localizedDescription)
//                    print(error)
//                }
//            }
//        }
//
//        task.resume()
//        showLoader()
//    }
//}
