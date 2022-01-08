//
//  ContentView.swift
//  testing
//
//  Created by Nisan Coskun on 7.01.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ChatViewModel()
    
    @State private var query = ""
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(viewModel.getSortedFilteredChats(query: query)) { chat in
                        NavigationLink(destination: {
                            ChatView(chat: chat)
                                .environmentObject(viewModel)
                        }) {
                            ChatRow(chat: chat)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .searchable(text: $query)
                .navigationTitle("mercury-chat")
                .navigationBarItems(trailing: Button(action: {
                    print("TODO: Add new chat dialog")
                }) {
                    Image(systemName: "square.and.pencil")
                })
            }
            .tabItem {
                Image(systemName: "house")
                Text("chats")
            }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(\.locale, .init(identifier: "tr"))
    }
}
