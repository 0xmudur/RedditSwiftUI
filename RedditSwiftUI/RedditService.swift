//
//  RedditService.swift
//  RedditApp
//
//  Created by Muhammed Emin Aydın on 1.07.2022.
//


import Foundation

class RedditService {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
    func getData(for query: String, completion: @escaping (Result<[Post], Error>) -> Void) {
        guard let url = URL(string: "https://www.reddit.com/r/flutterdev/top.json?count=20") else {
            preconditionFailure("Error: \(query)")
        }
        
        session.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else {
                do {
                    let data = data ?? Data()
                    let response = try self?.decoder.decode(Listing.self, from: data)
                    completion(.success(response?.posts ?? []))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
