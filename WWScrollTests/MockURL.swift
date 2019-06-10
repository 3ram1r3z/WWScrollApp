//
//  MockURL.swift
//  WWScrollTests
//
//  Created by Emmanuel Ramirez on 6/7/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import Foundation

class MockURLSession: URLSession {
    
//    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    
    var data: Data?
    var error: Error?
    
    override func dataTask(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        
        let data = self.data
        let error  = self.error
        
        return MockDataTask{ completionHandler(data, nil, error) }
    }
}

class MockDataTask: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void ) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}

