//
//  NewsListController.swift
//  NewsApp
//
//  Created by Justin Bitancor (MDI Novare) on 9/24/24.
//

import UIKit

class NewsListController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
}
