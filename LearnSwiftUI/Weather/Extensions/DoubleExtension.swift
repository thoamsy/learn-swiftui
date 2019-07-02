//
//  DoubleExtension.swift
//  LearnSwiftUI
//
//  Created by yk on 7/2/19.
//  Copyright © 2019 yk. All rights reserved.
//

import Foundation

extension Double {
  var formattedTemperature: String {
    let formatter = NumberFormatter()
    formatter.allowsFloats = false
    
    let formattedDouble = formatter.string(from: NSNumber(value: self)) ?? "-"
    
    return formattedDouble + "°C"
  }
}
