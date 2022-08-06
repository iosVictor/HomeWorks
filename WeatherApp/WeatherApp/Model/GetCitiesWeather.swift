//
//  GetCitiesWeather.swift
//  WeatherApp
//
//  Created by Victor Kimpel on 5.08.22.
//

import Foundation
import CoreLocation

let networkWeatherManager = NetworkWeatherManager()

func getCityWeather(citiesArray: [String], completionHandler: @escaping (Int, Weather) -> Void) {
    
    for (index, item) in citiesArray.enumerated() {
        
        getCoordinateFrom(city: item) { (coordinate, error) in
            guard let coordinate = coordinate, error == nil else { return }
            
            networkWeatherManager.fetchWeather(lat: coordinate.latitude, lon: coordinate.longitude) { (weather) in
                completionHandler(index, weather)
            }
        }
    }
}

func getCoordinateFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
    CLGeocoder().geocodeAddressString(city) { (placemark, error) in
        completion(placemark?.first?.location?.coordinate, error)
    }
    
}
