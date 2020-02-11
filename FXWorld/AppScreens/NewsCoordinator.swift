//
//  NewsCoordinator.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 27/01/2020.
//  Copyright © 2020 iBat Inc.. All rights reserved.
//

import Foundation



class NewsCoordinator: FXWSubjectCoordinator, FXNewsData {
    
    // MARK: Properties
    
        // ----
    
    
    // MARK: - FXNewsData (Coordinator) Interface
    
    func updateNews() {
        
        if self.started {
            
            if let upstreamCoordinator = self.coordinator as? AppCoordinator {
                
                let _ = upstreamCoordinator.loadFXData()
            }
        }
    }
    
    func newsItemsNumber() -> Int {
        
        if let upstreamCoordinator = self.coordinator as? AppCoordinator {
            
            return upstreamCoordinator.topNews.count
        }
        
        return 0
    }
    
    func newsItems(at index: Int) -> Article {
        
        if let upstreamCoordinator = self.coordinator as? AppCoordinator {
            
            if upstreamCoordinator.topNews.count > index {
                
                return upstreamCoordinator.topNews[index]
            }
        }
        
        let article = Article(title: "Article \(index)", url: "N/A", headlineImageUrl: "N/A", articleImageUrl: "N/A", backgroundImageUrl: "N/A", authors: [["N/A": "N/A"]], instruments: nil, tags: nil, categories: nil, displayTimestamp: 0, lastUpdatedTimestamp: 0)
        
        return article
    }
    
    // MARK: - FXDataProtocol Interface
    
    override func dataDelivered() {
        
        if let newsView = self.viewTarget as? NewsViewController {
            
            newsView.updateDisplay()
        }
    }
}
