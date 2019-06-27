//
//  InlineAlert.swift
//  julienne
//
//  Created by Ben McMahen on 2019-06-27.
//  Copyright © 2019 Ben McMahen. All rights reserved.
//

import SwiftUI

enum AlertIntent {
    case info, success, question, danger, warning
}

struct InlineAlert : View {
    
    var title: String
    var subtitle: String?
    var intent: AlertIntent = .info
    
    var body: some View {

        HStack(alignment: .top) {
               
                
            
                Image(systemName: "exclamationmark.triangle.fill")
                    .padding(.vertical)
                    .foregroundColor(Color.white)
            
            
            
                
                
                VStack(alignment: .leading) {
                    Text(self.title)
                        .font(.body)
                        .color(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)


                    if (self.subtitle != nil) {
                        Text(self.subtitle!)
                            .font(.body)
                            .color(.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)

                    }

                }.padding(.leading)
            
            }
                .padding()
                .background(Color.red, cornerRadius: 8)
        
    }
}

#if DEBUG
struct InlineAlert_Previews : PreviewProvider {
    static var previews: some View {
        InlineAlert(
            title: "Nostrud non magna quis veniam dolore magna voluptate.",
            subtitle: "Nulla id amet reprehenderit laboris irure Lorem ex esse eiusmod eiusmod occaecat officia. Quis in reprehenderit dolor veniam id sunt mollit reprehenderit.",
            intent: .info
        ).frame(height: 300)
    }
}
#endif
