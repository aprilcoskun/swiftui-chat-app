//
//  Message.swift
//  testing
//
//  Created by Nisan Coskun on 7.01.2022.
//

import Foundation

struct Message: Identifiable {
    
    enum MessageType {
        case TEXT, IMAGE, AUDIO, VIDEO, LOCATION
    }
    
    let id = UUID()
    let date: Date
    let data: String
    let type: MessageType
    let sender: String
    let receiver: String
    
    init(_ data: String, type: MessageType, date: Date, sender: String, receiver: String) {
        self.date = date
        self.data = data
        self.type = type
        self.sender = sender
        self.receiver = receiver
    }
    
    init(_ data: String, type: MessageType, sender: String, date: Date) {
        self.init(data, type: type, date: date, sender: sender, receiver: "me")
    }
    
    init(_ data: String, type: MessageType, receiver: String, date: Date) {
        self.init(data, type: type, date: date, sender: "me", receiver: receiver)
    }
}
