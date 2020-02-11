//
//  NewsViewController.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 28/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import UIKit

class NewsViewController: FXWSubjectViewController, FXDataDisplay {
    
    
    // MARK: VC Life Cycle
    
    //    ----
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let newsCoordinator = self.coordinator as? NewsCoordinator {
            
            if self.subjectTable != nil {
                
                self.subjectTable.isHidden = true
                
                self.loadingIndicator.isHidden = false
                self.loadingIndicator.startAnimating()
                newsCoordinator.updateNews()
            }
        }
    }
    
    
    // MARK: • Life Cycle Helpers
    
    override func prepare() {
        
        super.prepare()
        
        self.subject = .news
        
        if self.coordinator == nil {
            
            self.coordinator = NewsCoordinator(viewController: self)
        }
    }
    
    
    // MARK: - UITableViewDataSource Protocol Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let newsCoordinator = self.coordinator as? NewsCoordinator {
            
            return newsCoordinator.newsItemsNumber()
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let newsTableCell = UITableViewCell()
        if let newsCoordinator = self.coordinator as? NewsCoordinator {
            
            let newsItem = newsCoordinator.newsItems(at: indexPath.row)
            newsTableCell.textLabel?.text = "\(newsItem.title)"
        }
        return newsTableCell
        
    }
    
    // MARK: - UITableViewDelegate Protocol Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    // MARK: - FXDataDisplay Protocol Methods
    
    //    func updateDisplay()
    
    //    INHERITED!!
    
}
