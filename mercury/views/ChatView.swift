//
//  ChatView.swift
//  testing
//
//  Created by Nisan Coskun on 7.01.2022.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject var viewModel: ChatViewModel
    
    let chat: Chat
    
    @State private var text = ""
    @FocusState private var isFocused
    
    @State private var messageIDToScroll: UUID?

    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { reader in
                ScrollView {
                    ScrollViewReader { scrollReader in
                    getMessagesView(viewWidth: reader.size.width)
                        .padding(.horizontal)
                        .onChange(of: messageIDToScroll) { _ in
                            // scroll to last message after send
                            if let messageID = messageIDToScroll {
                                scrollTo(messageID: messageID, shouldAnimate: true, scrollReader: scrollReader)
                            }
                        }
                        .onAppear {
                            // scroll to last message on appear
                            if let messageID = chat.messages.last?.id {
                                scrollTo(messageID: messageID, anchor: .bottom, shouldAnimate: false, scrollReader: scrollReader)
                            }
                        }
                    }
                    
                }
            }
            .padding(.bottom, 5)
            toolbarView()
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: navbarLeadingButton, trailing: navbarTrailingButton)
        .onAppear {
            viewModel.markAsRead(chat.id)
        }

    }
    
    var navbarLeadingButton: some View {
        Button(action: {}) {
            HStack {
                NavigationLink(destination: {
                    PersonView(person: chat.person)
                        .environmentObject(viewModel)
                }) {
                    AsyncImage(url: URL(string: chat.person.imgString )) { image in
                        image.resizable()
                        
                    } placeholder: {
                        ProgressView()
                        
                    }
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    
                    Text(chat.person.name)
                        .bold()
                }
                
            }
            .foregroundColor(.black)
        }
    }
    
    var navbarTrailingButton: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "video")
            }
            Button(action: {}) {
                Image(systemName: "phone")
            }
        }
    }
    
    func toolbarView() -> some View {
        VStack {
            let height: CGFloat = 40
            HStack {
                Button(action: {
                    print("TODO: pick photo")
                }) {
                    Image(systemName: "photo.fill")
                        .foregroundColor(.black)
                }
                TextField("message-placeholder", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .focused($isFocused)
                
                Button(action: {
                    if text.isEmpty {
                        print("TODO: record audio")
                    } else {
                        sendTextMessage()
                    }
                }) {
                    Image(systemName: text.isEmpty ? "mic.fill" : "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(width: height, height: height)
                        .background(
                            Circle()
                                .foregroundColor(text.isEmpty ? .green : .blue)
                        )
                }
            }
            .frame(height: height)
            
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    
    func scrollTo(messageID: UUID, anchor: UnitPoint? = nil, shouldAnimate: Bool = true, scrollReader: ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn : nil) {
                scrollReader.scrollTo(messageID, anchor: anchor)
            }
        }
    }
    
    func sendTextMessage() {
        if let message = viewModel.sendTextMessage(text, in: chat) {
            text = ""
            messageIDToScroll = message.id
        }
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func getMessagesView (viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(chat.messages) { message in
                let fromMe = message.sender == "me"
                HStack {
                    ZStack {
                        Text(message.data)
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .background(fromMe ? .green.opacity(0.9) : Color.black.opacity(0.2))
                            .cornerRadius(12)
                    }
                    .frame(width: viewWidth * 0.7, alignment: fromMe ? .trailing : .leading)
                    .padding(.vertical, 8) // consider using system default
                    
                }
                .frame(maxWidth: .infinity, alignment: fromMe ? .trailing : .leading)
                .id(message.id) // important for auto scrolling later
                
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(chat: Chat.sampleChat[0])
                .environmentObject(ChatViewModel())
                //.environment(\.locale, .init(identifier: "tr"))
        }
    }
}
