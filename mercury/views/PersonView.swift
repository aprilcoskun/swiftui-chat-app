//
//  PersonView.swift
//  testing
//
//  Created by Nisan Coskun on 7.01.2022.
//

import SwiftUI

struct PersonView: View {
    @StateObject var viewModel: PersonViewModel
    @EnvironmentObject var chatViewModel: ChatViewModel
    
    init(person: Person) {
        _viewModel  = StateObject(wrappedValue: PersonViewModel(person: person))
    }
    
    var body: some View {
        HStack {
            VStack() {
                AsyncImage(url: URL(string: viewModel.person.imgString )) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 96, height: 96)
                .clipShape(Circle())
                .padding(.horizontal)
                Text("@\(viewModel.person.username)")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                Text(viewModel.person.bio)
                    .padding(.vertical)
                HStack {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "square.and.pencil")
                            Text("chat")
                        }
                    }
                    .padding(.horizontal, 6)
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "video")
                            Text("video-call")
                        }
                    }
                    .padding(.horizontal, 6)
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "phone")
                            Text("phone-call")
                        }
                    }
                    .padding(.horizontal, 6)
                }
                .padding(.vertical,24)
                List {
                    HStack {
                        Image(systemName: "bell.slash.fill")
                        Text("mute-notifications")
                        Toggle("", isOn: $viewModel.person.muted)
                            .onChange(of: viewModel.person.muted) { _ in
                                viewModel.toggleNotifications()
                            }
                        
                    }
                    Button(action: {
                        chatViewModel.deleteChat(chatId: viewModel.person.id)
                    }) {
                        HStack {
                            Image(systemName: "trash.fill").foregroundColor(.red)
                            Text("delete-chat").foregroundColor(.red)
                            
                        }
                    }
                }.listStyle(PlainListStyle())
                Spacer()
            }
            .navigationBarTitle(Text(viewModel.person.name))

        }
        .padding()
        
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PersonView(person: Chat.sampleChat[0].person)
                .environmentObject(ChatViewModel())
                //.environment(\.locale, .init(identifier: "tr"))
        }
    }
}
