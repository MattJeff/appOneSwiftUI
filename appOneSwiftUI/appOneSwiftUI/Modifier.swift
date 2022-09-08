//
//  Modifier.swift
//  appOneSwiftUI
//
//  Created by Mathis Higuinen on 08/09/2022.
//

import SwiftUI



struct shadowModifier:ViewModifier{
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 10)
    }
}
struct FontModifier:ViewModifier{
    var style: Font.TextStyle = .body
    func body(content: Content) -> some View {
        content
            .font(.system(style,design: .default))
    }
}


struct CustomFontModifier:ViewModifier{
    var size:CGFloat = 28
    var name:String = "Nunito-ExtraBold"
    func body(content: Content) -> some View {
        content.font(.custom(name, size: size))
    }
}
