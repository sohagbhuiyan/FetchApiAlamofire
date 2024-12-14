//
//  FetchApiHandler.swift
//  FetchApiAlamofire
//
//  Created by macmini on 8/29/24.
//

import Foundation
import Alamofire
class FetchApiHandler{
    
    static let sharedInstance = FetchApiHandler()
    
    func fetchAPIData (handler: @escaping (_ apiData:[Model]) -> (Void)){
        let url = "https://jsonplaceholder.typicode.com/posts";
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { resp in
            switch resp.result{
            case.success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([Model].self, from: data!)
                    handler(jsonData)
                }
                catch {
                    print(error.localizedDescription)
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}

struct Model: Codable {
    let id: Int
    let title: String
    let body: String
}
