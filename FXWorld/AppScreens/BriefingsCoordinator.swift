//
//  BriefingsCoordinator.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 29/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import Foundation



class BriefingsCoordinator: FXWSubjectCoordinator {
    
    // MARK: Properties
    
        // ----
    
    
    // MARK: - FXNewsData (Coordinator) Interface
    
    func updateBriefingsData() {
        
        if self.started {
            
            if let upstreamCoordinator = self.coordinator as? AppCoordinator {
                
                let _ = upstreamCoordinator.loadFXData()
            }
        }
    }
    
    func briefingsItemsNumber(for briefingType: Int) -> Int {
        
        if let upstreamCoordinator = self.coordinator as? AppCoordinator {
            
            switch (briefingType) {
                
            case 0:
                return upstreamCoordinator.briefings.eu.count

            case 1:
                return upstreamCoordinator.briefings.asia.count
                
            case 2:
                return upstreamCoordinator.briefings.us.count
                
            default:
                return 0
            }
        }
        
        return 0
    }
    
    func briefingItem(at index: Int, for briefingType: Int) -> Article {
        
        let article = Article(title: "Article \(index)", url: "N/A", headlineImageUrl: "N/A", articleImageUrl: "N/A", backgroundImageUrl: "N/A", authors: [["N/A": "N/A"]], instruments: nil, tags: nil, categories: nil, displayTimestamp: 0, lastUpdatedTimestamp: 0)

        if let upstreamCoordinator = self.coordinator as? AppCoordinator {
            
            switch (briefingType) {
                
            case 0:
                if upstreamCoordinator.briefings.eu.count > index {
                    
                    return upstreamCoordinator.briefings.eu[index]
                }

            case 1:
                if upstreamCoordinator.briefings.eu.count > index {
                    
                    return upstreamCoordinator.briefings.asia[index]
                }
                
            case 2:
                if upstreamCoordinator.briefings.eu.count > index {
                    
                    return upstreamCoordinator.briefings.us[index]
                }
                
            default:
                 return article
            }
        }
        
       return article

    }
    
    // MARK: - FXDataProtocol Interface
    
    override func dataDelivered() {
        
        if let briefingsView = self.viewTarget as? BriefingsViewController {
            
            briefingsView.updateDisplay()
        }
    }
}
