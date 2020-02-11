//
//  SimpleFXAPIService.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 28/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import Foundation


public class SimpleService: Service {
    
    // MARK: Properties
    
    public var client: ServiceClient
    public var ready: Bool {
        
        return self.methodResponses.count > 0
    }
    
    // MARK: Service Life Cycle
    
    init(withClient target: ServiceClient) {
        
        self.client = target
    }
    
    
    // MARK: Private Service Properties

    var methodResponses: [String: APIResponseBlock] = [:]

    
    // MARK: Private Service Methods

     func sendRequest(for endpoint: Endpoint, withData data: [String: Any]?) {
         
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
          
          Example:
         
             Dashboard (GET https://host.org/api/v1/dashboard)
                    
             Markets (GET https:///host.org/api/v1/markets)
          */

         let commandURLString = Host.base.rawValue + endpoint.rawValue
         
         guard let URL = URL(string: commandURLString) else {return}
         var request = URLRequest(url: URL)
         request.httpMethod = "GET"

         /* Start a new Task */
         let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
             
             let statusCode = (response as! HTTPURLResponse).statusCode

             if let responseMethod = self.methodResponses[endpoint.rawValue] {
                 
                 responseMethod((status: statusCode, result: data, error: error))
             }
         })
         task.resume()
         session.finishTasksAndInvalidate()
     }
    
    
    // MARK: Service Commands

    public func prepareRequestMethods(with responseBlocks: [String: APIResponseBlock]? = nil) {
        
        if let responseBlocks = responseBlocks {
            
            self.methodResponses = responseBlocks
            
        } else {
            
            self.methodResponses = [:]
        }
    }
    
    public func requestMethodsSignature() -> [APIMethod] {
    
        let requestMethodsSignature = Array(self.methodResponses.keys).sorted()
        return requestMethodsSignature
    }
    
    public func registerResponse(block responseBlock: @escaping (ResultType) -> Void, for request: APIMethod) {
        
        self.methodResponses[request] = responseBlock
    }
    
    public func sendRequest(for method: APIMethod, withData data: [String : Any]?) {
        
        if let endPoint = Endpoint(rawValue: method) {
            
            self.sendRequest(for: endPoint, withData: data)
        }
    }
}
