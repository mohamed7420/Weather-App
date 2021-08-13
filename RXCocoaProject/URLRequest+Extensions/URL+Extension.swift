//
//  URL+Extensio0n.swift
//  RXCocoaProject
//
//  Created by Mohamed osama on 13/08/2021.
//

import Foundation


extension URL{
    
    static func urlWeatherApi(city: String) -> URL?{
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=5b60b1a5403e2171f76905665a493754")
    }
}
