//
//  NerworkService.swift
//  INS
//
//  Created by Айбек on 06.12.2023.
//

import Foundation

protocol NetworkService {
    func download(_ resource : String) async throws -> [User]
    var type : String {
        get
    }
}
