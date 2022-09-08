//
//  HomeView.swift
//  appOneSwiftUI
//
//  Created by Mathis Higuinen on 24/08/2022.
//

import SwiftUI

struct HomeView: View {
    
    
    
    @Binding var showProfile:Bool
    @State var showUpdate = false
    
    
    
   
    var body: some View {
        
        VStack{
            HStack{
                VStack(alignment:.leading){
                    Text("\(Date().formatted(date: .abbreviated, time: .omitted))")
                        .foregroundColor(.gray)
            Text("Watching")
                .modifier(CustomFontModifier())
                }
              
            Spacer()
     
            AvatarView(showProfile: $showProfile)
                
                Button {
                    self.showUpdate.toggle()
                } label: {
                    Image(systemName: "bell")
                        .renderingMode(.template)
                        .font(.system(size: 16,weight: .medium))
                        .foregroundColor(.black)
                        .frame(width: 36, height: 36)
                        .padding(10)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 0)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                    
                }.sheet(isPresented: $showUpdate) {
                    UpdateList()
                }

            }.padding(.horizontal)
                .padding(.leading)
                .padding(.top)
         
            ScrollView(.horizontal,showsIndicators: false){
                
                HStack(spacing:20){
            ForEach(sectionDate){ section in
                
                GeometryReader{ geometry in
                    
           
                    SectionView(section: section)
                        .rotation3DEffect(Angle(degrees:
                                                    Double(geometry.frame(in: .global).minX - 30 ) / -20
                                               ), axis: (x:0, y: 10, z: 0))
                        
                    
                }.frame(width: 275, height: 275)
               
                
            }
                }.padding()
                    .padding(.bottom,30)
                
            }
            
           
            Spacer()
            
        }
    }
}


struct  HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section:Section
    var body: some View {
        
        
        VStack{
            
        HStack(alignment:.top){
            Text("\(section.title)")
                .font(.system(size: 24,weight: .bold))
                .frame(width:160,alignment: .leading)
                .foregroundColor(.white)
            Spacer()
            Image("\(section.logo)")
        }
            Text("\(section.text)".uppercased())
                .frame(maxWidth:.infinity,alignment: .leading)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)

        }.padding([.horizontal,.top])
            .frame(width: .infinity, height: 275)
        .background(section.color)
            .cornerRadius(30)
            .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct Section:Identifiable{
    
    var id = UUID()
    var title:String
    var text:String
    var logo:String
    var image:Image
    var color:Color
}


let sectionDate:[Section] = [

    Section(title: "Prototype design in Swiftui", text: "18 Sections", logo: "Logo1", image: Image("Card1"), color: Color("card1")),
    Section(title: "Prototype design in Swiftui", text: "18 Sections", logo: "Logo1", image: Image("Card3"), color: Color("card3")),
    Section(title: "Prototype design in Swiftui", text: "18 Sections", logo: "Logo1", image: Image("Card2"), color: Color("card2")),
    Section(title: "Prototype design in Swiftui", text: "18 Sections", logo: "Logo1", image: Image("Card4"), color: Color("card4"))



]


