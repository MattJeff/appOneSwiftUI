//
//  UpdateList.swift
//  appOneSwiftUI
//
//  Created by Mathis Higuinen on 24/08/2022.
//

import SwiftUI

struct UpdateList: View {
    @StateObject  var updateViewModel = UpdateStore()
    
    func addUpdate(){
        updateViewModel.upadates.append(Update(image: "Card5", title: "New Item", text: "New Descriotion", date: String(Date().formatted(date: .abbreviated, time: .omitted))))
    }
    var body: some View {
        
        NavigationView{
            List{
                
                ForEach(updateViewModel.upadates) { item in
                    NavigationLink {
                        UpdateDetail(store: updateViewModel, update: item)
                    } label: {
                        HStack{
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(.black)
                                .cornerRadius(20)
                                .padding(.trailing)
                        VStack(alignment:.leading,spacing: 8){
                        Text("\(item.title)")
                            .font(.system(size: 20,weight: .bold))
                        Text(item.text)
                                .lineLimit(2)
                                .font(.subheadline)
                                .foregroundColor(Color(.systemGray3))
                            Text("\(item.date)".uppercased())
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                        }
                        }.padding(.vertical)
                    }
                    
                }.onDelete { index in
                    updateViewModel.upadates.remove(at: index.first!)
                }
                .onMove { index, int in
                    
                    updateViewModel.upadates.move(fromOffsets: index, toOffset: int)
                }
               
            } .listRowSeparator(.hidden)
                .listStyle(.plain)
                
            .navigationBarTitle(Text("Update View"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        addUpdate()
                    } label: {
                        Text("Add Update")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                   EditButton()

                }
            }
              
        }
       
        
    }
}

struct Update:Identifiable{
    
    var id = UUID()
    var image:String
    var title:String
    var text:String
    var date:String
}

let updateDate:[Update] = [
    
    Update(image: "Card1", title: "Swiftui Advanced", text: "Take your SwiftUIApp to the App Strore withe advanced technique like API data, package and CMS", date: "Jan 1"),
    Update(image: "Card2", title: "Webflow", text: "Design and animate a high converting landing page with advanced interactions, payments and CMS", date: "Jan 1"),
    Update(image: "Card3", title: "Protopie", text: "Quiclkly prototype advanced animations and interaction for mbile and web", date: "Aug 27"),
    Update(image: "Card4", title: "Swiftui", text: "Learn how to code custom UIs, animations, gestures dans components in Xcode 11", date: "JUN 26"),
    Update(image: "Card5", title: "Framer Playground", text: "Create powerfull animation and interaction with the framer X code editor", date: "JUN 11"),

]

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
