//
//  AddDropView.swift
//  Drop
//
//  Created by Ivan Zrvnar on 2022-07-13.
//

import SwiftUI

struct AddDropView: View {
    //MARK: -Properties
    @State private var name = ""
    @State private var brand = ""
    @State private var releaseDate = Date()
    @State private var type = ""
    @State private var link = ""
    @State private var notes = ""
    
    
    
   // type array
    let types = ["Shoes", "Shirt", "Pants", "accessories", "other"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name:", text: $name)
                    TextField("Brand:", text: $brand)
                    DatePicker("Release Date", selection: $releaseDate)
                    
                    Picker("Type", selection: $type){
                        ForEach(types, id: \.self){
                            Text($0)
                        }
                    }
                    
                    TextField("Link:", text: $link)
                }
                
                Section{
                    TextEditor(text: $notes)
                } header: {
                    Text("Notes")
                }
                
                Section{
                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFit()
                }header: {
                    Text("Add Image")
                }
                
                Section{
                    Button("Save"){
                        //TODO: Create New Drop
                    }
                }
                
                
                
            }
            .navigationTitle("Add Drop")
        }
        
        
        
    }
    
    
}


struct AddDropView_Previews: PreviewProvider {
    static var previews: some View {
        AddDropView()
    }
}
