//
//  ChatList.swift
//  Telegram Music
//
//  Created by Ismatulla Mansurov on 12/18/21.
//

import Foundation
import UIKit

struct ChatList: Hashable {
    let name: String
    let image: UIImage
    
    init(name: String) {
        self.name = name
        self.image = UIImage(systemName: name)!
    }
}
