//
//  EasyForm.swift
//  LearnSwiftUI
//
//  Created by yk on 6/20/19.
//  Copyright © 2019 yk. All rights reserved.
//

import SwiftUI


extension Color {
  public static subscript(_ rgb: String) -> Color? {
    
    get {
      var start = rgb.startIndex
      var next = rgb.index(after: start)
      guard let r = Int(rgb[start...next], radix: 16) else { return nil }
      
      start = rgb.index(after: next)
      next = rgb.index(after: start)
      
      guard let g = Int(rgb[start...next], radix: 16) else {
        return nil
      }
      
      start = rgb.index(after: next)
      next = rgb.index(after: start)
      guard let b = Int(rgb[start...next], radix: 16) else {
        return nil
      }
      print(r, g, b)
      return Color(red: Double(r) / 255.0, green: Double(g) / 255.0, blue: Double(b) / 255.0, opacity: 1.0)
    }
  }
}

struct RoundedButton: View {
  let oo = Color["aaaaaa"]
  var body: some View {
    Button(action: {}) {
      HStack {
        Spacer()
        Text("Save")
          .font(.headline)
          .color(.white)
        Spacer()
      }
      }
      .padding(.vertical, 10.0)
      .background(Color.red, cornerRadius: 4.0)
      .padding(.horizontal, 50)
  }
}

struct LabelTextField: View {
  let label: String
  let placeholder: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(label).font(.headline)
      
      TextField(placeholder, text: .constant(""))
        .padding(.all)
        .background(Color["eff3ef"]!)
      }.padding(.horizontal, 15)
  }
}

struct EasyForm : View {
  var body: some View {
    
    NavigationView {
      List {
        
        Image("chicken")
          .resizable()
          .scaledToFill()
          .frame(height: 300)
          .clipped()
          .listRowInsets(EdgeInsets())
        
        VStack(alignment: .leading) {
          LabelTextField(label: "Name", placeholder: "Fill Your Name")
          LabelTextField(label: "TYPE", placeholder: "Fill Your TYPE")
          
          RoundedButton().padding(.top, 20)
          }
          .padding(.top, 20)
          .listRowInsets(EdgeInsets())
        
        
        }.navigationBarTitle(
          Text("New Resuauration"),
          displayMode: .inline
        )
        .navigationBarItems(
          trailing: Button(action: {
            
          }, label: { Text("Cancel") }
          )
      )
    }
    
  }
}

#if DEBUG
struct EasyForm_Previews : PreviewProvider {
  static var previews: some View {
    Group {
      RoundedButton().previewLayout(.sizeThatFits)
      EasyForm()
    }
  }
}
#endif
