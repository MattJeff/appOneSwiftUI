//
//  RingView.swift
//  appOneSwiftUI
//
//  Created by Mathis Higuinen on 25/08/2022.
//

import SwiftUI

struct RingView: View {
    
    var color1 = #colorLiteral(red: 1, green: 0, blue: 0.3595997095, alpha: 1)
    var color2 = #colorLiteral(red: 0.5650364757, green: 0.1286155879, blue: 1, alpha: 1)
    var size:CGFloat = 100
    @State var pourcent:CGFloat = 0.0
    @State var show:Bool = false
    @Binding var upshow:Bool
    let timer = Timer.publish(every: 0.015, on: .main, in: .common).autoconnect()
    @State var predicat = 0.0

    var body: some View {
        
        let mutltiplier = size / 44
        let progress = 1-( predicat / 100)
      
        if !upshow {
            DispatchQueue.main.asyncAfter(deadline: .now() ) {
                self.predicat = 0.0
            }
        }
        
       return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1),
                        style: StrokeStyle(lineWidth: 5 * mutltiplier)
                )
                .frame(width: size, height: size)
            Circle()
               .trim(from: CGFloat(progress), to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(color1),Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        
                        style: StrokeStyle(lineWidth: 5 * mutltiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: size, height:size)
               
            .shadow(color: Color(color1).opacity(0.1), radius: 3 * mutltiplier, x: 0, y: 3 * mutltiplier)
           
                Text("\(predicat,specifier: "%.0f") %")
              
               .font(.system(size: 14*mutltiplier).bold())
            
       } .onReceive(timer, perform: { _ in
           
           if predicat < pourcent {
               predicat += 1.0
           }
          
       })
     
     
           
     
   
     

    }
}

