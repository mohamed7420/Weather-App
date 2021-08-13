//
//  Weather.swift
//  RXCocoaProject
//
//  Created by Mohamed osama on 13/08/2021.
//

import Foundation

struct WeatherResult: Codable{
    let main: Weather
}

struct Weather: Codable {
    let temp: Double
    let humidity: Double
}
