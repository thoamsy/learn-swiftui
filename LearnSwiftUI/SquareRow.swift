//
//  SquareRow.swift
//  LearnSwiftUI
//
//  Created by yk on 6/17/19.
//  Copyright © 2019 yk. All rights reserved.
//

import SwiftUI

struct Square: View {
  var label: String
  var body: some View {
    
    Text(label).bold().tapAction {
      _ = Alert(title: Text("Foobar"))
    }.frame(width: 40, height: 40)
  }
}

struct SquareRow : View {
  let label = "X"
  var body: some View {
      HStack {
        Square(label: label)
        Square(label: label)
        Square(label: label)
      }.frame(width: 120, height: 120)
  }
}

#if DEBUG
struct SquareRow_Previews : PreviewProvider {
  static var previews: some View {
    SquareRow()
  }
}
#endif
