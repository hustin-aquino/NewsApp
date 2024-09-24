//
//  NewsServices.swift
//  NewsApp
//
//  Created by Justin Bitancor (MDI Novare) on 9/24/24.
//

import Foundation

struct NewsServices {
    
    func fetchNews(_ url: URL, completion: @escaping ([Article]) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Something went wrong.")
            } else if let  data = data {
                
                let articles = try? JSONDecoder().decode(Articles.self, from: data)
                
                if let articles = articles {
                    completion(articles.articles)
                }
                
                print(articles?.articles)
            }
        }.resume()
    }
}
