//
//  API+Extensions.swift
//  WeatherApp
//
//  Created by KBM-PC on 14.04.2022.
//

import Foundation

extension API {
    
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    static func getURLFor(lat: Double, lon: Double) -> String {
        
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=imperial"
        

    }
}

