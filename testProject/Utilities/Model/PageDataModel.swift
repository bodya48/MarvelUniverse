//
//  PageDataModel.swift
//  testProject
//
//  Created by bod on 11/11/24.
//

import Foundation

// MARK: - Welcome
struct PageDataModel: Codable {
    let record: Record
    let metadata: Metadata
}

// MARK: - Metadata
struct Metadata: Codable {
    let id: String
    let privateBool: Bool
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case privateBool = "private"
        case createdAt
    }
}

// MARK: - Record
struct Record: Codable {
    let title: String
    let items: [RecordItem]
}

// MARK: - RecordItem
struct RecordItem: Codable {
    let title: String
    let items: [Character]
}

// MARK: - ItemItem
struct Character: Codable {
    let hero: String
    let name: String?
    let link: String?
    let img: String
}
