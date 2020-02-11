//
//  MarketsCoordinator.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 29/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import Foundation



class MarketsCoordinator: FXWSubjectCoordinator {
    
    // MARK: Properties
    
        // ----
    
    
    // MARK: - FXNewsData (Coordinator) Interface
    
    func updateMarketData() {
        
        if self.started {
            
            if let upstreamCoordinator = self.coordinator as? AppCoordinator {
                
                let _ = upstreamCoordinator.loadFXData()
            }
        }
    }
    
    func marketItemsNumber(for marketType: Int) -> Int {
        
        if let upstreamCoordinator = self.coordinator as? AppCoordinator {
            
            switch marketType {
                
            case 0:
                return upstreamCoordinator.marketsResponse.currencies.count
            case 1:
                return upstreamCoordinator.marketsResponse.indices.count
            case 2:
                return upstreamCoordinator.marketsResponse.indices.count

            default:
                return 0
            }
        }
        
        return 0
    }
    
    func marketItem(at index: Int, for marketType: Int) -> Market {
        
        let blankMarket = Market(displayName: "N/A", marketId: "-", rateDetailURL: "-", topMarket: false)
        
        if let upstreamCoordinator = self.coordinator as? AppCoordinator {
            
            switch marketType {
                
            case 0:
                return upstreamCoordinator.marketsResponse.currencies[index]
            case 1:
                return upstreamCoordinator.marketsResponse.commodities[index]
            case 2:
                return upstreamCoordinator.marketsResponse.indices[index]
                
            default:
                return blankMarket
                
            }
        }
        
        return blankMarket
    }
    
    // MARK: - FXDataProtocol Interface
    
    override func dataDelivered() {
        
        if let marketsView = self.viewTarget as? MarketsViewController {
            
            marketsView.updateDisplay()
        }
    }
}
