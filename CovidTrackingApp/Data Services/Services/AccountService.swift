//
//  AccountService.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/5/21.
//

import Foundation

class AccountService {
    class func Login(identityNo:String, password:String ,completion:@escaping (_ response: LoginResponse?, _ message: String?) -> ()){
        let parameters:[String:Any] = ["identityNo":identityNo, "password":password]
        Request(endpoint: "login", method: .post, parameters: parameters).request(responseType: LoginResponse.self) { (response, msg) in
            completion(response as? LoginResponse, msg)
        }
    }
    
    class func SignUp(name:String,surname:String,identityNo:String,password:String,gender:Bool,age:Int,weight:Double,height:Double,mobileNumber:Int,meritialStatus:Bool,workHealthSector:Bool,completion:@escaping (_ response: SignUpResponse?, _ message: String?) -> ()){
        let parameters:[String:Any] = ["identityNo":identityNo, "name":name, "surname":surname, "password":password, "gender":gender, "age":age, "weight":weight, "height":height, "mobileNumber":mobileNumber, "meritialStatus":meritialStatus, "workHealthSector":workHealthSector]
        Request(endpoint: "signUp", method: .post, parameters: parameters).request(responseType: SignUpResponse.self) { (response, msg) in
            completion(response as? SignUpResponse, msg)
        }
    }
    
    class func UpdateUserAddress(userId:String, townId:Int,completion:@escaping (_ response: UpdateAddress?,_ message: String?) -> ()) {
        let parameters:[String:Any] = ["userId":userId, "townId":townId]
        Request(endpoint: "updateAddress", method: .post, parameters: parameters).request(responseType: UpdateAddress.self) { (response, msg) in
            completion(response as? UpdateAddress, msg)
        }
    }
    
    class func sendUserDisease(userId:String ,ardsValue : Bool, pneumoniaValue : Bool, covid19Value : Bool, sarsCov2Value : Bool, careUnitValue : Bool,chronicLungValue : Bool,diabetesValue : Bool,hypertensionValue : Bool, chronicLiverValue : Bool, chronicKidneyValue : Bool, chronicHearthValue : Bool, geneticDisorderValue : Bool, bloodCancerValue : Bool, otherCancerValue : Bool, chemotherapyValue : Bool, systemDisorderValue : Bool, takePainkillerValue : Bool, takeDrugValue : Bool, thalassemiaValue : Bool,completion:@escaping (_ response: UserDisease?,_ message: String?) -> ()){
        let parameters:[String:Any] = ["userId":userId,
                                       "ards":ardsValue,
                                       "pneumonia":pneumoniaValue,
                                       "covid":covid19Value,
                                       "sars":sarsCov2Value,
                                       "careUnit":careUnitValue,
                                       "chronicLung":chronicLungValue,
                                       "diabetes":diabetesValue,
                                       "hypertension":hypertensionValue,
                                       "chronicLiver":chronicLiverValue,
                                       "chronicKidney":chronicKidneyValue,
                                       "chronicHearth":chronicHearthValue,
                                       "geneticDisorder":geneticDisorderValue,
                                       "bloodCancer":bloodCancerValue,
                                       "otherCancer":otherCancerValue,
                                       "takeChemotherapy":chemotherapyValue,
                                       "systemDisorder":systemDisorderValue,
                                       "takePainkiller":takePainkillerValue,
                                       "takeCortisoneDrug":takeDrugValue,
                                       "thalassemia":thalassemiaValue]
        
        Request(endpoint: "userDisease", method: .post, parameters: parameters).request(responseType: UserDisease.self) { (response, msg) in
            completion(response as? UserDisease, msg)
        }
    }
    
    class func chooseDoctor(townId:Int, completion:@escaping (_ response: [ChooseDoctorResponse]?,_ message: String?) -> ()){
        let parameters:[String:Any] = ["townId":townId]
        
        Request(endpoint: "hospitalList", method: .post, parameters: parameters).request(responseType: [ChooseDoctorResponse].self) { (response, msg) in
            completion(response as? [ChooseDoctorResponse], msg)
        }
    }
    
    class func getLastTestDate(userId:Int, completion:@escaping (_ response: LastTestDateResponse?,_ message: String?) -> () ){
        let parameters:[String:Any] = ["userId":userId]
        
        Request(endpoint: "lastTestDate", method: .post, parameters: parameters).request(responseType: LastTestDateResponse.self) { (response, msg) in
            completion(response as? LastTestDateResponse, msg)
        }
    }
}



