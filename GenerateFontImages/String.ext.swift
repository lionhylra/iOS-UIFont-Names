//
//  String Convenience Extensions.swift
//  Swift3Project
//
//  Created by Yilei He on 7/11/16.
//  Copyright © 2016 lionhylra.com. All rights reserved.
//

import UIKit

extension String {
    func boundingRect(with size: CGSize, attributes: [String: Any]? = nil) -> CGRect {
        let attributedString = NSAttributedString(string: self, attributes: attributes)
        return attributedString.boundingRect(with: size, options: .usesLineFragmentOrigin, context: nil)
    }
    
    
    func boundingRect(with size: CGSize, font: UIFont) -> CGRect {
        return boundingRect(with: size, attributes: [NSFontAttributeName: font])
    }
}


extension CGSize {
    func ceiled() -> CGSize {
        return CGSize(width: ceil(width), height: ceil(height))
    }
    
    
    static var infinite: CGSize {
        return CGRect.infinite.size
    }
}

// MARK: Draw in center

extension String {
    func drawCentered(in rect: CGRect, withAttributes attrs: [String : Any]? = nil) {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        drawCentered(at: center, withAttributes: attrs)
    }
    
    
    func drawCentered(at point: CGPoint,  withAttributes attrs: [String : Any]? = nil) {
        let stringRectSize = self.boundingRect(with: CGSize.infinite, attributes: attrs).size
        let drawingOrigin = CGPoint(x: point.x - stringRectSize.width / 2, y: point.y - stringRectSize.height / 2)
        let drawingRect = CGRect(origin: drawingOrigin, size: stringRectSize)
        (self as NSString).draw(with: drawingRect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
    }
}


