//
//  PostCellView.swift
//  RedditSwiftUI
//
//  Created by Muhammed Emin Aydın on 1.07.2022.
//

import SwiftUI

struct PostCellView: View {
    let post: Post
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: post.thumbnail))
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                    .lineLimit(Int.max)
                
                Text(post.subredditNamePrefixed)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

#if DEBUG
struct PostCell_Previews : PreviewProvider {
    static var previews: some View {
        PostCellView(post: Post(id: "", title: "Title", author: "author", url: "https://google.com", subredditNamePrefixed: "r/funny", thumbnail: ""))
            .previewLayout(.sizeThatFits)
    }
}
#endif
