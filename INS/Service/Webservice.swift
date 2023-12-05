//
//  Webservice.swift
//  INS
//
//  Created by Айбек on 06.12.2023.
//

import Foundation

enum NetworkError : Error {
    case invalidURL
    case invalidServerResponse
}

class Webservice : NetworkService {
    
    var type : String = "Webservice"
    
    func download(_ resource : String) async throws -> [User] {
        guard let url = URL(string: resource) else {
            throw NetworkError.invalidURL
        }
        
        let (data, resp) = try await URLSession.shared.data(from: url)
        
        guard let HTTPResponse = resp as? HTTPURLResponse, HTTPResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
