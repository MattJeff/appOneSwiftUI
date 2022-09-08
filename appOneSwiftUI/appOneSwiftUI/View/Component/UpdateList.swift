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


struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
