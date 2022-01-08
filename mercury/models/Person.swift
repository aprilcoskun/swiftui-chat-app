//
//  Person.swift
//  testing
//
//  Created by Nisan Coskun on 7.01.2022.
//

import Foundation

struct Person: Identifiable {
    let id = UUID()
    let username: String
    let name: String
    let imgString: String
    let bio: String
    var muted: Bool = false
}
