//
//  UpdateDetail.swift
//  appOneSwiftUI
//
//  Created by Mathis Higuinen on 25/08/2022.
//

import SwiftUI

struct UpdateDetail: View {
    
    @ObservedObject var store: UpdateStore
    
    var update:Update = updateDate[0]
    
    var body: some View {
      List{
        VStack{
                Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth:.infinity)
                Text("\(update.text)")
                .frame(maxWidth:.infinity,alignment: .leading)
        }
      }.listStyle(.plain)
       .navigationBarTitle(update.title)
       
       
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail(store: UpdateStore())
    }
}
