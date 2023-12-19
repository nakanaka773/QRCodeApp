//
//  Item.swift
//  QRCodeApp
//
//  Created by 平山奈々海 on 2023/12/19.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
