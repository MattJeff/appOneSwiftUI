//
//  MenueView.swift
//  appOneSwiftUI
//
//  Created by Mathis Higuinen on 23/08/2022.
//

import SwiftUI

struct MenueRow: View {
    var title:String
    var image:String
    var body: some View {
     
            
            Label {
                
                Text("\(title)")
                    .font(.system(size: 20,weight: .bold,design: .rounded))
                    .padding(.horizontal)
                    .frame(alignment: .leading)

            } icon: {
             
                Image(systemName: "\(image)")
                     .font(.system(size: 25,weight: .light))
                    .imageScale(.large)
                    .foregroundColor(Color(#colorLiteral(red: 0.6454612613, green: 0.7361159921, blue: 0.8412939906, alpha: 1)))
                    .frame(width: UIScreen.main.bounds.width/8,alignment: .leading)
                  
            }
        
    }
}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
       MenuView()
    }
}
