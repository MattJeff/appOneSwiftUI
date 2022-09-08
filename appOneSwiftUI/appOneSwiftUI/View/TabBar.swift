//
//  TabBar.swift
//  appOneSwiftUI
//
//  Created by Mathis Higuinen on 25/08/2022.
//

import SwiftUI

struct TabBar: View {
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        TabView{
            Home()
                .tabItem({
                    VStack{
                        Image(systemName: "house")
                        Text("Home")
                    }
                })
             
            
            ContentView().edgesIgnoringSafeArea(.bottom)
                .tabItem({
                    Image(systemName: "rectangle.stack.fill")
                    Text("Certificates")
                }
                
                )
               
        }
        .edgesIgnoringSafeArea(.top)
           
           
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDisplayName("iPhone 12 pro Max").previewDevice("iPhone 12 Pro Max")
            TabBar().previewDisplayName("iPhone 8").previewDevice("iPhone 8")
            TabBar().previewDevice("iPhone 13 mini").previewDisplayName("iPhone 13 mini")
            TabBar().previewDisplayName("iPhone SE").previewDevice("iPhone SE (3rd generation)")
        }
    }
}
