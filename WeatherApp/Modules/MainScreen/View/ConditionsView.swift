//
//  ConditionsView.swift
//  WeatherApp
//
//  Created by JETSMobileLabMini9 on 20/05/2024.
//

import SwiftUI
import Kingfisher

struct ConditionsView: View {
    var dayCondition : Day?
    var city : String?
    var isDay : Bool
    var temp : String?
    var body: some View {
        CustomText(text: "\(city ?? "Unknown")",
                   isDay: isDay)
                .font(.largeTitle)
                .bold()
        CustomText(text: "\(temp ?? "-100")°",
                   isDay: isDay)
                .font(.largeTitle)
                .bold()
        CustomText(text: "\(dayCondition?.condition?.text ?? "Test")",
                   isDay: isDay)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        CustomText(text: "H: \(String(format: "%.1f", dayCondition?.maxtempC ?? 0))°  L: \(String(format: "%.1f", dayCondition?.mintempC ?? 0))°",
                   isDay: isDay)
        KFImage(URL(string: "https:\(dayCondition?.condition?.icon ?? "")"))
            .resizable()
            .frame(width: 100, height: 100)
    }
}

