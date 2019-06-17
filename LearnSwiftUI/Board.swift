//
//  Board.swift
//  LearnSwiftUI
//
//  Created by yk on 6/17/19.
//  Copyright © 2019 yk. All rights reserved.
//

import SwiftUI

struct Board : View {
  let row = 3
  @State var isMe = false
  @State var steps = Array(repeatElement("circle", count: 3 * 3))
  
  var body: some View {
    print(steps)
    
    return VStack {
      ForEach(1...row) { now in
        SquareRow(
          steps: self.steps[now * 3 ..< (now + 1) * 3],
          isMe: self.$isMe
        )
      }
    }
  }
}

#if DEBUG
struct Board_Previews : PreviewProvider {
  static var previews: some View {
    Board()
  }
}
#endif
