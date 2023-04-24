//
//  CategoryHome.swift
//  Risky-0706012110052-AFL3
//
//  Created by MacBook Pro on 24/04/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView {
            List {
                //featured
                modelData.features[0].image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .clipped()
                                    //menjadi rounded
                                    .listRowInsets(EdgeInsets())

                //melakukan perulangan foreach, id digunakan sebagai identifier
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
//                    Text(key)
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                                
                }
                .listRowInsets(EdgeInsets())

            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
