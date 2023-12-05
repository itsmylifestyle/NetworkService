//
//  UserViewModel.swift
//  INS
//
//  Created by Айбек on 06.12.2023.
//

import Foundation

struct UserViewModel {
    let user : User
    var id : Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email : String {
        user.email
    }
}
