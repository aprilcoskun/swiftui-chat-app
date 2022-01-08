//
//  ChatModel.swift
//  testing
//
//  Created by Nisan Coskun on 7.01.2022.
//

import Foundation
import UIKit

struct Chat: Identifiable {
    var id: UUID { person.id }
    var person: Person
    var messages: [Message]
    var hasUnreadMessage = false
    
}

extension Chat {
    static let sampleChat = [
        Chat(person: Person(username: "chlorine.9", name: "April", imgString: "https://instagram.fist3-1.fna.fbcdn.net/v/t51.2885-19/s150x150/120895805_196211138563542_5653466906749566743_n.jpg?_nc_ht=instagram.fist3-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=qbuWgop2d88AX8AAUqD&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT9aVR7FiBbtBqj4q6Bpv9Ka9X0HK7bzPnPWGUVNzDCXrQ&oe=61DF80FE&_nc_sid=7bff83", bio: "👩‍💻 🐈 🎮 🎹 💯"), messages: [
            Message("HEY, HOW ARE YOU DOIN? It's my birthday today, did you really forget? I was expecting a present", type: .TEXT, sender: "April", date: Date.parseString(str: "15/11/2021")),
            Message("OMG I forgot, sorry...", type: .TEXT, receiver: "April", date: Date.parseString(str: "16/11/2021")),
            Message("Anyway do you wanna develop an ios app with me? it's going to be a basic chat app", type: .TEXT, sender: "April", date: Date.parseString(str: "16/11/2021")),
            Message("Yes! but I have to quit my current job. You know I can only focus on one thing at a time", type: .TEXT, receiver: "April", date: Date.parseString(str: "16/11/2021")),
            Message("Fine, but I'm still waiting for my birthday present", type: .TEXT, sender: "April", date: Date.parseString(str: "16/11/2021")),
        ], hasUnreadMessage: true)
    ]
}
