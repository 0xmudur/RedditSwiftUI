//
//  PostsListView.swift
//  RedditApp
//
//  Created by Muhammed Emin Aydın on 1.07.2022.
//

import SwiftUI

struct PostsListView: View {
    @ObservedObject var listingViewModel: PostViewModel

    @State private var query = ""
    @State private var subredditTitle = "r/all"
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listingViewModel.posts) { post in
                    NavigationLink(destination: WebView(request: URLRequest(url: URL(string: post.url)!))) {
                        PostCellView(post: post)
                    }
                }
            }
            .navigationBarTitle(Text(subredditTitle))
        }
        .onAppear(perform: fetchListing)
    }
    
    private func fetchListing() {
        listingViewModel.fetchListing(for: query)
    }
}

#if DEBUG
struct PostsList_Previews : PreviewProvider {
    static var previews: some View {
        PostsListView(listingViewModel: PostViewModel(service: RedditService()))
    }
}
#endif
