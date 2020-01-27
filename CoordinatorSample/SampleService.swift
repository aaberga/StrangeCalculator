//
//  SampleService.swift
//  CoordinatorSample
//
//  Created by Aldo Bergamini on 27/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import Foundation



class SampleService: Service {
    
    var client: ServiceClient
    
    init(withClient target: ServiceClient) {
        
        self.client = target
    }
    
}
