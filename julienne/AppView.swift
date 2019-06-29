//
//  AppView.swift
//  julienne
//
//  Created by Ben McMahen on 2019-06-27.
//  Copyright © 2019 Ben McMahen. All rights reserved.
//

import SwiftUI

enum Tabs {
    case recipes, following, followers
}

struct AppView : View {
    @EnvironmentObject var session: SessionStore
    
    @State var tab: Tabs = .recipes
    @State var query = ""
    
    var body: some View {
        
        
        return NavigationView {
       
            RecipeListView(userId: session.session!.uid)
                .navigationBarTitle(Text("Julienne"))
        
          
        }
    }
}

#if DEBUG
struct AppView_Previews : PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(SessionStore())
    }
}
#endif
