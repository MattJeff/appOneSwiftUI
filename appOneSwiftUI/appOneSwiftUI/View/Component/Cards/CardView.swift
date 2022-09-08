//
//  CardView.swift
//  appOneSwiftUI
//
//  Created by Mathis Higuinen on 08/09/2022.
//

import SwiftUI

struct cardView:View{
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var body:some View{
        
      
        ZStack{
         
            
        VStack{
        HStack{
            VStack(alignment:.leading){
                Text("UI Design")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text("certificate")
                    .foregroundColor(Color("accent"))
            }
                Spacer()
                
                Image("Logo1")
            
        }
            Spacer()
            
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding([.horizontal,.top],20)
               
               
               
        }.padding()
            .padding(.top,70)
                .frame(width: width/1.28, height: height/3.8)
            .background(Color.black)
            .cornerRadius(20)
            .shadow(radius: 20)
        }
    }
}
