//
//  AppCoordinator.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 28/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import Foundation


protocol FXWorldDataSource {
    
    var topNews: [Article] { get }
    var briefings: DailyBriefings { get }
    var technicalAnalysis: [Article] { get }
    var specialReports: [Article] { get }
    var marketsResponse: MarketsResponse { get }
}

/*
 }

 */

class AppCoordinator: MultiCoordinator, ServiceClient, FXWorldDataSource {
    

    // MARK: - Properties
    
    var viewTarget: ViewTarget
    
    // MARK: • MultiCoordinator Properties
    
    var coordinators: [Coordinator]? {
        
        if  self.linkedCoordinators.count > 0 {
            
            let allCoordinators = Array(self.linkedCoordinators.values)
            return allCoordinators
        }
        
        return nil
    }
    
    var details: [String : Any]?

    // MARK: • AppCoordinator Properties

    var apiService: Service?
    
    // MARK: - FXWorldDataSource Interface

    var topNews: [Article] {
        
        if let cachedAllNews = self.newsModelData {
            
            return cachedAllNews.topNews
        }
        return []
    }
    
    var briefings: DailyBriefings {
        
        if let cachedAllNews = self.newsModelData {
            
            return cachedAllNews.dailyBriefings
        }
        return DailyBriefings(eu: [], asia: [], us: [])
    }
    
    var technicalAnalysis: [Article] {
        
        if let cachedAllNews = self.newsModelData {
            
            return cachedAllNews.technicalAnalysis
        }
        return []
    }
    
    var specialReports: [Article] {
           
           if let cachedAllNews = self.newsModelData {
               
               return cachedAllNews.specialReport
           }
           return []
       }
    
    var marketsResponse: MarketsResponse {
           
           if let cachedMarketsData = self.marketsModelData {
               
               return cachedMarketsData
           }
           return MarketsResponse(currencies: [], commodities: [], indices: [])
       }

    
    // MARK: • Private Properties

    private var newsModelData: AllNews?
    private var marketsModelData: MarketsResponse?

    
    // MARK: - Life Cycle
    
    init(target: ViewTarget) {
        
        self.viewTarget = target
    }

    
    // MARK: - Coordinator Interface
    
    func start() {
        
        self.apiService = DailyFXService(withClient: self)
        self.prepareAPIService()
    }
    

    // MARK: • MultiCoordinator Interface
    
    func addCoordinator(target coordinator: Coordinator, forKey coordinatorKey: String) {
        
        self.linkedCoordinators[coordinatorKey] = coordinator
    }
    
    func removeCoordinator(forKey coordinatorKey: String) {
        
        self.linkedCoordinators.removeValue(forKey: coordinatorKey)
    }
    
    // MARK: - ServiceClient Interface
    
    func receive(status: Int?, result: Any?, error: Error?) {
    
//        print("Data Loaded!")
        
        if let allNews = result as? AllNews,
            let appController = self.viewTarget as? FXDataProtocol {
            
            self.newsModelData = allNews
            appController.receiveNewsModel(allNews)
        }
        
        if let marketsData = result as? MarketsResponse,
        let appController = self.viewTarget as? FXDataProtocol {
            
            self.marketsModelData = marketsData
            appController.receiveMarketsResponseModel(marketsData)
        }
    }
    

    
    // MARK: - AppCoordinator Methods
    
    func loadFXData() -> Bool {
        
        let dashboardStarted = self.readDashboardData()
        let marketsStarted = self.readMarketResponseData()
        
        return dashboardStarted && marketsStarted
    }
    
    func readDashboardData() -> Bool {
        
        if let apiService = self.apiService as? DailyFXService {
            
            if apiService.ready {
                
                apiService.sendDashboardRequest()
                return true
            }
        }
        
        return false
    }
    
    func readMarketResponseData() -> Bool {
        
        if let apiService = self.apiService as? DailyFXService {
            
            if apiService.ready {
                
                apiService.sendMarketsRequest()
                return true
            }
        }
        
        return false
    }

    // MARK: - Private AppCoordinator Methods

    private func prepareAPIService() {
        
        if let apiService = self.apiService as? DailyFXService {
            
            apiService.prepareRequestMethods()
        }
    }
    
    // MARK: - Private MultiCoordinator Methods

    private var linkedCoordinators = [String: Coordinator]()

}
