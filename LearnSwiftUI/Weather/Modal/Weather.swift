//
//  Weather.swift
//  LearnSwiftUI
//
//  Created by yk on 7/2/19.
//  Copyright © 2019 yk. All rights reserved.
//
import SwiftUI
struct Weather: Codable {
  var current: HourlyWeather
  var hours: Self.List<HourlyWeather>
  var week: Self.List<DailyWeather>
  
  struct List<T: Codable & Identifiable>: Codable {
    var list: [T]
    enum CodingKeys: String, CodingKey {
      case list = "data"
    }
  }
  
  enum Icon: String, Codable {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case rain
    case snow
    case wind
    case sleet
    case fog
    case cloudy
    case partyCloudyDay = "partly-cloudy-day"
    case partyCloudyNight = "partly-cloudy-night"
    
    var image: Image {
      switch self {
      case .clearDay:
        return Image(systemName: "sun.max.fill")
      case .clearNight:
        return Image(systemName: "moon.stars.fill")
      case .rain:
        return Image(systemName: "cloud.rain.fill")
      case .snow:
        return Image(systemName: "snow")
      case .sleet:
        return Image(systemName: "cloud.sleet.fill")
      case .wind:
        return Image(systemName: "wind")
      case .fog:
        return Image(systemName: "cloud.fog.fill")
      case .cloudy:
        return Image(systemName: "cloud.fill")
      case .partyCloudyDay:
        return Image(systemName: "cloud.sun.fill")
      case .partyCloudyNight:
        return Image(systemName: "cloud.moon.fill")
        
      }
    }
  }
}


struct DailyWeather: Codable, Identifiable {
  var id: Date {
    time
  }
  var time: Date
  var maxTemperature: Double
  var minTemperature: Double
  var icon: Weather.Icon
  
  enum CodingKeys: String, CodingKey {
    case time
    case maxTemperature = "temperatureHigh"
    case minTemperature = "temperatureLow"
    case icon = "icon"
  }
}

struct HourlyWeather: Codable, Identifiable {
  var id: Date {
    time
  }
  
  var time: Date
  var temperature: Double
  var icon: Weather.Icon
  
}
