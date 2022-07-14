//
//  DropCellView.swift
//  Drop
//
//  Created by Ivan Zrvnar on 2022-07-14.
//

import SwiftUI

struct DropCellView: View {
    var body: some View {
        HStack{
            Image("shoe")
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .cornerRadius(5)
            
            VStack(alignment: .leading, spacing: 10){
                Text("Off White Golf Wang")
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text("Release Date: Today")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack{
                    Button("Link"){
                        //TODO: Add image to go to link
                        
                    }
                    Spacer()
                    
                    Button("Closet"){
                        //TODO: Add image to add to closet
                        
                    }
                }
            }
            
 
        }.clipShape(RoundedRectangle(cornerRadius: 10))
            .background(.regularMaterial)
    }
}

struct DropCellView_Previews: PreviewProvider {
    static var previews: some View {
        DropCellView()
    }
}
