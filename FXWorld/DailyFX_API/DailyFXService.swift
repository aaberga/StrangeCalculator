//
//  DailyFXService.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 27/01/2020.
//  Copyright © 2020 iBat Inc.. All rights reserved.
//

import Foundation



enum Host: String {
    
    case base = "https://content.dailyfx.com"
}

enum Endpoint: String {
    
    case dashboard = "/api/v1/dashboard"
    case markets = "/api/v1/markets"
}



class DailyFXService: SimpleService {
    
    // MARK: Service Properties
    
        // -----
    
    
    // MARK: Service Life Cycle
    
        // -----

        
    // MARK: Service Methods
    
    override func prepareRequestMethods(with responseBlocks: [String: APIResponseBlock]? = nil) {
        
        super.prepareRequestMethods(with: responseBlocks)
        
        if let _ = responseBlocks { } else {
            
            let dashboardResponse: APIResponseBlock = { (resultTupel: ResultType) -> Void in
                
                if let resultData = resultTupel.result as? Data {
                    
                    do {
                        
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        decoder.dateDecodingStrategy = .secondsSince1970
                        let dashboardData = try decoder.decode(AllNews.self, from: resultData)
                        
                        self.client.receive(status: resultTupel.status, result: dashboardData, error: resultTupel.error)
                        
                    } catch {
                        
                        self.client.receive(status: resultTupel.status, result: resultTupel.result, error: resultTupel.error)
                    }
                }
            }
            self.registerResponse(block: dashboardResponse, for: Endpoint.dashboard.rawValue)
            
            let marketsResponse: APIResponseBlock = { (resultTupel: ResultType) -> Void in
                
                if let resultData = resultTupel.result as? Data {
                    
                    do {
                        
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        decoder.dateDecodingStrategy = .secondsSince1970
                        let marketsData = try decoder.decode(MarketsResponse.self, from: resultData)

                        self.client.receive(status: resultTupel.status, result: marketsData, error: resultTupel.error)
                        
                    } catch {
                        
                        self.client.receive(status: resultTupel.status, result: resultTupel.result, error: resultTupel.error)
                    }
                }
            }
            self.registerResponse(block: marketsResponse, for: Endpoint.markets.rawValue)
        }
    }
    
    
    // MARK: Custom DailyFX Service Methods
    
    func sendDashboardRequest(withData data: [String: Any]? = nil) {
        
        self.sendRequest(for: Endpoint.dashboard.rawValue, withData: data)
    }
    
    
    func sendMarketsRequest(withData data: [String: Any]? = nil) {
        
        self.sendRequest(for: Endpoint.markets.rawValue, withData: data)
    }
}
