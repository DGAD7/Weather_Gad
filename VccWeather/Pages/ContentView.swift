//
//  ContentView.swift
//  VccWeather
//
//  Created by Darshan Gad on 2023-09-22.
//

import SwiftUI


struct ContentView: View {
    private var city:String
    init(city: String){
        self.city = city
    }
    
    @StateObject private var WeatherApi = VccWeatherApi()
    
    var body: some View {
            
        ZStack{
            Color.gray
            .ignoresSafeArea()
            Image("Sky")
                .resizable()
        VStack(alignment: .center, spacing: 10) {
            
                    
                if let weather_now = WeatherApi.weather_now{
                    Text("\(city) weather : \(weather_now.weather[0].description)")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding()
                        .bold()

                    
                    HStack(alignment: .center, spacing: 16) {
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weather_now.weather[0].icon)@2x.png"))
                        
                        let str = String(format : "%.2f",weather_now.main.temp)
                        Text("\(str) \u{00B0} C")
                            .font(.largeTitle)
                    }
                    let feels = String(format : "%.2f",weather_now.main.feels_like)
                    Text("Feels like : \(feels) \u{00B0} C")
                    let str_max = String(format : "%.2f",weather_now.main.temp_max)
                    Text("Max : \(str_max) \u{00B0} C")
                    let str_min = String(format : "%.2f",weather_now.main.temp_min)
                    Text("Min : \(str_min) \u{00B0} C")
                } else{
                    Text("Unable to fetch weather data")
                        .font(.body)
                        .multilineTextAlignment(.center)
                    Button("Get Weather Data", action: {
                        Task {
                            await WeatherApi.WeatherCheck(city:city)
                        }
                    })
                }
            }
        }
        .onAppear{
            Task {
                await WeatherApi.WeatherCheck(city: city)
                
            }
        }

    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(city : "Gothenburg")
    }
}
