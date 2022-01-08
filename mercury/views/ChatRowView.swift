//
//  ChatRow.swift
//  testing
//
//  Created by Nisan Coskun on 7.01.2022.
//

import SwiftUI

struct ChatRow: View {
    let chat: Chat
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: chat.person.imgString )) { image in
                image.resizable()
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 64, height: 64)
            .clipShape(Circle())

            ZStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(chat.person.name)
                            .bold()
                        Spacer()
                        Text(chat.messages.last?.date.fromNow() ?? "")
                    }
                    HStack {
                        Text(chat.messages.last?.data ?? "")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height: 50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 40)
                    }
                }
                Circle()
                    .foregroundColor(chat.hasUnreadMessage ? .blue : .clear)
                    .frame(width: 16, height: 16)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .frame(height: 80)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: Chat.sampleChat[0])
    }
}
