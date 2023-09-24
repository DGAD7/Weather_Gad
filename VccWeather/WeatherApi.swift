//
//  WeatherApi.swift
//  VccWeather
//
//  Created by Darshan Gad on 2023-09-23.
//

import Foundation
import CoreLocation
import SwiftUI


class VccWeatherApi: ObservableObject {

    @Published var weather_now : WeatherFromApi?
    let ApiKey = "2b0806abf21f064a69344aa38feb64da"
    
    func WeatherCheck(city:String)async{
        print(city)
        if city == "New York"{
            let lat = 43.0004
            let lon = -75.4999
            guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(ApiKey)&units=metric") else { return  }
            await GetWeather(url:url)
        
        }else {
            guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(ApiKey)&units=metric") else { return  }
            await GetWeather(url:url)
        }
    }
          
    func GetWeather(url:URL) async{
   
        do {
            
        let(data,resp) = try await URLSession.shared.data(from: url)
        // https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#client_error_responses
        print(resp)
        // print("Hello World")
        // print(data)
        let dataString = String(data: data, encoding: .utf8)
            print(dataString ?? "Hello World")
        if let response = try? JSONDecoder().decode(WeatherFromApi.self, from: data){
            print(response)
           let data = response.main
           let description = response.weather

           DispatchQueue.main.async {
                [weak self] in self?.weather_now = WeatherFromApi(weather :description,
                                                                  main : data)
             }
          }
            
        } catch {
            print("Something wrong")
        }

    }
    
}
