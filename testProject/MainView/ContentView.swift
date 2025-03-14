//
//  ContentView.swift
//  testProject
//
//  Created by bod on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            switch viewModel.viewStatus {
                
            case .start:
                ProgressView()
                
            case .result(let heroes):
                List(heroes.indices, id: \.self) { index in
                    let hero = heroes[index]
                    
                    Section(header: Text(hero.title).font(.headline)) {
                        ForEach(hero.items.indices, id: \.self) { index in
                            let character = hero.items[index]
                            ListItemView(character: character)
                                .onTapGesture {
                                    viewModel.openCharacterUrl(character: character)
                                }
                        }
                    }
                }
                
            case .error(let value):
                Text(value)
                    .foregroundStyle(Color.red)
                    .fontWeight(.bold)
            }
        }
        .navigationTitle(viewModel.viewTitle)
        .onAppear {
            Task { await viewModel.fetchData() }
        }
        
    }
}

#Preview {
    ContentView()
}
