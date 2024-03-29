//
//  ContentView.swift
//  Beer
//
//  Created by Victor Kimpel on 26.09.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
         
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
            }.navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    
    @State var selected = "Witbier"
    
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
            
            HStack {
                
                ForEach(origins, id: \.self) { i in
                    
                    HStack {
                        
                        Button(action: {
                            
                            self.selected = i
                            
                        }) {
                            
                            Text(i).padding()
                        }
                        .foregroundColor(self.selected == i ? .white : .black)
                        .background(self.selected == i ? Color.black : Color.clear)
                        .cornerRadius(10)
                        
                        Spacer(minLength: 0)
                        
                    }
                }
            }
            
            DetailsScroll()
            
        }.padding()
        .background(Color("Color"))
        .animation(.spring())
            
    }
}

struct DetailsScroll: View {
    
    @State var show = false
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 12) {
                
                ForEach(datas) { i in
                    
                    HStack {
                        
                        ForEach(i.rows) { j in
                            
                            Cards(row: j)
                        }
                    }
                }
            }
        }
    }
}

struct Cards: View {
    
    var row: row
    @State var show = false

    
    var body: some View {
        
        VStack(spacing: 8) {
            
            NavigationLink(destination: DetailView(show: $show), isActive: $show) {
                
                Image(row.image).renderingMode(.original).resizable().frame(width: UIScreen.main.bounds.width / 2 - 25, height: 240)
            }
            
         
            
            HStack {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(row.name)
                    Text(row.price).fontWeight(.heavy)
                    
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

struct DetailView: View {
    
    @Binding var show: Bool
    @State var size = ""
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack(spacing: 18) {
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    
                    Image("Back").renderingMode(.original)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("search").renderingMode(.original)
                }
                
                Button(action: {
                    
                }) {
                    
                    Image("shop").renderingMode(.original)
                }
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .padding(15)
            
            Image("pic1").resizable()
            
            VStack(alignment: .leading, spacing: 15) {
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Summer Vibes").font(.largeTitle)
                        Text("$1.99").fontWeight(.heavy)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                        
                        Circle().fill(Color.green).frame(width: 20, height: 20)
                        Circle().fill(Color.yellow).frame(width: 20, height: 20)
                        Circle().fill(Color.red).frame(width: 20, height: 20)
                    }
                }

                
                Text("The world's most popular premium beer brand. Bright and dynamic, creative and cosmopolitan")
                
                Text("Select Size")
                
                HStack {
                    
                    ForEach(sizes, id: \.self) { i in
                        
                        Button(action: {
                            
                            self.size = i
                            
                        }) {
                            
                            Text(i).padding().border(Color.black, width: self.size == i ? 1.5 : 0)
                            
                        }.foregroundColor(.black)
                    }
                }
                
                HStack {
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Add To Cart").padding().border(Color.black, width: 1.4)
                        
                    }.foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Buy Now").padding()
                        
                    }.foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    
                }.padding([.leading,.trailing], 15)
                .padding(.top, 15)
                
            }.padding()
                .background(rounded().fill(Color.white))
                .padding(.top, -50)
            
        }
    }
}

struct rounded: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
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
    
    type(id: 2, rows: [row(id: 0, name: "Obolon", price: "$1.29", image: "obolon"), row(id: 1, name: "Alivariya", price: "$1.44", image: "alivariya")]),


]
