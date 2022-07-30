//
//  CityListResponse.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/6/21.
//

import Foundation

struct CityListResponse:Codable {
    var cityId:Int
    var cityName:String
    var cityLatitude:Double
    var cityLongitude:Double
}
