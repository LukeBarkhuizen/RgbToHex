//
//  WebService.swift
//  RGBToHex
//
//  Created by Luke Barkhuizen on 2021/08/11.
//

import Foundation
import SwiftUI

class WebService {
    @ObservedObject private(set) var vm: RgbToHexViewModel
    init(vm: RgbToHexViewModel) {
        self.vm = vm
    }
    func getColour(color: String){
        guard let url = URL(string: "http://thecolorapi.com/id?rgb=\(color)") else {
            fatalError("URL is not correct!")
        }
        
        var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")

                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    guard let data = data else { return }
                    let resData = try! JSONDecoder().decode(ColorResponse.self, from: data)
                    self.vm.hexColor = resData.value
                    print(self.vm.hexColor)
                }.resume()
    }
}
