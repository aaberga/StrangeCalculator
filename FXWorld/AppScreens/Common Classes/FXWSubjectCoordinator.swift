//
//  FXWSubjectCoordinator.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 27/01/2020.
//  Copyright © 2020 iBat Inc.. All rights reserved.
//

import Foundation




protocol FXNewsData: FXDataProtocol {
    
    func updateNews()
    func newsItemsNumber() -> Int
    func newsItems(at index: Int) -> Article
}


protocol FXBriefingsData: FXDataProtocol {
    
    func updateBriefings()
    func briefingAreasCount() -> Int
    func briefingItemsNumber(for areaCode: Int) -> Int
    func briefingItem(at index: Int, for areaCode: Int) -> Article
}


protocol FXAnalysisData: FXDataProtocol {
    
    func updateBriefings()
    func briefingItemsNumber() -> Int
    func briefingItem(at index: Int) -> Article
}


protocol FXReportsData: FXDataProtocol {
    
    func updateReports()
    func reportItemsNumber() -> Int
    func reportItem(at index: Int) -> Article
}


protocol FXMarketsData: FXDataProtocol {
    
    func updateMarkets()
    func marketTypesCount() -> Int
    func marketItemsNumber(for marketCode: Int) -> Int
    func marketItem(at index: Int, for marketCode: Int) -> Article
}



class FXWSubjectCoordinator: Coordinator, FXDataProtocol {
    

    // MARK: - Properties
    
    var viewTarget: ViewTarget
    var started = false
    
    
    // MARK: • Private Properties
    
        // -

    
    // MARK: - Coordinator Interface

    func start() {
        
        self.started = true
        
//        print("Self <\(self)> started!")
    }
    
    
    // MARK: - FXDataProtocol Interface
    
    var coordinator: Coordinator?
    
    func receiveNewsModel(_ allNews: AllNews) {
        
        if let targetView = self.viewTarget as? FXDataProtocol {
            
            print("refreshNewsModel on \(targetView)")
            targetView.receiveNewsModel(allNews)
        }
    }
    
    func receiveMarketsResponseModel(_ marketsResponse: MarketsResponse) {
        
        if let targetView = self.viewTarget as? FXDataProtocol {
            
            print("refreshMarketsResponseModel on \(targetView)")
            targetView.receiveMarketsResponseModel(marketsResponse)
        }
    }
    
    func dataDelivered() {
        
        print("Data delivered to \(self)!")
    }


    // MARK: - Life Cycle
    
    init(viewController: ViewTarget) {
        
        self.viewTarget = viewController
        
//        print("Self <\(self)> inited!")
    }
}
