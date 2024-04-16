//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Arjun Babu on 16/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    @State private var city:String = ""
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .foregroundColor(.white)
                    .fixedSize()
            }
            GeometryReader { geometry in
                Image("images")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .edgesIgnoringSafeArea(.all)
            VStack {
                if let currentWeather = viewModel.currentWeatherData {
                    Text("\(currentWeather.name)")
                        .foregroundColor(.white)
                        .font(.system(size: 30.0))
                        .multilineTextAlignment(.center)
                    
                    Text("\(Int(currentWeather.main.temp))°C")
                        .foregroundColor(.white)
                        .font(.system(size: 40.0))
                        .bold()
                        .multilineTextAlignment(.center)
                        
                    Text("\(currentWeather.weather[0].description)")
                        .foregroundColor(.white)
                        .font(.system(size: 20.0))
                        .multilineTextAlignment(.center)
                    
                }
                TextField("Enter city", text: $city, onCommit: {
                    viewModel.fetchWeather(for: city)
                })
                .textFieldStyle(.roundedBorder)
                .padding()
                
                
                if let weatherData = viewModel.weatherData, let list = weatherData.list {
                    if city != "" {
                        List(list, id: \.dt_txt) { weather in
                            Text("\(weather.dt_txt) \n \(Int(weather.main.temp))°C \n \(weather.weather[0].description)")
                                .font(.caption)
                                .padding()
                        }
                        .background(Color.clear)
                        .scrollContentBackground(.hidden)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchCurrentWeather(for: "Hyderabad")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
