//
//  DropCellView.swift
//  Drop
//
//  Created by Ivan Zrvnar on 2022-07-14.
//

import SwiftUI

struct DropCellView: View {
    var documentLibrary: URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        print(paths[0])
        
        return paths[0]
    }
    var clothingItem: ClothingItem
    var body: some View {
        HStack{
            Image(uiImage: fetchImage(withIdentifier: clothingItem.image ?? "empty")!)
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .cornerRadius(5)
            
            VStack(alignment: .leading, spacing: 10){
                Text(clothingItem.name ?? "Clothing Item")
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(clothingItem.date?.formatted() ?? Date().formatted())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom)
                
                HStack{
                    Button{
                        //TODO: Add image to go to link
                        
                    } label: {
                        Image(systemName: "link")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .tint(.black)
                    }
                    Spacer()
                    
                    Button{
                        //TODO: Add image to add to closet
                        
                    }label: {
                        Image(systemName: "star")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .tint(.black)
                            .padding(.horizontal)
                
                    }
                }
            }
            
 
        }.clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    func fetchImage(withIdentifier id: String) -> UIImage?{
        if let imagePath = documentLibrary?.appendingPathComponent(id), let imageFromDisk = UIImage(contentsOfFile: imagePath.path){
            return imageFromDisk
    }
        return nil
}
}

//struct DropCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        DropCellView(clothingItem: <#T##ClothingItem#>)
//    }
//}
