//
//  AppController.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 28/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import Foundation

protocol FXDataProtocol: ViewTarget {
    
    func receiveNewsModel(_ allNews: AllNews)
    func receiveMarketsResponseModel(_ marketsResponse: MarketsResponse)
    
    func dataDelivered()
}


class AppController:  FXDataProtocol {

    // Mark: - ViewTarget Properties
    
    var coordinator: Coordinator?
    
    // Mark: - AppController Interface
    
    func loadAllData() {
        
        if let appCoordinator = self.coordinator as? AppCoordinator {
            
            let _ = appCoordinator.loadFXData()
        }
    }
    
    func refreshData() {
        
    }
    
    // Mark • FXDataProtocol
    
    func receiveNewsModel(_ allNews: AllNews) {
        
        //        print("AllNews Data Loaded! \(allNews)")
//        print("AllNews Data Loaded!")
        
        if let multiCoordinator = self.coordinator as? MultiCoordinator {
            
            if let allLinkedCordinators = multiCoordinator.coordinators {
                
                for currentLinkedCoordinator in allLinkedCordinators {
                    
                    if let fxDataCoordinator = currentLinkedCoordinator as? FXDataProtocol {
                        fxDataCoordinator.dataDelivered()
                    }
                }
            }
        }
    }
    
    func receiveMarketsResponseModel(_ marketsResponse: MarketsResponse) {
        
//        print("MarketsResponse Data Loaded! \(marketsResponse)")
//        print("MarketsResponse Data Loaded!")
        
        if let multiCoordinator = self.coordinator as? MultiCoordinator {
            
            if let allLinkedCordinators = multiCoordinator.coordinators {
                
                for currentLinkedCoordinator in allLinkedCordinators {
                    
//                    print("Target Coord: \(currentLinkedCoordinator)")
                    if let fxDataCoordinator = currentLinkedCoordinator as? FXDataProtocol {
                        fxDataCoordinator.dataDelivered()
                    }
                }
            }
        }
    }
    
    func dataDelivered() {
        
        if let multiCoordinator = self.coordinator as? MultiCoordinator {
            
            if let allLinkedCordinators = multiCoordinator.coordinators {
                
                print("Found \(allLinkedCordinators.count) linked Coordinators")
                
                for currentLinkedCoordinator in allLinkedCordinators {
                    
                    if let fxDataCoordinator = currentLinkedCoordinator as? FXDataProtocol {
                        fxDataCoordinator.dataDelivered()
                    }
                }
            }
        }
    }
}
