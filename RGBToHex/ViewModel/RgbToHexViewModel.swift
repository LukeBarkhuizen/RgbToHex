//
//  RgbToHexViewModel.swift
//  RGBToHex
//
//  Created by Luke Barkhuizen on 2021/08/12.
//

import Foundation
import SwiftUI
import Combine

class RgbToHexViewModel: ObservableObject {
    @Published var hexColorString: String = ""
    private var hexColor = PassthroughSubject<String, Never>()
    private var cancelBag = Set<AnyCancellable>()
    init() {
            hexColor.sink{ color in
                self.hexColorString = color
            }.store(in: &cancelBag)
}
    func getHexColor(color: String){
        WebService(vm: RgbToHexViewModel(),hexColor: hexColor).getColour(color: color)
        print(hexColor)
    }
}
