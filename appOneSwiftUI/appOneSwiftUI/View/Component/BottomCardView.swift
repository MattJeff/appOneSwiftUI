//
//  BottomCardView.swift
//  appOneSwiftUI
//
//  Created by Mathis Higuinen on 08/09/2022.
//

import SwiftUI


struct BottomCardView: View {
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    @Binding  var show:Bool
    var body: some View {
        VStack(spacing:20){
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 40, height: 5)
                .opacity(0.1)
            Text("This certificate is proof that Meng To has achieved the UIDesign course with approvad from a Design+Code instructor")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            
            HStack{
            
            RingView(color1: #colorLiteral(red: 1, green: 0.3138173819, blue: 0, alpha: 1), color2:#colorLiteral(red: 1, green: 0.8147467971, blue: 0, alpha: 1), size: 88, pourcent: 78, upshow: $show)
              Spacer()
                VStack(alignment:.leading,spacing:20){
                    Text("SwiftUI").fontWeight(.bold)
                    Text("12 of 12 section completed\n10 hours spent so far")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }.padding()
                    .background(.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                   
                    
                
            }.padding(.horizontal)
                .padding(.horizontal)
               
            Spacer()
            
        } .padding(.top,8)
            .padding(.horizontal,20)
            .frame(maxWidth: .infinity)
        .background(.white)
            .cornerRadius(30)
            .shadow(radius: 20)
          
           
          
    }
}
