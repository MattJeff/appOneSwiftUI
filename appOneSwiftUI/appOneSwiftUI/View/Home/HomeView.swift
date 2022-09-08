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
    @State var upShow = true
    @Binding var showContent:Bool
    
    
   
    var body: some View {
        
        let dataRinView = [
            RingView(color1: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), color2:#colorLiteral(red: 0.5149679184, green: 0.1725562215, blue: 1, alpha: 1), size: 44, pourcent: 67, show: true, upshow:$upShow, predicat: 0.0),
            RingView(color1: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), color2:#colorLiteral(red: 0.5149679184, green: 0.1725562215, blue: 1, alpha: 1), size: 44, pourcent: 67, show: true, upshow:$upShow, predicat: 0.0),
            RingView(color1: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), color2:#colorLiteral(red: 0.5149679184, green: 0.1725562215, blue: 1, alpha: 1), size: 44, pourcent: 67, show: true, upshow:$upShow, predicat: 0.0),
            RingView(color1: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), color2:#colorLiteral(red: 0.5149679184, green: 0.1725562215, blue: 1, alpha: 1), size: 44, pourcent: 67, show: true, upshow:$upShow, predicat: 0.0),
        ]
        
        ScrollView{
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
                HStack(spacing:10){
                    ForEach(dataRinView.indices){ index in
                        HStack{
                        dataRinView[index]
                           
                            VStack(alignment:.leading,spacing: 4){
                                Text("6 minutes left").bold().modifier(FontModifier(style: .subheadline))
                                
                                Text("Watched 10 min today").modifier(FontModifier(style: .caption))
                                
                            }.modifier(FontModifier())
                        }.padding(8)
                            .background(.white)
                            .cornerRadius(20)
                            .modifier(shadowModifier())
                            .padding(.bottom)
                            .padding(.leading)
                            .onTapGesture {
                                self.showContent = true
                            }
  
                    }
                }.padding(.bottom)
            }
         
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
                
            }.offset( y: -30)
            
            VStack{
                HStack{
            Text("Courses")
                    .bold()
                .modifier(CustomFontModifier())
                .padding(.horizontal)
                }.frame(maxWidth: .infinity,alignment:.leading)
                
                SectionView(section:sectionDate[2] ).padding(.horizontal)
            }.padding(.horizontal)
            
           
            Spacer()
            
        }
    }
}


struct  HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
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


