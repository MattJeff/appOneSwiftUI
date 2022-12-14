//
//  ContentView.swift
//  appOneSwiftUI
//
//  Created by Mathis Higuinen on 17/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    
    //notification
    
    var body: some View {
        
        GeometryReader { proxy in
            ZStack{
                
               
                TitleView()
                    .blur(radius: showCard ? 10 : 0)
                    .opacity(showCard ? 0.4 : 1)
                    .offset(y: showCard ? -height/5 :0 )
                    .animation(
                        Animation
                            .default
                            .delay(0.1)
                            /*.speed(4)
                            .repeatCount(2,autoreverses: false)*/
                        
                    )
                
                
                BackcardView()
                    .frame(width: width/1.28, height: height/3.8)
                    .background(Color("card4"))
                    .cornerRadius(20)
                    .offset(x: 0, y: (showCard && !showFull) ? -400 : -40)
                    .offset(x: viewState.width, y: viewState.height)
                    .scaleEffect(0.9)
                    .rotationEffect(.degrees(show ? 0:10))
                    .rotationEffect(Angle(degrees: showCard ? -10:0))
                    .rotation3DEffect(Angle(degrees: 10), axis:(x:10.0,y:0,z:0))
                    .blendMode(.hardLight)
                    .animation(.easeInOut(duration: 0.5))
                   
                BackcardView()
                    .frame(width: width/1.28, height: height/3.8)
                    .background(Color("card3"))
                    .cornerRadius(20)
                    .offset(x: 0, y: (showCard && !showFull) ? -200:-20)
                    .offset(x: viewState.width, y: viewState.height)
                    .scaleEffect(0.95)
                    .rotationEffect(Angle(degrees: show ? 0:5))
                    .rotationEffect(Angle(degrees: showCard ? -5:0))
                    .rotation3DEffect(Angle(degrees: 5), axis:(x:10.0,y:0,z:0))
                    .blendMode(.hardLight)
                    .animation(.linear(duration: 0.3))
                
                cardView()
                    .offset(x: viewState.width, y: viewState.height)
                    .animation(.spring())
                    .blendMode(.hardLight)
                    .onTapGesture {
                        withAnimation {
                           // self.show.toggle()
                            self.showCard.toggle()
                        }
                       
                    }
                    .gesture(
                        DragGesture().onChanged{ value in
                            
                            self.viewState = value.translation
                        }
                            .onEnded{ value in
                                self.viewState = .zero
                                
                            }
                    )
                
               
                BottomCardView(show: $showCard)
                    .offset(x: 0, y: showCard ? proxy.size.height/1.6 : proxy.size.height  )
                    .offset( y: bottomState.height)
                    .blur(radius: show ? 20 : 0)
                    .animation(.easeInOut)
                    .gesture(
                    
                        DragGesture().onChanged
                            { value  in
       
                                self.bottomState = value.translation
                                
                                if self.showFull{
                                    self.bottomState.height +=  -proxy.size.height/1.6
                                }
                                
                                if self.bottomState.height < -proxy.size.height/1.6 {
                                    self.bottomState.height =  -proxy.size.height/1.6
                                }
           
                            }
                            .onEnded{ value in
                                
                                if self.bottomState.height > 40{
                                    self.showCard = false
                                }
                                
                                if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -proxy.size.height/1.55 && self.showFull){
                                    self.bottomState.height = -proxy.size.height/1.6
                                    self.showFull = true
                                }else{
                                    self.bottomState = .zero
                                    self.showFull = false
                                }
                              
        
                            }
                    
                    )
                   
            }.padding(.top)
        }
        
      
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


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

struct TitleView: View {
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var body: some View {
        VStack(spacing:30){
        HStack{
            Text("Certificates")
                .bold()
                .font(.largeTitle)
                
        }.frame(maxWidth:.infinity , alignment: .leading)
           Image("Background1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:width/1.1,height: height/3.8)
            
        }.frame(maxHeight:.infinity,alignment:.top)
            .padding(.horizontal)
            
    }
}


struct BackcardView:View{
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var body: some View{
        VStack{
        Spacer()
        }
            
           
    }
}


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
