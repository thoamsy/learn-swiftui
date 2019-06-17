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
    var body: some View {
      VStack {
      ForEach(1...row) { _ in
        SquareRow()
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
