//
//  HomeViewControllerExtensions.swift
//  WeatherForecast
//
//  Created by Raul de Medeiros on 30/11/22.
//

import UIKit


extension HomeViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        } else {
            textField.placeholder = "Informe uma cidade"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        brain.fetchWeather(city: textField.text ?? "")
        
        textField.text = ""
    }
}
