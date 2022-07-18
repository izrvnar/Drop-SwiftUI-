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
    
    @Environment(\.dismiss) var dismiss
    
    //image picker
    @State private var image = UIImage(systemName: "camera")
    @State private var isShowingPhotoPicker = false
    // document library property
    var documentLibrary: URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        print(paths[0])
        
        return paths[0]
    }
    
    @Environment(\.managedObjectContext) var moc
    
    
    
   // type array
    let types = ["Shoes", "Shirt", "Pants", "Accessories", "Other"]
    
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
                        
                        if let image = image{
                            let clothingImage = UUID().uuidString
                            newDrop.image = clothingImage
                            saveImage(image: image, withIdentifier: clothingImage)
                        }
                        
                        try? moc.save()
                        dismiss()
                    }
                }
                
                
                
            }
            .navigationTitle("Add Drop")
            .sheet(isPresented: $isShowingPhotoPicker, content: {
                ImagePicker(image: $image)
            })
        }
        
        
        
    }//: Body
    
//MARK: Image methods
    func fetchImage(withIdentifier id: String) -> UIImage?{
        if let imagePath = documentLibrary?.appendingPathComponent(id), let imageFromDisk = UIImage(contentsOfFile: imagePath.path){
            return imageFromDisk
    }
        return nil
}
    
    func saveImage(image: UIImage, withIdentifier id: String){
        if let imagePath = documentLibrary?.appendingPathComponent(id){
            if let data = image.jpegData(compressionQuality: 0.8){
                do {
                    try data.write(to: imagePath)
                } catch {
                    print("Error saving the image - \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    
    
    
}//: Add Drop View


struct AddDropView_Previews: PreviewProvider {
    static var previews: some View {
        AddDropView()
    }
}
