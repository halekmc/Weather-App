//
//  Weather.swift
//  WeatherApp
//
//  Created by KBM-PC on 14.04.2022.
//

import Foundation


class Weather: Codable, Identifiable {
    var dt: Int
    var temp: Double
    var feel_like: Double
    var pressure: Int
    var humidty: Int
    var dew_point: Double
    var clouds:Int
    var wind_speed:Double
    var wind_deg:Int
    var weather:[WeatherDetail]
    
    enum CodingKey:String {
        case dt
        case temp
        case feel_like
        case pressure
        case humidity
        case dew_point
        case clouds
        case wing_speed
        case wind_deg
        case weather
    }
    
    init(){
        dt=0
        temp=0.0
        feel_like=0.0
        pressure=0
        humidty=0
        dew_point=0.0
        clouds=0
        wind_speed=0.0
        wind_deg=0
        weather=[]
    }

}

extension Weather{
    var id: UUID{
        return UUID()
    }
}
