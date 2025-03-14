//
//  ContentViewModel.swift
//  testProject
//
//  Created by bod on 11/11/24.
//

import Foundation
import SwiftUI

@MainActor
final class ContentViewModel: ObservableObject {
    
    @Published var viewStatus: ViewStatus  = .start
    @Published var viewTitle: String = ""
    
    private var heroes: [RecordItem] = []
    
    var networkService: NetworkService = NetworkService()
    
    func fetchData() async {
        do {
            let data = try await networkService.fetchData()
            populateData(dataModel: data)
            
        } catch {
            viewStatus = .error(error.localizedDescription)
        }
    }
    
    func openCharacterUrl(character: Character) {
        guard let urlString = character.link, let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    private func populateData(dataModel: PageDataModel) {
        viewTitle = dataModel.record.title
        heroes = dataModel.record.items
        viewStatus = .result(heroes)
    }
}

enum ViewStatus {
    case start
    case result([RecordItem])
    case error(String)
}
