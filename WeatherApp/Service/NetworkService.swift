//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Tasnem on 17/05/2024.
//

import Foundation
import Alamofire

protocol INetworkService<T>{
    associatedtype T
    mutating func fetchData(url: String ,complitionHandler: @escaping (T?, Error?) -> Void)
}
 
class NetworkService<Result : Decodable>: INetworkService {
    typealias T = Result
    func fetchData(url: String, complitionHandler: @escaping (Result?, Error?) -> Void) {
        AF.request(url).responseJSON{
            response in
            if let data = response.data{
                do{
                    let json = try JSONDecoder().decode(Result.self, from: data)
                    print("OK")
                    complitionHandler(json, nil)
                }catch let error{
                    print("Error in remote data source")
                    print(error)
                    complitionHandler(nil, error)
                }
            }
            else{
                print("No Data")
                complitionHandler(nil, responseError.noDataError)
            }
        }
    }
    enum responseError : Error{
        case noDataError
    }
}
