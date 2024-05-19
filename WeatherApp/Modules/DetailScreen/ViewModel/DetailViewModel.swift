//
//  DetailViewModel.swift
//  WeatherApp
//
//  Created by Tasnem on 18/05/2024.
//

import Foundation

class DetailViewModel : ObservableObject{
    @Published var isDay : Bool
    @Published var hourForecasts : [Hour] = []
    
    init(isDay: Bool, hourForecasts: [Hour]) {
        self.isDay = isDay
        self.hourForecasts = getUpcomingHours(hours: hourForecasts)
        print(hourForecasts.count)
    }
    func getUpcomingHours(hours : [Hour])-> [Hour]{
        if(hours.isEmpty){
            return hours
        }
        var newHourList : [Hour] = []
        let date = Date()
        let calendar = Calendar.current
        var hour = calendar.component(.hour, from: date)
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        if (day < calendar.component(.day, from: Date(timeIntervalSince1970: Double(hours[0].timeEpoch ?? 0)))){
            return hours
        }
        else if(month < calendar.component(.month, from: Date(timeIntervalSince1970: Double(hours[0].timeEpoch ?? 0)))){
            return hours
        }
        let minutes = calendar.component(.minute, from: date)
        if(minutes > 50){
            hour += 1
        }
        for hourforecast in hours{
            let _hour = calendar.component(.hour, from: Date(timeIntervalSince1970: Double(hourforecast.timeEpoch ?? 0)))
            if(_hour >= hour){
                newHourList.append(hourforecast)
            }
        }
        return newHourList
    }
    func getHourString(for x : Hour) -> String{
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        if (day == calendar.component(.day, from: Date(timeIntervalSince1970: Double(x.timeEpoch ?? 0)))){
            if(x.timeEpoch == hourForecasts[0].timeEpoch){
                return "Now"
            }
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "h a"
        let result = formatter.string(from: Date(timeIntervalSince1970: Double(x.timeEpoch ?? 0)))
        print(result)
        return result
    }
}
