//
//  RecipeDetailView.swift
//  julienne
//
//  Created by Ben McMahen on 2019-06-28.
//  Copyright © 2019 Ben McMahen. All rights reserved.
//

import SwiftUI

struct RecipeDetailView : View {
    var recipe: Recipe
    
    var body: some View {
        VStack {
            Text(recipe.title)
            }
             .navigationBarTitle(Text(recipe.title))
    }
}

#if DEBUG
struct RecipeDetailView_Previews : PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe(id: "ayh", author: "Ben McMahen", title: "Apple Pie", image: "0vnsc8-70"))
        
    }
}
#endif
