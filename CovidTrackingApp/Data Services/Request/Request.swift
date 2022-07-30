//
//  Request.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/2/21.
//

import Foundation
import Alamofire
import SwiftyJSON


class Request {
    
    private let baseUrl:String = "http://localhost:3000/"
    
    typealias handler = (_ response: Any?, _ message: String?) -> ()
    private var endpoint:String
    private var method:HTTPMethod
    private var parameters:[String: Any]?
    private var timeoutSecond:Double?
    
    var response:Any?
    
    init(endpoint:String, method:HTTPMethod, parameters:[String: Any]?, timeoutSecond:Double? = nil) {
        self.endpoint = endpoint
        self.method = method
        self.parameters = parameters
        self.timeoutSecond = timeoutSecond
    }
    
    func logout() {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
                                   
            // topController should now be your topmost view controller
                                   
            //logout
            
            
            //USER_TOKEN = ""
            //UserDefaults.standard.set(nil, forKey: "userToken")
              
//            let sb = UIStoryboard(name: "Account", bundle: nil)
//            let nc = sb.instantiateInitialViewController()!
//            nc.modalPresentationStyle = .fullScreen
//            topController.present(nc, animated: false, completion: nil)
        }
    }
    
    func request<T:Codable>(responseType:T.Type, completion: @escaping handler) {
        //network reachable
        if !NetworkReachabilityManager()!.isReachable {
            completion(nil, Message.network)
            return
        }
        
//        //time out
//        if let timeoutSecond = self.timeoutSecond {
//            let configuration = URLSessionConfiguration.default
//            configuration.timeoutIntervalForRequest = timeoutSecond
//            configuration.timeoutIntervalForResource = timeoutSecond
//            afManager = Alamofire.SessionManager(configuration: configuration)
//        }
        
        //url, body, header parameters
        let url = "\(baseUrl)\(endpoint)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        
        let json = JSON(parameters ?? [:])
        print(json)
        
        //request
        AF.request(url,
                          method: method,
                          parameters: parameters,
                          encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                
                print("Requested endpoint: \(response.request!.url!.absoluteString)")
                
                guard let data = response.data, let statusCode = response.response?.statusCode else {
                    print("An error occurred obtaining data!")
                    completion(nil, Message.unknown)
                    return
                }
                
                print("Alamofire request succeeded: HTTP \(statusCode)")
                
                if 200 ... 299 ~= statusCode {
                    //success
                    do {
                        if responseType == Bool.self {
                            completion(true, nil)
                        }
                        else {
                            let decoder = JSONDecoder()
                            //decoder.keyDecodingStrategy = .convertFromUpperCamelCase
                            self.response = try decoder.decode(responseType, from: data)
                            
                            print("Request is succeed: \(data.debugDescription)")
                            completion(self.response, nil)
                        }
                    }
                    catch let err {
                        print("Request is failure: \(err)")
                        print("Request is failure: \(data.debugDescription)")
                        completion(nil, Message.unknown)
                    }
                }
                else {
                    if statusCode == 401 || statusCode == 403 {
                        //unauthorized
                        print("Request is unauthorized!")
                        self.logout()
                    }
                    else {
                        //failure
                        print("Request is failure: \(data.debugDescription)")
                        
                        do {
                            let decoder = JSONDecoder()
                            //decoder.keyDecodingStrategy = .convertFromUpperCamelCase
                            let result = try decoder.decode(BaseResponse.self, from: data)
                            
//                            if responseType != LoginResponse.self {
//                                self.sendLog(response: response)
//                            }
                            
                            completion(nil, result.message)
                        }
                        catch let err {
                            print(err.localizedDescription)
                            completion(nil, Message.unknown)
                        }
                    }
                }
        }
    }
    
    
}
