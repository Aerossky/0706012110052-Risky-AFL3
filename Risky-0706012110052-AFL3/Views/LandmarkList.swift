//
//  LandmarkList.swift
//  Risky-0706012110052-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
//        NavigationView {
//        List(landmarks) { landmark in
//        LandmarkRow(landmark:landmark)
//            }
//            .navigationTitle("Landmarks")
//        }
//
        NavigationStack{
            List(landmarks) { landmark in
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
        ForEach(["iPhone SE (3rd generation)", "iPhone XS Max"], id: \.self) { deviceName in
                  LandmarkList()
                      .previewDevice(PreviewDevice(rawValue: deviceName))
              }
    }
}
