//
//  ColorModel.swift
//  RGBToHex
//
//  Created by Luke Barkhuizen on 2021/08/11.
//

import Foundation
import SwiftUI

struct ColorResponse: Decodable {
    var value: String = ""
    var clean: String = ""


private enum ColorResponseKeys: String, CodingKey {
    case hex
}
private enum MainKeys: String, CodingKey {
    case value
    case clean
}

    init(from decoder: Decoder) throws{
    
        if let colorResponseContainer = try? decoder.container(keyedBy: ColorResponseKeys.self){
            if let mainContainer = try? colorResponseContainer.nestedContainer(keyedBy: MainKeys.self, forKey: .hex){
                self.value = try mainContainer.decode(String.self, forKey: .value)
                self.clean = try mainContainer.decode(String.self, forKey: .clean)
            }
        }
        
}
}
