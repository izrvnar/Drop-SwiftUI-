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
    
    //image picker
    @State private var image = UIImage(named: "camera")
    @State private var isShowingPhotoPicker = false
    
    @Environment(\.managedObjectContext) var moc
    
    
    
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
                    Image(uiImage: ((image ?? UIImage(systemName: "camera"))!))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150, alignment: .center)
                        .onTapGesture{
                            isShowingPhotoPicker.toggle()
                        }
                }header: {
                    Text("Add Image")
                }
                
                Section{
                    Button("Save"){
                       let newDrop = ClothingItem(context: moc)
                        newDrop.id = UUID()
                        newDrop.name = name
                        newDrop.brand = brand
                        newDrop.date = releaseDate
                        newDrop.link = link
                        newDrop.notes = notes
                        newDrop.type = type
                    }
                }
                
                
                
            }
            .navigationTitle("Add Drop")
            .sheet(isPresented: $isShowingPhotoPicker, content: {
                ImagePicker(image: $image)
            })
        }
        
        
        
    }//: Body
    
    func imagePicker(){
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        
        
    }
    
    
}//: Add Drop View


struct AddDropView_Previews: PreviewProvider {
    static var previews: some View {
        AddDropView()
    }
}
