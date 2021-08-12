//
//  RGBToHexApp.swift
//  RGBToHex
//
//  Created by Luke Barkhuizen on 2021/08/10.
//

import SwiftUI

@main
struct RGBToHexApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: RgbToHexViewModel())
        }
    }
}
