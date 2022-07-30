//
//  SafeAreaResponse.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/31/21.
//

import Foundation

struct SafeAreaResponse:Codable {
    var status:String
    var pinColor:String
    var peopleCount:Int
}
