//
//  Hour.swift
//  WeatherApp
//
//  Created by Tasnem on 17/05/2024.
//

import Foundation
 
struct Hour: Codable, Identifiable{
    var id: ObjectIdentifier
    
  var timeEpoch    : Int?       = nil
  var time         : String?    = nil
  var tempC        : Double?       = nil
  var isDay        : Int?       = nil
  var condition    : Condition? = Condition()

 
  enum CodingKeys: String, CodingKey {
 
    case timeEpoch    = "time_epoch"
    case time         = "time"
    case tempC        = "temp_c"
    case isDay        = "is_day"
    case condition    = "condition"
  }
 
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
 
    timeEpoch    = try values.decodeIfPresent(Int.self       , forKey: .timeEpoch    )
    time         = try values.decodeIfPresent(String.self    , forKey: .time         )
    tempC        = try values.decodeIfPresent(Double.self       , forKey: .tempC        )
    isDay        = try values.decodeIfPresent(Int.self       , forKey: .isDay        )
    condition    = try values.decodeIfPresent(Condition.self , forKey: .condition    )
      id = ObjectIdentifier(Int.self)
  }
 
  init() {
      id = ObjectIdentifier(Int.self)
  }
 
}
