//
//  ListItemView.swift
//  testProject
//
//  Created by bod on 11/11/24.
//

import SwiftUI

struct ListItemView: View {
    
    var character: Character
    
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: character.img)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                Text(character.hero)
                    .font(.headline)
                    .fontWeight(.bold)
                if let name = character.name {
                    Text(name)
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    let character = Character(
        hero: "Spider-Man",
        name: "Peter Benjamin Parker",
        link: "https://www.marvel.com/characters/spider-man-peter-parker",
        img: "https://cdn.marvel.com/content/1x/005smp_ons_crd_02.jpg")
    ListItemView(character: character)
}
