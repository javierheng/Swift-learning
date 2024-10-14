//
//  VacationInVegasApp.swift
//  VacationInVegas
//
//  Created by javier on 2024/10/13.
//

import SwiftUI

@main
struct VacationInVegasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Place.self)
    }
}
