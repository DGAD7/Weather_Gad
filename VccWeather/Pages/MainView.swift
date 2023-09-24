//
//  ContentView.swift
//  VccWeather
//
//  Created by Darshan Gad on 2023-09-22.
//

import SwiftUI

struct MainView: View {

    private let cities: [String] = ["Gothenburg", "Stockholm", "MountainView", "London", "New York", "Berlin"]
    var body: some View {
        
        VStack{
            
            Text("VCC Weather App")
                .font(.headline)
                .underline()

            TabView{
                ForEach (cities, id: \.self) {city in
                    ContentView(city:city)

                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
        }
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


