//
//  ColorStyling.swift
//  RGBToHex
//
//  Created by Luke Barkhuizen on 2021/08/12.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    let borderRadius: CGFloat
    let shadowRadius: CGFloat
    let borderColor: Color
    let backgroundColor: Color
    let textColor: Color
    @Binding var isEnabled: Bool?

    init(backgroundColor: Color =  Color.blue, textColor: Color = Color.white, shadowRadius: CGFloat = 2, borderRadius: CGFloat = 0, borderColor: Color = Color.gray, title: String, isEnabled: Binding<Bool?> = Binding.constant(nil), action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.shadowRadius = shadowRadius
        self.borderRadius = borderRadius
        self.borderColor = borderColor
        self.title = title
        self.action = action
        _isEnabled = isEnabled
    }
    
    var body: some View {
        Button(action: isEnabled ?? true ? self.action:{}, label: {
            Text(self.title).lineLimit(1)
                .font(.body)
                .foregroundColor(self.textColor)
                .padding(8)
        }).background(
            RoundedRectangle(cornerRadius: 4)
                .fill(isEnabled ?? true ? self.backgroundColor: Color.gray)
                .shadow(color: borderColor, radius: shadowRadius, x: 0, y: shadowRadius).overlay(
                    RoundedRectangle(cornerRadius: 4).stroke(borderColor, lineWidth: borderRadius)
                )
                
        )
    }
}
