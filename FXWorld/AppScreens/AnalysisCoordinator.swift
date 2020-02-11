//
//  AnalysisCoordinator.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 29/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import Foundation



class AnalysisCoordinator: FXWSubjectCoordinator {
    
    // MARK: Properties
    
        // ----
    
    
    // MARK: - FXNewsData (Coordinator) Interface
    
    func updateAnalysisData() {
        
        if self.started {
            
            if let upstreamCoordinator = self.coordinator as? AppCoordinator {
                
                let _ = upstreamCoordinator.loadFXData()
            }
        }
    }
    
    func analysisItemsNumber() -> Int {
        
        if let upstreamCoordinator = self.coordinator as? AppCoordinator {
            
            return upstreamCoordinator.technicalAnalysis.count
        }
        
        return 0
    }
    
    func analysisItem(at index: Int) -> Article {
        
        if let upstreamCoordinator = self.coordinator as? AppCoordinator {
            
            if upstreamCoordinator.technicalAnalysis.count > index {
                
                return upstreamCoordinator.technicalAnalysis[index]
            }
        }
        
        let article = Article(title: "Article \(index)", url: "N/A", headlineImageUrl: "N/A", articleImageUrl: "N/A", backgroundImageUrl: "N/A", authors: [["N/A": "N/A"]], instruments: nil, tags: nil, categories: nil, displayTimestamp: 0, lastUpdatedTimestamp: 0)
        
        return article
    }
    
    // MARK: - FXDataProtocol Interface
    
    override func dataDelivered() {
        
        if let analysisView = self.viewTarget as? AnalysisViewController {
            
            analysisView.updateDisplay()
        }
    }
}
