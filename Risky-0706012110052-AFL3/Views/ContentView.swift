//
//  ContentView.swift
//  Risky-0706012110052-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import SwiftUI


struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    enum Tab {
          case featured
          case list
      }
    
    var body: some View {
        //        LandmarkList()
        TabView(selection: $selection) {
            //tombol navigasi featured
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            //tombol navigasi list
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
