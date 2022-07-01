//
//  RedditSwiftUIApp.swift
//  RedditSwiftUI
//
//  Created by Muhammed Emin Aydın on 1.07.2022.
//

import SwiftUI

@main
struct RedditSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            PostsListView(listingViewModel: PostViewModel(service: RedditService()))
        }
    }
}
