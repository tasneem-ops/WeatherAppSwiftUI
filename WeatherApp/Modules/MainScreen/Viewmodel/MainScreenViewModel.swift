//
//  MainScreenViewModel.swift
//  WeatherApp
//
//  Created by JETSMobileLabMini9 on 16/05/2024.
//

import Foundation
import CoreLocation

class MainScreenViewModel :  NSObject, ObservableObject, CLLocationManagerDelegate{
    var locationManager : CLLocationManager?
    @Published var temp : String?
    @Published var city : String?
    @Published var image : String?
    @Published var isDay : Bool = true
    @Published var forecastDays : [Forecastday]?
    @Published var current : Current?
    @Published var dayConditions : Day?
    var latitude : Double!
    var longitude : Double!
    var networkService : any INetworkService<ForecastResult>
    init(networkService: any INetworkService<ForecastResult>) {
        self.networkService = networkService
        super.init()
        isDay = checkIsDay()
        locationManager = CLLocationManager()
        locationManager?.delegate  = self
        locationManager?.requestWhenInUseAuthorization()
        checkAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let previuosStatus = manager.authorizationStatus
        manager.requestWhenInUseAuthorization()
        if manager.authorizationStatus != previuosStatus{
            checkAuthorization()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location is Updated")
        latitude = locations.first?.coordinate.latitude
        longitude = locations.first?.coordinate.longitude
        networkService.fetchData(url: "https://api.weatherapi.com/v1/forecast.json?key=32f99e53c59f4cf0a0080205241605&q=\(longitude ?? 31.0),\(latitude ?? 30.0)&days=3&aqi=no&alerts=no"){
            data, error in
            self.temp = String(format: "%.1f", data?.current?.tempC ?? 0.0)
            self.city = data?.location?.name
            self.image = "https:" + (data?.current?.condition?.icon ?? "")
            self.forecastDays = data?.forecast?.forecastday
            self.current = data?.current
            self.dayConditions = data?.forecast?.forecastday?.first?.day
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Location Error")
        print(error)
    }
    func checkAuthorization(){
        guard let manager = locationManager else{ return}
        
        if(manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus  == .authorizedWhenInUse){
            manager.requestLocation()
        }
    }
    
    func checkIsDay()-> Bool{
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        if(hour < 5 || hour >= 18){
            return false
        }
        else{
            return true
        }
    }
    func getDayName(AtIndex x : Int) -> String{
        if(x == 0){
            return "Today"
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        let result = formatter.string(from: Date(timeIntervalSince1970: Double(forecastDays?[x].dateEpoch ?? 0)))
        print(result)
        return result
    }
}
