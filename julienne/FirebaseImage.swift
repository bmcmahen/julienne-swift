//
//  FirebaseImage.swift
//  julienne
//
//  Created by Ben McMahen on 2019-06-28.
//  Copyright © 2019 Ben McMahen. All rights reserved.
//

import SwiftUI

import FirebaseStorage

struct FirebaseImage : View {
    
    var id: String
    @State var image: UIImage?
    
    func fetch () {
        let url = "images/thumb-sm@\(id)"
        let storage = Storage.storage()
        let ref = storage.reference()
        
        let imageRef = ref.child(url)
        
        print("fetch for url: \(url)")
        
        imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("ERROR")
            } else {
                
                print("GOT DATA")
                if let data = data {
                    guard let image = UIImage(data: data) else {
                        print("no image...")
                        return
                    }

                    self.image = image
                } else {
                    print("No data?")
                }
            }
        }
    }
    
    var body: some View {
        Group {
            if (image == nil) {
                Image(systemName: "clear")
            } else {
                Image(uiImage: self.image!)
            }
        
        }.onAppear(perform: fetch)
    }
}

#if DEBUG
struct FirebaseImage_Previews : PreviewProvider {
    static var previews: some View {
        FirebaseImage(id: "random")
    }
}
#endif
