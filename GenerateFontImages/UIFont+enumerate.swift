//
//  UIFont+enumerate.swift
//  Swift3Project
//
//  Created by Yilei He on 4/3/17.
//  Copyright © 2017 lionhylra.com. All rights reserved.
//

import UIKit

extension UIFont {
    static func enumerateSystemFonts(handler: (_ familyName: String, _ fontName: String) -> Void) {
        for familyName in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                handler(familyName, fontName)
            }
        }
    }
}
