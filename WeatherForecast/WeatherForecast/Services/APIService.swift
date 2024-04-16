//
//  APIService.swift
//  WeatherForecast
//
//  Created by Arjun Babu on 16/04/24.
//

import Foundation

class APIService: ObservableObject {
    
    // Define properties and methods for handling API requests
    
    enum APIError: Error {
        case invalidURL
        case noData
        case decodingError
        // Add more error cases as needed
    }
    
    func fetchData(_ city:String, completion: @escaping (Result<WeatherData, APIError>) -> Void) {
        
        let urlString = Constants.weatherURLString + "\(city)&appid=\(Constants.APIKey)&units=metric&cnt=3"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                    completion(.failure(.noData))
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
                
            } catch {
                completion(.failure(.decodingError))
            }
            
            
        }.resume()
    }
    
    func fetchCurrentWeatherData(_ city:String, completion: @escaping (Result<CurrentWeatherData, APIError>) -> Void) {
        
        let urlString = Constants.currentWeatherURLString + "\(city)&appid=\(Constants.APIKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                    completion(.failure(.noData))
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(CurrentWeatherData.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
                
            } catch {
                completion(.failure(.decodingError))
            }
            
            
        }.resume()
    }
    
    // Add more methods for different API endpoints and actions
}
