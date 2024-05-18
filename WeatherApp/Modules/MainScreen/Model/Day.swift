//
//  Day.swift
//  WeatherApp
//
//  Created by Tasnem on 17/05/2024.
//

import Foundation
 
struct Day: Codable {
 
  var maxtempC          : Double?    = nil
  var mintempC          : Double?    = nil
  var avgtempC          : Double?    = nil
  var condition         : Condition? = Condition()
 
  enum CodingKeys: String, CodingKey {
 
    case maxtempC          = "maxtemp_c"
    case mintempC          = "mintemp_c"
    case avgtempC          = "avgtemp_c"
    case condition         = "condition"
  }
 
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
 
    maxtempC          = try values.decodeIfPresent(Double.self    , forKey: .maxtempC          )
    mintempC          = try values.decodeIfPresent(Double.self    , forKey: .mintempC          )
    avgtempC          = try values.decodeIfPresent(Double.self    , forKey: .avgtempC          )
    condition         = try values.decodeIfPresent(Condition.self , forKey: .condition         )
  }
 
  init() {
 
  }
 
}
