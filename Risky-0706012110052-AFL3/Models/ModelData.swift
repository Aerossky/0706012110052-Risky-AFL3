//
//  ModelData.swift
//  Risky-0706012110052-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import Foundation
import Combine

//ObservalObject merupakan protokol yang membuat data dapat di proses secara real time.
final class ModelData: ObservableObject {
//    @Published adalah sebuah property wrapper pada SwiftUI yang memungkinkan objek yang menerapkannya untuk memberitahu view ketika nilai dari propertinya berubah. 
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    //membuat dictionary yang disimpan pada variable categories
    var categories: [String: [Landmark]] {
        Dictionary(
            //melakukan grup sesuai kategori dalam landmarks
            grouping: landmarks,
            //$0 digunakan untuk melakukan iterasi ke semua data yang ada pada landmarks
            by: { $0.category.rawValue }
        )
    }
}



var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
