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
    //MARK: -Body
    var body: some View {
        NavigationView{
            List{
                
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
}//: ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
