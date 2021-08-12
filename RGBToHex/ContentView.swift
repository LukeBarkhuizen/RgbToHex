//
//  ContentView.swift
//  RGBToHex
//
//  Created by Luke Barkhuizen on 2021/08/10.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private(set) var vm: RgbToHexViewModel
    @State private var selectedColor = Color.black
    @State private var color: String = ""
    
    init(vm: RgbToHexViewModel) {
        self.vm = vm
    }
 
  var body: some View {
    VStack(alignment: .center) {
        Text("RGB to Hex").foregroundColor(selectedColor).font(.largeTitle)
      ColorPicker(
        "Pick a color",
        selection: $selectedColor
      ).frame(width: 150, height: 100).padding(.bottom, 16)
        Text("R \(selectedColor.components.red)")
        Text("G \(selectedColor.components.green)")
        Text("B \(selectedColor.components.blue)")
        HStack {
            
            PrimaryButton(title: "Click to convert to Hex", action: {
                self.vm.getHexColor(color: String("\(selectedColor.components.red),\(selectedColor.components.green),\(selectedColor.components.blue)"))
            })
        }.padding(.top, 20)
        
        Text("Hex color for the chosen RGB").foregroundColor(selectedColor).font(.title).padding(.top, 8)
        Text(vm.hexColorString).padding(.top, 8)
        
    }.padding(.vertical, 70)
  }
}
