//
//  Article.swift
//  NewsApp
//
//  Created by Justin Bitancor (MDI Novare) on 9/24/24.
//

import Foundation

struct Articles: Decodable {
    var articles: [Articles]
}

struct Article: Decodable {
    var title: String
    var description: String
}
