//
//  MenuView.swift
//  appOneSwiftUI
//
//  Created by Mathis Higuinen on 23/08/2022.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment:.leading, spacing:20){
            
                Text("Meng - 28% complete")
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6,alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .cornerRadius(8)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(.black.opacity(0.1))
                    .cornerRadius(12)
                
                MenueRow(title: "Account", image: "gear")
                MenueRow(title: "Billing", image: "creditcard")
                MenueRow(title: "Sign Out", image: "person.crop.circle.fill")
            }
            .frame(maxWidth:.infinity)
            .frame(height: UIScreen.main.bounds.height/3)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8176566362, green: 0.836425364, blue: 0.8877969384, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
            .shadow(color:.black.opacity(0.2),radius: 20,x:0,y:20)
            .padding(.horizontal)
            .overlay(
            
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset( y: -UIScreen.main.bounds.height/6)
                    .shadow(radius: 10)
            
            )
        }
        .padding(.bottom)
     
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
