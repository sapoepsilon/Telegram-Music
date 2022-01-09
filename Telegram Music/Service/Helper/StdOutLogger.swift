//
//  StdOutLogger.swift
//  Telegram Music
//
//  Created by Ismatulla Mansurov on 1/8/22.
//

import Foundation
import TDLibKit



public final class StdOutLogger: Logger {
    
    let queue: DispatchQueue
    
    public init() {
        queue = DispatchQueue(label: "Logger", qos: .userInitiated)
    }
    
    
    public func log(_ message: String, type: LoggerMessageType?) {
        
        queue.async {
            var seperator = "------------------------------"
            if let type = type {
                seperator = ">> \(type.description): -------------"
            }
            
            print("""
            \(seperator)
            \(message)
            -----------------------------
            """)
        }
        }

    
    
}
