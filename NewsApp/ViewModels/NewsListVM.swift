//
//  NewsListVM.swift
//  NewsApp
//
//  Created by Justin Bitancor (MDI Novare) on 9/24/24.
//

import Foundation

struct NewsListVM {
    var articles: [Article]
}

extension NewsListVM {
    init(_ articles: [Article]) {
        self.articles = articles
    }
}

extension NewsListVM {
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func newsAtIndex(_ index: Int) -> Article {
        return self.articles[index]
    }
}

struct NewsVM {
    var article: Article
}

extension NewsVM {
    init(_ article: Article) {
        self.article = article
    }
}

extension NewsVM {
    var title: String {
        return self.article.title ?? ""
    }
    
    var description: String {
        return self.article.description ?? ""
    }
}
