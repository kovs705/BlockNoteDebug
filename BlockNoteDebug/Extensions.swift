//
//  Extensions.swift
//  BlockNoteDebug
//
//  Created by Kovs on 04.12.2021.
//

import SwiftUI
import Foundation


func returnColorFromString(nameOfColor: String) -> Color {
    return Color.init(nameOfColor)
}

extension Color {
    static let darkBack = Color("DarkBackground")
    static let lightPart = Color("LightPart")
    
    // pastel colors:
    static let rosePink = Color("RosePink") // rose
    static let greenAvocado = Color("GreenAvocado") // green
    static let blueBerry = Color("BlueBerry") // blue
    static let yellowLemon = Color("YellowLemon") // yellow
    static let redStrawBerry = Color("RedStrawBerry") // red
    static let purpleBlackBerry = Color("PurpleBlackBerry") // purple
    static let greyCloud = Color("GreyCloud") // grey
    static let brownSugar = Color("BrownSugar") // brown
    
    static let textForeground = Color("TextForeground") // text based on theme (dark and light)
    static let itemListBackground = Color("ItemListBackground")
    
    public static var darkBlue: Color {
        return Color(red: 28 / 255, green: 46 / 255, blue: 74 / 255)
    }
    public static var offWhite: Color {
        return Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    }
    public static var veryDarkBlue: Color {
        return Color(red: 10 / 255, green: 20 / 255, blue: 50 / 255)
    }
    public static var darkGold: Color {
        return Color(red: 133 / 255, green: 94 / 255, blue: 60 / 255)
    }
}
