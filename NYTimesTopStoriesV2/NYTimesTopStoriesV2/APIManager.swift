//
//  File.swift
//  NYTimesTopStoriesV2
//
//  Created by C4Q on 11/20/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class APIManager {
    
    static let manager = APIManager()
    private init () {}
    
    func apiCall (endPoint: String, callback: @escaping (Data?) -> Void) {
        guard let validURL = URL(string: endPoint) else { return }
        var request = URLRequest(url: validURL)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: request) {(data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Session Error: \(error)")
            }
            
            if let validData = data {
                callback(validData)
            }
        }.resume()
    }
}
