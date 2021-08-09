//
//  DinsCapstoneApp.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/9/21.
//

import SwiftUI

@main
struct DinsCapstoneApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
