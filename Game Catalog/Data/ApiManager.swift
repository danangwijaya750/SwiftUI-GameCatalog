//
//  ApiManager.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 13/08/21.
//

import Foundation
import Alamofire

class ApiManager{
    static let getInstance = ApiManager()
    private var params = ["key" : "6ec5c3b3c94645ae85f3e237ce26d870"]
    private let baseUrl = "https://api.rawg.io/api/"
    func getGame(completionHandler: @escaping (Response)->Void){
        AF.request(baseUrl+"games",method: .get,parameters: params)
            .responseDecodable(of: Response.self){ res in
                debugPrint(res)
                switch res.result{
                case .success(let data):
                    completionHandler(data)
                case .failure(let err):
                    debugPrint(err.localizedDescription)
                }
            }
    }
    func searchGame(query:String,completionHandler: @escaping (Response)->Void){
        params["search"] = query
        AF.request(baseUrl+"games",method: .get,parameters: params)
            .responseDecodable(of: Response.self){ res in
                debugPrint(res)
                switch res.result{
                case .success(let data):
                    completionHandler(data)
                case .failure(let err):
                    debugPrint(err.localizedDescription)
                }
            }
    }
    func getDetail(id:String, completionHandler: @escaping (GameDetail)->Void){
        AF.request(baseUrl+"games/"+id,method: .get,parameters: params)
            .responseDecodable(of: GameDetail.self){ res in
                debugPrint(res)
                switch res.result{
                case .success(let data):
                    completionHandler(data)
                case .failure(let err):
                    debugPrint(err.localizedDescription)
                }
            }
    }
    
    
    
}
