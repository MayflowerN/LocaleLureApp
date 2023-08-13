//
//  LocalLureApp.swift
//  LocalLure
//
//  Created by Ellie on 8/13/23.
//

import SwiftUI

@main
struct LocalLureApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
