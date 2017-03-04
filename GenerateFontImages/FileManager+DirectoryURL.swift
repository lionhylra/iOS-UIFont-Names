//
//  FileManager+DirectoryURL.swift
//  Swift3Project
//
//  Created by Yilei He on 7/11/16.
//  Copyright © 2016 lionhylra.com. All rights reserved.
//

import UIKit

extension FileManager {
    
    /// This function returns the directory url in the document directory in sandbox with path components you specify. If the directory doesn't exist, this function creates the directory automatically.
    ///
    /// Example: `directoryUrlInDocumentDirectory(withPathComponents: "example", "user", "data")` returns "<path of app sandbox>/documents/example/user/data".
    ///
    /// Example2: `directoryUrlInDocumentDirectory()` returns "<path of app sandbox>/documents"
    ///
    /// - parameter componnets: The path components that used to append to document directory
    ///
    /// - throws: any error when creating the directory
    ///
    /// - returns: the url of the directory
    func directoryURL(in rootDirectory: SearchPathDirectory = .documentDirectory, withPathComponents componnets: String...) throws -> URL {
        let searchPathDirectoryURL = urls(for: rootDirectory, in: .userDomainMask).first
        precondition(searchPathDirectoryURL != nil, "\(rootDirectory) not found!")
        var destinationUrl: URL = searchPathDirectoryURL!
        
        for component in componnets {
            destinationUrl.appendPathComponent(component, isDirectory: true)
        }
        
        try createDirectory(at: destinationUrl, withIntermediateDirectories: true, attributes: nil)
        return destinationUrl
    }
}
