//
//  SquareRow.swift
//  LearnSwiftUI
//
//  Created by yk on 6/17/19.
//  Copyright © 2019 yk. All rights reserved.
//

import SwiftUI

struct Square: View {
  @Binding var isClicked: Bool
  
  var body: some View {
    let icon = Image(systemName: isClicked ? "star.fill" : "star").imageScale(.large)
    
    return Button(action: {
      withAnimation { self.isClicked.toggle() }
    }) {
      icon
      }.frame(
        width: 80,
        height: 80
      )
  }
}

struct SquareRow : View {
  @State var steps: Slice<[Bool]>
  
  var body: some View {
    HStack {
      Square(isClicked: $steps[0])
      Square(isClicked: $steps[1])
      Square(isClicked: $steps[2])
    }
  }
}

//#if DEBUG
//struct SquareRow_Previews : PreviewProvider {
//
//
//  static var previews: some View {
//    SquareRow)
//  }
//}
//#endif
