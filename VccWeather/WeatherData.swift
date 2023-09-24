//
//  WeatherData.swift
//  VccWeather
//
//  Created by Darshan Gad on 2023-09-23.
//

import Foundation


struct WeatherFromApi: Codable{
    let weather: [WeatherDescription]
    let main: WeatherData
    // var city_name: String   // let icon: WeatherIcon
    
}

struct WeatherDescription: Codable{
    var id: Int
    var main : String
    var description : String
    var icon : String
    
}

struct WeatherData: Codable{
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
    var humidity: Double
}

struct WeatherIcon: Codable{
    var icon: Data

}



