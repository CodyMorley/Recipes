//
//  YoutubeLinkView.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI


struct YoutubeLinkView: View {
    let url: URL
    
    var body: some View {
        Link(destination: url) {
            VStack(alignment: .center) {
                Image("youtube-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                Text("Watch on YouTube")
                    .font(.headline)
            }
            .foregroundColor(.primary)
        }
    }
}


#Preview {
    YoutubeLinkView(url: RecipeList.sample.youtubeURL!)
}
