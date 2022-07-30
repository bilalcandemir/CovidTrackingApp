//
//  TestHistoryResponse.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 6/15/21.
//

import Foundation

struct TestHistoryResponse:Codable {
    var userId:Int
    var testDate:String
    var probabilityValue:Double
    var doctorName:String
    var doctorSurname:String
    var doctorProfession:String
    var hospitalName:String
    var userIdentity:String
    var userAge:Int
}
