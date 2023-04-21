//
//  LandmarkList.swift
//  Risky-0706012110052-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = true
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            // kalau false maka akan masuk ke dalam kondisi pertama
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
//        NavigationView {
//        List(landmarks) { landmark in
//        LandmarkRow(landmark:landmark)
//            }
//            .navigationTitle("Landmarks")
//        }
//
        NavigationStack{
            List(filteredLandmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
            
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
     LandmarkList()
    }
}
