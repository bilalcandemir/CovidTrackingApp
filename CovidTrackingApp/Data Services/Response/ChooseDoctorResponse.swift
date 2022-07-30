//
//  ChooseDoctorResponse.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/29/21.
//

import Foundation

struct ChooseDoctorResponse:Codable {
    var townName:String
    var hospitalName:String
    var doctors:[DoctorListResponse]
}
