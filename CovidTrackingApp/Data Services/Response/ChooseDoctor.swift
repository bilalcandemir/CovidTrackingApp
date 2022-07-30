//
//  ChooseDoctor.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/30/21.
//

import Foundation

enum ChooseDoctorType:Int {
    case town = 0, hospital = 1, doctors = 2
}


struct SelectDoctor {
    var type:ChooseDoctorType
    var items:String
}
