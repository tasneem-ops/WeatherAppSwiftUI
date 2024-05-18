//
//  HourForecast.swift
//  WeatherApp
//
//  Created by Tasnem on 18/05/2024.
//

import Foundation

struct HourForecast : Identifiable{
    var id: ObjectIdentifier
    var timeEpoch    : Int?
    var time         : String?
    var tempC        : Double?
    var isDay        : Int?
    var condition    : Condition = Condition()
}
