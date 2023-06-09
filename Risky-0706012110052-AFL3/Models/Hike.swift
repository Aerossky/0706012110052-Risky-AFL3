//
//  Hike.swift
//  Risky-0706012110052-AFL3
//
//  Created by MacBook Pro on 22/04/23.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
    //menenukan struktur file
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]

    static var formatter = LengthFormatter()

    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }

    struct Observation: Codable, Hashable {
        var distanceFromStart: Double

        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
