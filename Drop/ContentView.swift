//
//  ContentView.swift
//  Drop
//
//  Created by Ivan Zrvnar on 2022-07-13.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @State private var showingAddScreen = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date),
        SortDescriptor(\.name)
    
    ])
    
    var dropList: FetchedResults<ClothingItem>
    //MARK: -Body
    var body: some View {
        NavigationView{
            List{
                ForEach(dropList){ item in
                    NavigationLink{
                        DetailView(clothingItem: item)
                    } label: {
                        DropCellView(clothingItem: item)

                    }
                }
                .onDelete(perform: deleteItems)
         
            }
            .navigationTitle("Drop")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showingAddScreen.toggle()
                    }label: {
                        Label("Add Drop", systemImage: "plus")
                    }
                }
                
            }
            .sheet(isPresented: $showingAddScreen, content: {
                AddDropView()
            })
        }
    }//: Body
    
    //MARK: - Methods
    // delete item function
    func deleteItems(at offsets: IndexSet) {
        for offset in offsets{
            let clothingItem = dropList[offset]
            moc.delete(clothingItem)
        }
        
        try? moc.save()
    
    }
    
}//: ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
