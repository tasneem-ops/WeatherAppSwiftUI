//
//  Current.swift
//  WeatherApp
//
//  Created by Tasnem on 17/05/2024.
//

import Foundation
 
struct Current: Codable {
 
  var lastUpdatedEpoch : Int?       = nil
  var lastUpdated      : String?    = nil
  var tempC            : Double?       = nil
  var tempF            : Double?    = nil
  var isDay            : Int?       = nil
  var condition        : Condition? = Condition()
  var windKph          : Double?    = nil
  var pressureMb       : Double?       = nil
  var pressureIn       : Double?    = nil
  var precipMm         : Double?       = nil
  var humidity         : Double?       = nil
  var cloud            : Double?       = nil
  var feelslikeC       : Double?    = nil
  var visKm            : Double?       = nil
 
  enum CodingKeys: String, CodingKey {
 
    case lastUpdatedEpoch = "last_updated_epoch"
    case lastUpdated      = "last_updated"
    case tempC            = "temp_c"
    case tempF            = "temp_f"
    case isDay            = "is_day"
    case condition        = "condition"
    case windKph          = "wind_kph"
    case pressureMb       = "pressure_mb"
    case pressureIn       = "pressure_in"
    case humidity         = "humidity"
    case cloud            = "cloud"
    case feelslikeC       = "feelslike_c"
    case visKm            = "vis_km"
  }
 
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
 
    lastUpdatedEpoch = try values.decodeIfPresent(Int.self       , forKey: .lastUpdatedEpoch )
    lastUpdated      = try values.decodeIfPresent(String.self    , forKey: .lastUpdated      )
    tempC            = try values.decodeIfPresent(Double.self       , forKey: .tempC            )
    tempF            = try values.decodeIfPresent(Double.self    , forKey: .tempF            )
    isDay            = try values.decodeIfPresent(Int.self       , forKey: .isDay            )
    condition        = try values.decodeIfPresent(Condition.self , forKey: .condition        )
    windKph          = try values.decodeIfPresent(Double.self    , forKey: .windKph          )
    pressureMb       = try values.decodeIfPresent(Double.self       , forKey: .pressureMb       )
    pressureIn       = try values.decodeIfPresent(Double.self    , forKey: .pressureIn       )
    humidity         = try values.decodeIfPresent(Double.self       , forKey: .humidity         )
    cloud            = try values.decodeIfPresent(Double.self       , forKey: .cloud            )
    feelslikeC       = try values.decodeIfPresent(Double.self    , forKey: .feelslikeC       )
    visKm            = try values.decodeIfPresent(Double.self       , forKey: .visKm            )
  }
 
  init() {
 
  }
 
}
