//
//  Ceil+CGSize.swift
//  GenerateFontImages
//
//  Created by Yilei He on 18/12/19.
//  Copyright © 2019 lionhylra. All rights reserved.
//

import QuartzCore

func ceil(_ size: CGSize) -> CGSize {
    CGSize(width: ceil(size.width), height: ceil(size.height))
}
