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
    
    @State var tab: Tabs = .recipes
    @State var query = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: SearchBar(text: $query)) {
                    Text("okay then")
                }
            }
        }.navigationBarTitle(Text("Julienne"))
    }
}

#if DEBUG
struct AppView_Previews : PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
#endif
