//
//  TelegramService.swift
//  Telegram Music
//
//  Created by Ismatulla Mansurov on 1/8/22.
//

import Foundation
import TDLibKit

public protocol UpdateListener: AnyObject {
    func onUpdate(_ update: Update)
}


final class TelegramService {
    
    // MARK: - Public properties
    
    let api: TdApi
    
    
    // MARK: - Private properties
    
    private let logger: Logger
    private var listeners: [UpdateListenerWeakBox] = []
    
    
    // MARK: - Init
    
    init(logger: Logger) {
        let client = TdClientImpl(completionQueue: .main, logger: logger)
        self.api = TdApi(client: client)
        self.logger = logger
    }
    
    
    // MARK: - Public methods
    
    func run() {
        api.client.run { [unowned self] in
            do {
                let update = try self.api.decoder.decode(Update.self, from: $0)
                try self.processUpdate(update)
            } catch {
                self.logger.log(error.localizedDescription, type: .custom("Error"))
            }
        }
        
        let query = SetLogVerbosityLevel(newVerbosityLevel: 5)
        do {
            let apiCall = try api.client.execute(query: DTO(query))
            print("api call let variable \(apiCall?.description)")
        } catch {
            self.logger.log(error.localizedDescription, type: .execute)
        }
    }
    
    func add(listener: UpdateListener) {
        let box = UpdateListenerWeakBox(value: listener)
        listeners.append(box)
        listeners.compact()
    }
    
    func remove(listener: UpdateListener) {
        var listenerIndex: Int = -1
        for (index, existingListener) in listeners.enumerated() {
            if listener === existingListener.value {
                listenerIndex = index
                break
            }
        }
        if listenerIndex >= 0 {
            listeners.remove(at: listenerIndex)
        }
        listeners.compact()
    }
    
    
    // MARK: - Private methods
    
    private func processUpdate(_ update: Update) throws {
        listeners.forEach {
            $0.value?.onUpdate(update)
        }
    }
    
}


final class UpdateListenerWeakBox {
    private(set) weak var value: UpdateListener?
    
    init(value: UpdateListener?) {
        self.value = value
    }
}

private extension Array where Element == UpdateListenerWeakBox {
    mutating func compact() {
        self = self.filter { $0.value != nil }
    }
}
