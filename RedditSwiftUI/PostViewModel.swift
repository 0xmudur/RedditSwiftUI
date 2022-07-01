//
//  PostViewModel.swift
//  RedditApp
//
//  Created by Muhammed Emin Aydın on 1.07.2022.
//

import Combine
import Foundation
import SwiftUI

class PostViewModel: ObservableObject {
    let service: RedditService
    
    @Published var subreddit = "r/all"
    @Published var posts = [Post]()
    
    init(service: RedditService) {
        self.service = service
    }
    
    func fetchListing(for query: String) {
        service.getData(for: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self?.posts = posts
                case .failure:
                    self?.posts = []
                }
            }
        }
    }
}
