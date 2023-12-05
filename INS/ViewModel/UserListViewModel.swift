//
//  UserListViewModel.swift
//  INS
//
//  Created by Айбек on 06.12.2023.
//

import Foundation

class UserListViewModel : ObservableObject {
    @Published var userList = [UserViewModel]()
    
    //let webservice = Webservice()
    
    private var service : NetworkService
    init(service : NetworkService) {
        self.service = service
    }
    
    func downloadUsers() async {
        
        var resource = ""
        if service.type == "Webservice" {
            resource = Constants.Urls.userExtension
        } else {
            resource = Constants.Paths.baseUrl
        }
        
        do {
            let users = try await service.download(resource)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        } catch {
            print(error)
        }
    }
}
