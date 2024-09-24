//
//  NewsListController.swift
//  NewsApp
//
//  Created by Justin Bitancor (MDI Novare) on 9/24/24.
//

import UIKit

class NewsListController: UITableViewController {
    
    private var viewModel: NewsListVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=66408b1eead4481ea2e556472510c29e"
        if let url = URL(string: urlString) {
            NewsServices().fetchNews(url) { articles in
                if let articles = articles {
                    self.viewModel = NewsListVM(articles)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel == nil ? 0 : self.viewModel.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell else {
            fatalError("Something went wrong")
        }
        
        let newsVM = NewsVM(article: self.viewModel.newsAtIndex(indexPath.row))
        
        cell.titleLabel.text = newsVM.title
        cell.descriptionLabel.text = newsVM.description
        
        return  cell
    }
}
