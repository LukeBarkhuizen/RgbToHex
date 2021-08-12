//
//  WebService.swift
//  RGBToHex
//
//  Created by Luke Barkhuizen on 2021/08/11.
//

import Foundation
import SwiftUI
import Combine

class WebService {
    @ObservedObject private(set) var vm: RgbToHexViewModel
    var hexColor: PassthroughSubject<String, Never>
    init(vm: RgbToHexViewModel, hexColor: PassthroughSubject<String, Never>) {
        self.vm = vm
        self.hexColor = hexColor
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
                    self.hexColor.send(resData.value)
                }.resume()
    }
}
