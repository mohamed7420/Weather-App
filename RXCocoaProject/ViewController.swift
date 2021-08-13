//
//  ViewController.swift
//  RXCocoaProject
//
//  Created by Mohamed osama on 13/08/2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humdityLabel: UILabel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cityNameTextField.rx.value.subscribe(onNext: { city in
            if let city = city{
                if !city.isEmpty{
                    //fetch weather
                    self.fetchWeather(by: city)
                }else{
                    //display nil
                    self.displayWeather(nil)
                }
            }
        }).disposed(by: disposeBag)
    }

    private func displayWeather(_ weather: Weather?){
        self.updateUI(weather: weather)
    }
    
    private func fetchWeather(by city: String){
        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) , let url = URL.urlWeatherApi(city: cityEncoded) else {return}
        let resource = Resource<WeatherResult>(url: url)
        URLRequest.load(resource: resource).subscribe(onNext:{[weak self] result in
            guard let self = self else {return}
            self.displayWeather(result.main)
        }).disposed(by: disposeBag)
    }
    
    private func updateUI(weather: Weather?){
        DispatchQueue.main.async {
            if let weather = weather{
                self.temperatureLabel.text = "\(weather.temp) Ḟ"
                self.humdityLabel.text = " \(weather.humidity) 💦"
            }else{
                self.temperatureLabel.text = "🙄"
                self.humdityLabel.text = "😩"
            }
        }
    }
}

