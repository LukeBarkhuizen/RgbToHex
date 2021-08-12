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
      ).frame(width: 150, height: 150)
        HStack {
            PrimaryButton(title: "Convert RGB to Hex", action: {
                self.vm.getHexColor(color: String("\(selectedColor.components.red),\(selectedColor.components.green),\(selectedColor.components.blue)"))
            })
        }.padding(.top, 20)
        
        Text("Hex color for the chosen RGB").foregroundColor(selectedColor).font(.title)
        Text(vm.hexColor)
        
    }.padding(.vertical, 70)
  }
}
