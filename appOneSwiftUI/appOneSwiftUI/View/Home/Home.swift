//
//  Home.swift
//  appOneSwiftUI
//
//  Created by Mathis Higuinen on 24/08/2022.
//

import SwiftUI

struct AvatarView: View {
    @Binding var showProfile:Bool
    var body: some View {
        
            Button {
                self.showProfile.toggle()
            } label: {
                Image("Avatar")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 46, height: 46)
                    
                    .clipShape(Circle())
                    
                    .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 0)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
            }

    }
}

struct Home: View {
    @State var showProfile = false
    @State var newState = CGSize.zero
    @State var showContent = false
    var body: some View {
        ZStack{
            Color(.clear)
                .ignoresSafeArea()
            HomeView(showProfile: $showProfile, showContent: $showContent)
                .padding(.top,44)
                .background(
                    VStack{
                    LinearGradient(gradient: Gradient(colors: [Color("background2"),Color.white]), startPoint: .top, endPoint: .bottom)
                            .frame( height: 200)
                        Spacer()
                    }.background(.white)
                
                )
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(Angle(degrees: showProfile ? Double(self.newState.height/10)-10 : 0), axis: (x: 10, y: 0, z: 0))
                
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.spring())
                .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0:screen.height)
                .offset( y: newState.height)
                .animation(.spring())
            
                .gesture(
                    DragGesture().onChanged{ value in
                    
                        if value.translation.height > 0.0 {
                   
                            self.newState = value.translation
                        }
                    
                }
                    .onEnded{ value in
                        if self.newState.height < 0.0{
                        self.newState = .zero
                        }else if self.newState.height > 50{
                            self.showProfile = false
                            self.newState = .zero
                        }
                    }
                    )
            
            if showContent {
                Color(.white).edgesIgnoringSafeArea(.all)
                ContentView()
                    .transition(.move(edge: .bottom))
                    .animation(.spring())
                    .offset( y: -30)
                   
                VStack{
                HStack{
                    
                Image(systemName: "xmark")
                        .padding()
                    .foregroundColor(.white)
                    .background(.black)
                    .clipShape(Circle())
                }.frame(maxWidth:.infinity,alignment:.trailing)
                    Spacer()
                }.padding()
                   
                    .onTapGesture {
                        self.showContent = false
                    }
                    .transition(.move(edge: .bottom))
                    .animation(.spring())
                  
            }
            
      
            
           
        }
    }
}


let screen = UIScreen.main.bounds

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


