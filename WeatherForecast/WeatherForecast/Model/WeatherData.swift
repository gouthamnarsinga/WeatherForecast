//
//  WeatherData.swift
//  WeatherForecast
//
//  Created by Arjun Babu on 16/04/24.
//

import Foundation

struct WeatherData: Codable {
    let list : [WeatherList]
}

struct WeatherList: Codable {
    let dt_txt : String
    let main : WeatherMain
    let weather : [Weather]
}

struct WeatherMain: Codable {
    let temp: Double
    
}

struct Weather: Codable {
    let description: String
}


struct CurrentWeatherData: Codable {
    let main : WeatherMain
    let weather : [Weather]
    let name: String
}
