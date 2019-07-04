//
//  File.swift
//  LearnSwiftUI
//
//  Created by yk on 7/4/19.
//  Copyright © 2019 yk. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
  struct Key {
    static let darkKey = "d4307b57dc6acac1070b21be47862c48"
  }
  
  struct APIURL {
    
    static func weatherRequest(longitude: Double, latitude: Double) -> String {
      return "https://api.darksky.net/forecast/\(NetworkManager.Key.darkKey)/\(latitude),\(longitude)?units=ca&lang=fr"
    }
    
  }
}
