//
//  CityRow.swift
//  LearnSwiftUI
//
//  Created by yk on 7/2/19.
//  Copyright © 2019 yk. All rights reserved.
//

import SwiftUI

struct CityRow : View {
  
  @ObjectBinding var city: City
  
  var body: some View {
   
  NavigationLink(destination: CityView(city: city)) {
      HStack(alignment: .firstTextBaseline) {
        Text(city.name)
          .lineLimit(nil)
          .font(.title)
        Spacer()
        HStack {
          city.weather?.current.icon.image
            .foregroundColor(Color.gray)
            .font(.title)
          Text(city.weather?.current.temperature.formattedTemperature ?? "-ºC")
            .color(.gray)
            .font(.title)
        }
        }
        .padding([.trailing, .top, .bottom])
    }
  }
}
