//
//  Condition.swift
//  WeatherApp
//
//  Created by Tasnem on 17/05/2024.
//

import Foundation
 
struct Condition: Codable {
 
  var text : String? = nil
  var icon : String? = nil
  var code : Int?    = nil
 
  enum CodingKeys: String, CodingKey {
 
    case text = "text"
    case icon = "icon"
    case code = "code"
  }
 
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
 
    text = try values.decodeIfPresent(String.self , forKey: .text )
    icon = try values.decodeIfPresent(String.self , forKey: .icon )
    code = try values.decodeIfPresent(Int.self    , forKey: .code )
  }
 
  init() {
 
  }
 
}
