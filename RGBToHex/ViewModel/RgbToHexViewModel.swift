//
//  RgbToHexViewModel.swift
//  RGBToHex
//
//  Created by Luke Barkhuizen on 2021/08/12.
//

import Foundation
import Combine
import SwiftUI

class RgbToHexViewModel: ObservableObject {
    @Published var hexColor: String  = ""
    
    func getHexColor(color: String){
        WebService(vm: RgbToHexViewModel()).getColour(color: color)
        
    }
}
