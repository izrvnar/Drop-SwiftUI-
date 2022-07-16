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
            .background(.regularMaterial)
            .shadow(radius: 2)
    }
}

struct DropCellView_Previews: PreviewProvider {
    static var previews: some View {
        DropCellView()
    }
}
