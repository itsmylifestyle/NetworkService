//
//  UserListViewModel.swift
//  INS
//
//  Created by Айбек on 06.12.2023.
//

import Foundation

class UserListViewModel : ObservableObject {
    @Published var userList = [UserViewModel]()
    
    let webservice = Webservice()
    
    func downloadUsers() async {
        
        do {
            let users = try await webservice.download(Constants.Urls.userExtension)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        } catch {
            print(error)
        }
    }
}
