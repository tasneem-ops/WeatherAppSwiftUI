//
//  BackgroundImage.swift
//  WeatherApp
//
//  Created by JETSMobileLabMini9 on 20/05/2024.
//

import SwiftUI

struct BackgroundImage: View {
    var background : String
    var body: some View {
        Image(background)
        .resizable()
        .frame(width: 400, height: 950)
        .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    BackgroundImage(background: "Day")
}
