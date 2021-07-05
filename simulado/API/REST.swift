//
//  REST.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 30/06/21.
//

import Foundation

//MARK: - HTTPMethod

enum HTTPMethod {
    case GET
    case POST
}

//MARK: - REST API

class Rest {
    static let basePath = "http://5f5a8f24d44d640016169133.mockapi.io/api/"
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 60.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    private static let session = URLSession(configuration: configuration )
    
//MARK: - load API

    class func loadAPI(json: Data?, header:Int?,endPointPath: String,HTTPMethod: HTTPMethod , onComplete: @escaping (Data?, Error?) -> Void){
        
        let endPointPath = endPointPath
        let finalUrl = "\(basePath)\(endPointPath)"
        
        guard let url = URL(string: finalUrl ) else {return}
        
        var request = URLRequest(url: url)
        switch HTTPMethod {
        case .GET:
            let httpMethod: String = "GET"
            request.httpMethod = httpMethod
        case .POST:
            let httpMethod: String = "POST"
            request.httpMethod = httpMethod
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("*/*", forHTTPHeaderField: "accept")
            request.httpBody = json
        }

//MARK: - data success
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                if (200...300).contains(response.statusCode) {
                    if let data = data {
                        onComplete(data, nil)
                    }
                } else {
                    if let error = error {
                        onComplete(nil, error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
