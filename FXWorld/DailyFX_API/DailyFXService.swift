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



class DailyFXService {

    var client: ServiceClient
    
    init(withClient target: ServiceClient) {
        
        self.client = target
    }
    
    
    
    func sendRequest(for endpoint: Endpoint) {
        /* Configure session, choose between:
           * defaultSessionConfiguration
           * ephemeralSessionConfiguration
           * backgroundSessionConfigurationWithIdentifier:
         And set session-wide properties, such as: HTTPAdditionalHeaders,
         HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
         */
        
        let sessionConfig = URLSessionConfiguration.default

        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

        /* Create the Request:
         
            Dashboard (GET https://content.dailyfx.com/api/v1/dashboard)
         
         or
         
            Markets (GET https://content.dailyfx.com/api/v1/markets)
         */

        let commandURLString = Host.base.rawValue + endpoint.rawValue
        
        guard let URL = URL(string: commandURLString) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"

        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
            } else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
