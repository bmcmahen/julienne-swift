//
//  RecipeListItem.swift
//  julienne
//
//  Created by Ben McMahen on 2019-06-28.
//  Copyright © 2019 Ben McMahen. All rights reserved.
//

import SwiftUI

struct RecipeListItem : View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(verbatim: recipe.title).fontWeight(.bold)
                Text(recipe.author).font(.subheadline).color(.gray)
            }
            Spacer()
            if (recipe.image != nil) {
                FirebaseImage(id: recipe.image!)
                    .frame(width: 50, height: 50)
                    .padding(.trailing)
            }
        }
    }
}

#if DEBUG
struct RecipeListItem_Previews : PreviewProvider {
    static var previews: some View {
        RecipeListItem(recipe: Recipe(id: "ayh", author: "Ben McMahen", title: "Apple Pie", image: "0vnsc8-70"))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
