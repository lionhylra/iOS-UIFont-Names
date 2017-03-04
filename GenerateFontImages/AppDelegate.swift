//
//  AppDelegate.swift
//  GenerateFontImages
//
//  Created by Yilei on 3/3/17.
//  Copyright © 2017 lionhylra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let documentURL = try! FileManager.default.directoryURL(in: .documentDirectory)
        //clean files
        let urls = try! FileManager.default.contentsOfDirectory(at: documentURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        urls.forEach{
            try! FileManager.default.removeItem(at: $0)
        }
        let resourcesURL = try! FileManager.default.directoryURL(withPathComponents: "Resources")
        print(documentURL.path)
        
        
        //generate files
        var readMe = "# UIFont Complete list preview for \(UIDevice.current.systemName) \(UIDevice.current.systemVersion)\n<br /><br /><br />\n\n"
        readMe += "| Font Family | Font Name | Declaration | Preview |\n"
        readMe += "| --- | --- | --- | --- |\n"
        UIFont.enumerateSystemFonts { (familyName, fontName) in
            readMe += "| \(familyName) | \(fontName) | `let font = UIFont(name: \"\(fontName)\", size: UIFont.systemFontSize)!` | ![\(fontName)](/Resources/\(fontName).png) |\n"
            
            let font = UIFont(name: fontName, size: UIFont.systemFontSize)!
            saveFontSampleImage(font: font, to: resourcesURL)
            
        }
        
        try! readMe.write(to: documentURL.appendingPathComponent("README.md"), atomically: true, encoding: .utf8)
        
        
        return true
    }

    
    func saveFontSampleImage(font: UIFont, to destination: URL) {
        let fontName = font.fontName
        let rect = fontName.boundingRect(with: CGSize.infinite, font: font)
        let size = rect.insetBy(dx: -10, dy: -10).size
        
        // prepare context
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()!
        
        //draw background
        UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.00).setFill()
        context.fill(CGRect(origin: CGPoint.zero, size: CGSize(width: size.width + 1, height: size.height + 1)))
        
        //draw
        fontName.drawCentered(in: CGRect(origin: CGPoint.zero, size: size), withAttributes: [NSFontAttributeName: font])
        
        //get image
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        let data = UIImagePNGRepresentation(image)!
        
        //save image
        let url = destination.appendingPathComponent(fontName + ".png")
        try! data.write(to: url)
        
        
    }

}

