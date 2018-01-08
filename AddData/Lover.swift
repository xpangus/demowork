//
//  Lover.swift
//  AddData
//
//  Created by SHIH-YING PAN on 22/12/2017.
//  Copyright © 2017 SHIH-YING PAN. All rights reserved.
//

import Foundation
import UIKit

struct Lover: Codable {
    var name: String
    var star: String
    var innerBeauty: Bool
    var imageName: String?
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static func saveToFile(lovers: [Lover]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(lovers) {
            let url = Lover.documentsDirectory.appendingPathComponent("lover")
            try? data.write(to: url)
        }
    }
    
    static func readLoversFromFile() -> [Lover]? {
        let propertyDecoder = PropertyListDecoder()
        let url = Lover.documentsDirectory.appendingPathComponent("lover")
        if let data = try? Data(contentsOf: url), let lovers = try? propertyDecoder.decode([Lover].self, from: data) {
            return lovers
        } else {
            return nil
        }
    }
    
    
    var image: UIImage? {
        if let imageName = imageName {
            let url = Lover.documentsDirectory.appendingPathComponent(imageName)
            return UIImage(contentsOfFile: url.path)
        } else {
            return #imageLiteral(resourceName: "abc1")
        }
    }
    
}

