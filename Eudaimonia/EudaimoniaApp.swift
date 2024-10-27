//
//  EudaimoniaApp.swift
//  Eudaimonia
//
//  Created by Aryan Khimani on 2023-10-09.
//

import SwiftUI

@main

struct EudaimoniaApp: App {
    @StateObject var sharedData = SharedData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sharedData)
        }
    }
}
