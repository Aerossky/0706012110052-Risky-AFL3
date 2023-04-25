//
//  Risky_0706012110052_AFL3App.swift
//  Risky-0706012110052-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import SwiftUI

@main
struct Risky_0706012110052_AFL3App: App {
   
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
            WindowGroup {
                ContentView()
                    .environmentObject(modelData)
            }
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        }
}
