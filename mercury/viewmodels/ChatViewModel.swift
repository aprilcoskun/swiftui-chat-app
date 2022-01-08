//
//  ChatViewModel.swift
//  testing
//
//  Created by Nisan Coskun on 7.01.2022.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var chats = Chat.sampleChat
    
    func getSortedFilteredChats(query: String) -> [Chat] {
        let sorted = chats.sorted {
            guard let date1 = $0.messages.last?.date else  { return false }
            guard let date2 = $1.messages.last?.date else  { return false }
            return date1 > date2
        }
        
        if query == "" {
            return sorted
        }
        
        return sorted.filter { $0.person.name.lowercased().contains(query.lowercased()) }
    }
    
    func markAsRead(_ chatId: UUID) {
        if let index = chats.firstIndex(where: { $0.id == chatId }) {
            chats[index].hasUnreadMessage = false
        }
        print("TODO: mark as read in db")
    }
    
    func sendTextMessage(_ text: String, in chat: Chat) -> Message? {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            let message = Message(text, type: .TEXT, receiver: chat.person.name, date: Date())
            print("TODO: save message in db")
            print("TODO: send message to server")
            chats[index].messages.append(message)
            return message
        }
        return nil
    }
    
    func deleteChat(chatId: UUID) {
        print("TODO: delete chat in db")
        chats = chats.filter { $0.id != chatId }
    }
}
