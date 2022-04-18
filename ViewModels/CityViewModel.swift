//
//  CityViewModels.swift
//  WeatherApp
//
//  Created by KBM-PC on 14.04.2022.
//

import SwiftUI
import CoreLocation

final class CityViewModel: ObservableObject {
    
    @Published var weather=WeatherResponse.empty()
    
    @Published var city:String="Antalya"{
        didSet{
            getLocation()
        }
    }
    
    private lazy var dateFormatter: DateFormatter={
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter={
        let formatter = DateFormatter()
        formatter.dateFormat="EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter={
        let formatter=DateFormatter()
        formatter.dateFormat="hh a"
        return formatter
    }()
    
    init(){
        getLocation()
    }
    
    var date: String{
        return dateFormatter.string(from: Date(timeIntervalSince1970:TimeInterval(weather.current.dt)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "dayClearSky"
    }
    var temperature: String{
        return getTempFor(temp: weather.current.temp)
    }
    var conditions:String{
        if weather.current.weather.count>0{
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var windSpeed: String{
        return String(format:"%0.1f", weather.current.wind_speed)
    }
    
    var humidty: String{
        return String(format:"%d%%",weather.current.humidty)
    }
    var rainChances: String{
        return String(format: "%0.0f%%", weather.current.dew_point)
    }
    
    
    func getTimeFor(timestamp: Int) -> String{
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getTempFor(temp:Double) -> String {
        return String(format: "%0.1f", temp)
    }
    
    func getDayFor(timestamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    private func getLocation(){
        CLGeocoder().geocodeAddressString(city) { (placemarks,error) in
            if let places = placemarks, let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    
    
    private func getWeather(coord: CLLocationCoordinate2D?){
        if let coord = coord {
            let urlString = API.getURLFor(lat: coord.latitude, lon: coord.longitude)
            getWeatherInternal(city: city, for: urlString)
        } else{
            let urlString = API.getURLFor(lat: 36.884804, lon: 30.704044)
            getWeatherInternal(city: city, for: urlString)
            
        }
    }
    
    private func getWeatherInternal(city:String, for urlString:String){
        NetworkManager<WeatherResponse>.fetch(for: URL(string:urlString)!) { (result) in
            switch result {
            case.success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case.failure(let err):
                print(err)
            }
        }
    }
    
    func getLottieAnimationFor(icon:String) -> String {
        switch icon{
        
        case "0.1d":
            return "dayClearSky"
        case "0.1n":
            return "nightClearSky"
        case "0.2d":
            return "dayFewClouds"
        case "0.2n":
            return "nightFewClouds"
        case "0.3d":
            return "dayScattaredClouds"
        case "0.3n":
            return "nightScattaredClouds"
        case "0.4d":
            return "dayBrokenClouds"
        case "0.4n":
            return"nightBrokenClouds"
        case "0.9d":
            return "dayShowerRains"
        case "0.9n":
            return "nightShowerRains"
        case "10d":
            return "dayRain"
        case "10n":
            return "nightRain"
        case "11d":
            return "dayThunderstorm"
        case "11n":
            return "nightThunderstorm"
        case "13d":
            return "daySnow"
        case "13n":
            return "nightSnow"
        case "50d":
            return "dayMist"
        case "50n":
            return "dayMist"
        default:
            return "dayClearSky"
        }
    }
    
    func getWeatherIconFor(icon:String)->Image{
        switch icon {
        case "0.1d":
            return Image(systemName: "sun.max.circle.fill ")//"dayClearSky"
        case "0.1n":
            return Image(systemName: "moon.fill ") //"nightClearSky"
        case "0.2d":
            return Image(systemName: "cloud.sun.fill ")//"dayFewClouds"
        case "0.2n":
            return Image(systemName: "cloud.moon.fill ")//"nightFewClouds"
        case "0.3d":
            return Image(systemName: "cloud.fill ")//"dayScattaredClouds"
        case "0.3n":
            return Image(systemName: "cloud.fill ")//"nightScattaredClouds"
        case "0.4d":
            return Image(systemName: "cloud.fill ")//"dayBrokenClouds"
        case "0.4n":
            return Image(systemName: "cloud.fill ")//"nightBrokenClouds"
        case "0.9d":
            return Image(systemName: "cloud.drizzle.fill  ")//"dayShowerRains"
        case "0.9n":
            return Image(systemName: "cloud.drizzle.fill ")//"nightShowerRains"
        case "10d":
            return Image(systemName: "cloud.heavyrain.fill")//"dayRain"
        case "10n":
            return Image(systemName: "cloud.heavyrain.fill ")//"nightRain"
        case "11d":
            return Image(systemName: "cloud.bolt.fill ")//"dayThunderstorm"
        case "11n":
            return Image(systemName: "cloud.bolt.fill ")//"nightThunderstorm"
        case "13d":
            return Image(systemName: "cloud.snow.fill")//"daySnow"
        case "13n":
            return Image(systemName: "cloud.snow.fill")//"nightSnow"
        case "50d":
            return Image(systemName: "cloud.fog.fill ")//"dayMist"
        case "50n":
            return Image(systemName: "cloud.fog.fill ")//"dayMist"
        default:
            return Image(systemName: "sun.max.circle.fill")//"dayClearSky"
    }
}
}
