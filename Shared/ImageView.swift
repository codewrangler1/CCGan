//
//  File.swift
//  CCGan
//
//  Created by Michael McEuin on 1/13/21.
//

import Combine
import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
 
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
var body: some View {
    VStack {
        
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100, height:100)
        
    }.onReceive(imageLoader.dataPublisher) { data in
        self.image = UIImage(data: data) ?? (UIImage())
        print(data)
        
    } .onAppear(){
        self.image = UIImage(data: imageLoader.data) ?? (UIImage())

    }
  }
}
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "")
    }
}
