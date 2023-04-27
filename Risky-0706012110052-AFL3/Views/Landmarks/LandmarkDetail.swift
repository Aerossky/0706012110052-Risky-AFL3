//
//  LandmarkDetail.swift
//  Risky-0706012110052-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    //membuat variable landmark yang isinya harus object landmark
    var landmark: Landmark

    var landmarkIndex: Int {
          modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
      }

    
    var body: some View {

        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
            //menghapus area atas notch
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()

            Spacer()
        }
        .navigationTitle(landmark.name)
        //kondisi ketika di layar mac dan di iphone
//        #if os(macOS)
//        
//        #elseif os(iOS)
//        .navigationBarTitleDisplayMode(.inline)
//        #endif

//                .navigationBarTitleDisplayMode(.inline)
//                .onAppear {
//                    dump(landmark)
//                }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
//        LandmarkDetail(landmark: ModelData().landmarks[0])ƒ
        LandmarkDetail(landmark: modelData.landmarks[0])
                  .environmentObject(modelData)
    }
}
