//
//  TownResponse.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/7/21.
//

import Foundation

struct TownResponse:Codable {
    var cityId:Int
    var townId:Int
    var townName:String
}
