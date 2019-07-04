//
//  CityListView.swift
//  LearnSwiftUI
//
//  Created by yk on 7/2/19.
//  Copyright © 2019 yk. All rights reserved.
//

import SwiftUI


struct CityHeaderView: View {
  @ObjectBinding var city: City
  var temperature: String {
    guard let temperature = city.weather?.current.temperature else {
      return "-°C"
    }
    
    return temperature.formattedTemperature
  }
  
  var body: some View {
    HStack {
      Spacer()
      HStack(spacing: 16) {
        city.weather?.current.icon.image.font(.largeTitle)
        Text(temperature).font(.largeTitle)
      }
      Spacer()
    }.frame(height: 110)
  }
}

struct CityHourlyView : View {
  
  @ObjectBinding var city: City
  
  private let rowHeight: CGFloat = 110
  
  var body: some View {
    ScrollView {
      HStack(spacing: 16) {
        ForEach(city.weather?.hours.list ?? []) { hour in
          VStack(spacing: 16) {
            Text(hour.time.formattedHour).font(.footnote)
            hour.icon.image.font(.body)
            Text(hour.temperature.formattedTemperature).font(.headline)
          }
        }
        }
        .frame(height: rowHeight)
        .padding(.trailing)
      }
      .listRowInsets(EdgeInsets())
      .frame(height: rowHeight)
  }
  
}

struct CityDailyView: View {
  @State var day: DailyWeather
  
  var body: some View {
    ZStack {
      HStack(alignment: .center) {
        Text(day.time.formattedDay)
        Spacer()
        HStack(spacing: 16) {
          verticalTemperatureView(min: true)
          verticalTemperatureView(min: true)
        }
      }
      HStack {
        Spacer()
        day.icon.image.font(.body)
        Spacer()
      }
    }
  }
  
  func verticalTemperatureView(min: Bool) -> some View {
    VStack(alignment: .trailing) {
      Text(min ? "min" : "max").font(.footnote)
        .color(.gray)
      Text(
        min
          ? day.minTemperature.formattedTemperature
          : day.maxTemperature.formattedTemperature
        ).font(.headline)
    }
  }
}

struct CityView: View {
  @ObjectBinding var city: City
  var body: some View {
    List {
      Section(header: Text("Now")) {
        CityHeaderView(city: city)
      }
      
      Section(header: Text("Hourly")) {
        CityHourlyView(city: city)
      }
      
      Section(header: Text("This Week")) {
        ForEach(city.weather?.week.list ?? []) { day in
          CityDailyView(day: day)
        }
      }
    }
    .navigationBarTitle(Text(city.name))
  }
}

struct CityListView : View {
  
  @EnvironmentObject var cityStore: CityStore
  
  @State var isAddingCity: Bool = false
  @State private var isEditing: Bool = false
  
  var body: some View {
    NavigationView {
      List {
        Section(header: Text("Your Cities")) {
          ForEach(cityStore.cities) { city in
            CityRow(city: city)
            }
            .onDelete(perform: delete)
            .onMove(perform: move)
        }
        }
        .navigationBarItems(leading: EditButton(), trailing: addButton)
        .navigationBarTitle(Text("Weather"), displayMode: .inline)
    }
  }
  
  private var addButton: some View {
    Button(action: {
      self.isAddingCity = true
      self.isEditing = false
    }) {
      Image(systemName: "plus.circle.fill")
        .font(.title)
      }
      .presentation(isAddingCity ? newCityView : nil)
  }
  
  private func delete(at offsets: IndexSet) {
    for index in offsets { 
      cityStore.cities.remove(at: index)
    }
  }
  
  private func move(from source: IndexSet, to destination: Int) {
    var removeCities: [City] = []
    
    for index in source {
      removeCities.append(cityStore.cities[index])
      cityStore.cities.remove(at: index)
    }
    
    cityStore.cities.insert(contentsOf: removeCities, at: destination)
  }
  
  private var newCityView: Modal {
    Modal(NewCityView(
      isAddingCity: $isAddingCity
    ).environmentObject(cityStore)) {
      self.isAddingCity = false
    }
  }
  
}

#if DEBUG
struct CityListView_Previews : PreviewProvider {
  static var previews: some View {
    CityListView().environmentObject(CityStore())
  }
}
#endif
