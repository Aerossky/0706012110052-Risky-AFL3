//
//  LandmarkRow.swift
//  Risky-0706012110052-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct LandmarkRow: View {
//    inisialisasi struct landmark
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image
            .resizable()
            .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
