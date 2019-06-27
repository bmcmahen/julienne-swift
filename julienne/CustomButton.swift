//
//  CustomButton.swift
//  Julienne
//
//  Created by Ben McMahen on 2019-06-18.
//  Copyright © 2019 Ben McMahen. All rights reserved.
//

import SwiftUI

// todo:
// add disabled, spinner, dark mode?

struct CustomButton : View {
    var label: String
    var action: () -> Void
    var loading: Bool = false
    
    
    var body: some View {
        
        Button(action: action) {
            HStack {
                Spacer()
                Text(label)
                    .fontWeight(.bold)
                    .color(.white)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            
            }
            .padding()
            .background(loading ? Color.blue.opacity(0.3) : Color.blue)
            .cornerRadius(5)
    }
}

#if DEBUG
struct CustomButton_Previews : PreviewProvider {
    static var previews: some View {
        CustomButton(label: "Sign in", action: {
            print("hello")
        })
    }
}
#endif
