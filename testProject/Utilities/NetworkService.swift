//
//  NetworkService.swift
//  testProject
//
//  Created by bod on 11/11/24.
//

import Foundation

final class NetworkService {
    
    let urlString = "https://api.jsonbin.io/v3/b/66163fe6ad19ca34f857b83a"
    
    func fetchData() async throws -> PageDataModel {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.addValue("$2a$10$CZSSa/lYSyqFPCITLF4uVOwrIZtlq84CsaY2kSihl8d7Ev.KVNbde", forHTTPHeaderField: "X-Access-Key")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw URLError(.badServerResponse) }
        
        do {
            let dataModel = try JSONDecoder().decode(PageDataModel.self, from: data)
            return dataModel
        } catch {
            throw error
        }
    }
}
