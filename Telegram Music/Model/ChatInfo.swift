//
//  ChatInfo.swift
//  Telegram Music
//
//  Created by Ismatulla Mansurov on 1/8/22.
//

import Foundation
import TDLibKit

struct ChatInfo {
    
    let id: Int64
    var postitions: [ChatPosition]
    var title: String
    var isMarkedAsUnread: Bool
    var unreadCount: Int
    var unreadMentionCount: Int
    var lastRead
}
