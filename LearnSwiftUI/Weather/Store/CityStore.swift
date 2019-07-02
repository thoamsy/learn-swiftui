//
//  CityStore.swift
//  LearnSwiftUI
//
//  Created by yk on 7/2/19.
//  Copyright © 2019 yk. All rights reserved.
//

import SwiftUI
import Combine

class CityStore: BindableObject {
  let didChange =  PassthroughSubject<CityStore, Never>()
  
  var cities: [City] = [City(name: "Shangrao")] {
    didSet {
      didChange.send(self)
    }
  }
}
