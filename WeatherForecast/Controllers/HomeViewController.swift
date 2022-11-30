//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Raul de Medeiros on 24/11/22.
//

import UIKit

class HomeViewController: UIViewController {
   // var weatherForecast : WeatherForecast?
    
    var brain = WeatherBrain()
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var nowTempetureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    //var city : String = "Porto Alegre"
    override func viewDidLoad() {
        super.viewDidLoad()
        brain.delegate = self
        setupCityTextField()
        brain.fetchWeather(city: "Porto Alegre")
        showLoader()
        //getWeatherForCity(city: "Alvorada")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        brain.fetchWeather(city: cityTextField.text!)
        cityTextField.endEditing(true)
        showLoader()
    }
    
    func setupCityTextField()
    {
        cityTextField.delegate = self
        //cityTextField.tintColor =
    }
    
    func configureLayout(weatherForecast : WeatherForecast){
        nowTempetureLabel.text = "\(weatherForecast.tempString)º"
        cityLabel.text = "\(weatherForecast.cityName)"
    }
    
    func showLoader()
    {
        loaderView.isHidden = false
        self.view.isUserInteractionEnabled = false
    }
    
    func hiddeLoader(){
        loaderView.isHidden = true
        self.view.isUserInteractionEnabled = true
    }
}

extension HomeViewController : WeatherBrainProtocol{
    func didUpdateWeather(brain: WeatherBrain, data: WeatherForecast?) {
        DispatchQueue.main.async {
            self.nowTempetureLabel.text = "\(data!.tempString)º"
            self.cityLabel.text = data?.cityName
            self.hiddeLoader()
        }
    }
    
    func fail(error: Error) {
        DispatchQueue.main.async {
            self.hiddeLoader()
            let alert = UIAlertController(title: "Ops, algo deu errado", message: "Parece que não foi possível concluir sua requisição. Tente novamente em alguns instantes!", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
            
            self.present(alert, animated: true)
        }
    }
    
    
}

