//
//  RecipeListView.swift
//  julienne
//
//  Created by Ben McMahen on 2019-06-28.
//  Copyright © 2019 Ben McMahen. All rights reserved.
//

import SwiftUI

struct RecipeListView : View {
    
    var userId: String
    
    @ObjectBinding var recipeStore = RecipeStore()
    
    func fetchRecipes () {
        print("Fetching recipes")
        recipeStore.fetch(userId: self.userId)
    }

    var body: some View {
        
        List {
            ForEach(recipeStore.recipes) { recipe in
                NavigationButton(destination: RecipeDetailView(recipe: recipe)) {
                    RecipeListItem(recipe: recipe)
                }
            }
        }.onAppear(perform: fetchRecipes)
        
        
    }
}

#if DEBUG
struct RecipeListView_Previews : PreviewProvider {
    static var previews: some View {
        RecipeListView(userId: "WQglBdVOQjOIEmI7SRkauGgwfY53")
    }
}
#endif
