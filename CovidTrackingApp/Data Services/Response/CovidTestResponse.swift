//
//  CovidTestResponse.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 6/5/21.
//

import Foundation

struct CovidTestResponse:Codable {
    var result:Double
    var testDate:String
    var suggestionId:Int
}
