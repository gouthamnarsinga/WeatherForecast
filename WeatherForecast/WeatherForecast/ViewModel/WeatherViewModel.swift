//
//  WeatherViewModel.swift
//  WeatherForecast
//
//  Created by Arjun Babu on 16/04/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    @Published var currentWeatherData: CurrentWeatherData?
    @Published var apiService = APIService()

    func fetchWeather(for city: String) {
        // Implement API call to fetch weather data for the given city
        // Parse the JSON response and update currentWeather and forecast properties
        
        apiService.fetchData(city) { result in
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self.weatherData = weatherData
                }
            case .failure(let error):
                print(error.hashValue.description)
            }
        }
    }
    
    func fetchCurrentWeather(for city: String) {
        // Implement API call to fetch weather data for the given city
        // Parse the JSON response and update currentWeather and forecast properties
        
        apiService.fetchCurrentWeatherData(city) { result in
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self.currentWeatherData = weatherData
                }
            case .failure(let error):
                print(error.hashValue.description)
            }
        }
        
    }
}
