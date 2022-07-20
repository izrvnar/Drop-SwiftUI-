//
//  DetailView.swift
//  Drop
//
//  Created by Ivan Zrvnar on 2022-07-18.
//

import SwiftUI

struct DetailView: View {
    //MARK: -Properties
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    var clothingItem: ClothingItem
    var sortedTypeArray = [ClothingItem]()
   
    
    //MARK: Body
    var body: some View {
        ScrollView{
            VStack{
                Image("shoe")
                    .resizable()
                    .scaledToFit()
                
                Text(clothingItem.wrappedName.uppercased())
                    .font(.title)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    
                
                HStack{
                    Text("By: \(clothingItem.wrappedBrand.uppercased())")
                        .font(.subheadline)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(.black.opacity(0.75))
                        .clipShape(Capsule())
                    
                    Text("Date: \(clothingItem.wrappedDate.formatted().uppercased())")
                        .font(.subheadline)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(.black.opacity(0.75))
                        .clipShape(Capsule())
                    
                }
                Spacer()
                
               
                Text("Other tracked \(clothingItem.wrappedType)")
                ScrollView(.horizontal){
                    
                }

            }
        }
    }//: Body
    
    //MARK: -Methods
    
    func sortArray(){
    }

}//: Detail View

//struct DetailView_Previews: PreviewProvider {
//       static var previews: some View {
//           let clothingItem = ClothingItem()
//           clothingItem.name = "Cream GolfWang Chuck Lows"
//           clothingItem.brand = "Converse"
//           clothingItem.date = Date()
//           return DetailView(clothingItem: clothingItem)
//       }
//
//
//}
