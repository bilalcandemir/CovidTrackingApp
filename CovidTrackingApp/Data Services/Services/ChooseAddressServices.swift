//
//  ChooseAddressServices.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/6/21.
//

import Foundation

class ChooseAddressServices {
    class func CityList(completion:@escaping (_ response: [CityListResponse]?, _ message: String?) -> ()){
        
        Request(endpoint: "cityList", method: .get, parameters: nil).request(responseType: [CityListResponse].self) { (response, msg) in
            completion(response as? [CityListResponse], msg)
        }
    }
    
    class func TownList(cityId:Int, completion:@escaping (_ response: [TownResponse]?, _ message: String?) -> ()){
        let parameters = ["cityId":cityId]
        Request(endpoint: "townList", method: .post, parameters: parameters).request(responseType: [TownResponse].self) { (response, msg) in
            completion(response as? [TownResponse], msg)
        }
    }
    
    class func SafeArea(userId:String,currentLatitude:Double, currentLongitude:Double, distance:Int, completion:@escaping (_ response: SafeAreaResponse?, _ message: String?) -> ()){
        let parameters:[String:Any] = ["userId":userId ,"currentLatitude":currentLatitude, "currentLongitude":currentLongitude, "distance":distance]
        
        Request(endpoint: "safeArea", method: .post, parameters: parameters).request(responseType: SafeAreaResponse.self) { (response, msg) in
            completion(response as? SafeAreaResponse, msg)
        }
    }
}
