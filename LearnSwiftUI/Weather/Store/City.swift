//
//  City.swift
//  LearnSwiftUI
//
//  Created by yk on 7/2/19.
//  Copyright © 2019 yk. All rights reserved.
//

import SwiftUI
import Combine

class City: BindableObject {
  var didChange = PassthroughSubject<City, Never>()
  let name: String
  let longitude: Double
  let latitude: Double
  
  var weather: Weather? {
    didSet {
      didChange.send(self)
    }
  }
  
  init(name: String = "Chambery") {
    self.name = name
    self.longitude = 5.915807
    self.latitude = 45.572353
    self.getWeather()
  }
  
  
  private func getWeather() {
    WeatherManager.getWeather(for: self) { weather in 
      DispatchQueue.main.async {
        self.weather = weather
      }
    }
  }
}
