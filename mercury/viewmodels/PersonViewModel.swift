//
//  PersonViewModel.swift
//  testing
//
//  Created by Nisan Coskun on 7.01.2022.
//

import Foundation

class  PersonViewModel: ObservableObject {
    @Published var person: Person

    init(person: Person) {
        self.person = person
    }
    
    func toggleNotifications() {
        print("TODO: save person mute state in db")
        person.muted.toggle()
    }
}
