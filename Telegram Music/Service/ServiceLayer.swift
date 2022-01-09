//
//  ServiceLayer.swift
//  Telegram Music
//
//  Created by Ismatulla Mansurov on 1/8/22.
//

import Foundation

final class ServiceLayer {
    
    static let instance = ServiceLayer()
    
    let telegramService: TelegramService
    let authService: AuthService
    // TODO: add chat service later
    // let chatListService: ChatListService
    
    private init() {
        let logger = StdOutLogger()
        telegramService = TelegramService(logger: logger)
        
        authService = AuthService(tdApi: telegramService.api)
        telegramService.add(listener: authService)
        
        //TODO: add chatListService
    }
}
