//
//  ContentView.swift
//  Beer
//
//  Created by Victor Kimpel on 26.09.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        VStack(spacing: 15) {
            
            ZStack {
                
                Text("MMM-Beer").font(.title)
                
                HStack(spacing: 18) {
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("Menu")
                            .renderingMode(.original)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("search").renderingMode(.original)
                    }
                    
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("noti").renderingMode(.original)
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("shop").renderingMode(.original)
                    }
                    
                }
            }.background(Color.white)
            .padding([.leading, .trailing, .top], 15)
            
            MainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            HStack {
                
                HStack {
                    
                    Button(action: {
                        
                    }) {
                        
                        HStack {
                            
                            Text("Beer type")
                            
                            Spacer()
                            
                            Image("down")
                            
                        }.padding()
                    }.foregroundColor(.black)
                        .background(Color.white)
                    
                    
                    Button(action: {
                        
                        
                    }) {
                        
                        Image("filter").renderingMode(.original).padding()
                        
                    }.background(Color.white)
                }
            }
            
            DetailsScroll()
            
        }.padding()
        .background(Color("Color"))
            
    }
}

struct DetailsScroll: View {
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 12) {
                
                ForEach(datas) { i in
                    
                    HStack {
                        
                        ForEach(i.rows) { j in
                            
                            VStack(spacing: 8) {
                                
                                Image(j.image).resizable().frame(width: UIScreen.main.bounds.width / 2 - 25, height: 240)
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        
                                        Text(j.name)
                                        Text(j.price).fontWeight(.heavy)
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                    }) {
                                        
                                        Image("option").renderingMode(.original)
                                        
                                    }.padding(.trailing, 15)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


struct type: Identifiable {
    
    var id: Int
    var rows: [row]
}

struct row: Identifiable {
    
    var id: Int
    var name: String
    var price: String
    var image: String
}




var sizes = ["0.25", "0.33", "0.44", "0.52"]

var origins = ["Witbier", "Schwarzbier", "Pale Ale", "Lager"]

var datas = [

    type(id: 0, rows: [row(id: 0, name: "Heineken", price: "$1.99", image: "heineken"), row(id: 1, name: "Tuborg", price: "$1.84", image: "tuborg")]),
    
    type(id: 2, rows: [row(id: 0, name: "Obolon", price: "$1.29", image: "obolon"), row(id: 1, name: "Gus", price: "$1.44", image: "gus")]),


]
