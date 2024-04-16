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
    @Published var isLoading = false

    func fetchWeather(for city: String) {
        // Implement API call to fetch weather data for the given city
        // Parse the JSON response and update currentWeather and forecast properties
        self.isLoading = true
        apiService.fetchData(city) { result in
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.weatherData = weatherData
                }
            case .failure(let error):
                self.isLoading = false
                print(error.hashValue.description)
            }
        }
    }
    
    func fetchCurrentWeather(for city: String) {
        // Implement API call to fetch weather data for the given city
        // Parse the JSON response and update currentWeather and forecast properties
        self.isLoading = true
        apiService.fetchCurrentWeatherData(city) { result in
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.currentWeatherData = weatherData
                }
            case .failure(let error):
                self.isLoading = false
                print(error.hashValue.description)
            }
        }
        
    }
}
