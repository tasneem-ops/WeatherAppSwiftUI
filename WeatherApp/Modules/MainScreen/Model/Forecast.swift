//
//  Forecast.swift
//  WeatherApp
//
//  Created by Tasnem on 17/05/2024.
//

import Foundation
 
struct Forecast: Codable {
 
  var forecastday : [Forecastday]? = []
 
  enum CodingKeys: String, CodingKey {
 
    case forecastday = "forecastday"
  }
 
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
 
    forecastday = try values.decodeIfPresent([Forecastday].self , forKey: .forecastday )
  }
 
  init() {
 
  }
 
}
