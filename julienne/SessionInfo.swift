//
//  SessionInfo.swift
//  julienne
//
//  Created by Ben McMahen on 2019-06-28.
//  Copyright © 2019 Ben McMahen. All rights reserved.
//

import SwiftUI

struct SessionInfo : View {
    
    @EnvironmentObject var session: SessionStore
    @Environment(\.isPresented) var isPresented: Binding<Bool>?
    
    var body: some View {
        Button("Logout") {
            self.session.signOut()
            self.isPresented?.value = false
        }
    }
}

#if DEBUG
struct SessionInfo_Previews : PreviewProvider {
    static var previews: some View {
        SessionInfo().environmentObject(SessionStore())
    }
}
#endif
