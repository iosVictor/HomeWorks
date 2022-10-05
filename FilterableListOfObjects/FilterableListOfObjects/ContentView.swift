//
//  ContentView.swift
//  FilterableListOfObjects
//
//  Created by Victor Kimpel on 20.09.22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var ojectModel = BrandListViewModel()
    
    var body: some View {
        List {
            FilterView().environmentObject(ojectModel)
            ObjectsView().environmentObject(ojectModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

struct FilterView: View {
    
    @EnvironmentObject var objectModel: BrandListViewModel
    
    var body: some View {
        Toggle(isOn: $objectModel.isFiltered) {
            Text(objectModel.toggleBrand)
        }
    }
}

struct ObjectsView: View {
    
    @EnvironmentObject var objectModel: BrandListViewModel
    
    var body: some View {
        if objectModel.cars.contains(where: { $0.isFiltered || !objectModel.isFiltered }) {
            ForEach($objectModel.cars, id: \.id) { $car in
                Group {
                    if objectModel.isFiltered == false {
                        Text(car.brand)
                    }
                }
            }
        } else {
            ForEach($objectModel.cars, id: \.id) { $car in
                Group {
                    if objectModel.isFiltered == true {
//                        Text(car.brand)
                    }
                }
            }
        }
    }
}

