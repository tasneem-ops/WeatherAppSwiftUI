//
//  CustomText.swift
//  WeatherApp
//
//  Created by JETSMobileLabMini9 on 20/05/2024.
//

import SwiftUI

struct CustomText: View {
    var text : String
    var isDay : Bool
    var body: some View {
        Text(text)
            .fontDesign(.serif)
            .foregroundStyle(isDay ? Color.black : Color.white)
    }
}
