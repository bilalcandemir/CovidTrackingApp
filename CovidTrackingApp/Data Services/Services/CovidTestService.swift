//
//  CovidTestService.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 6/5/21.
//

import Foundation


class CovidTestService {
    class func CovidTest(userId:Int,doctorId: Int,abdominalPain:Int,
                         anorexia:Int,
                         bluishFace:Int,
                         bodyAches:Int,
                         chestPain:Int,
                         repeatedShaking:Int,
                         confusion:Int,
                         delirium:Int,
                         diarrhea:Int,
                         dizziness:Int,
                         weakness: Int,
                         fever: Double,
                         feeling: Int,
                         headache: Int,
                         hoarseVoice: Int,
                         lossTasteAndSmell: Int,
                         musclePain: Int,
                         runnyNose: Int,
                         nasalStuffiness: Int,
                         nausea: Int,
                         ocularReaction: Int,
                         persistentCough: Int,
                         rhinorrhea: Int,
                         shortnessBreath: Int,
                         skinRush: Int,
                         skippedMeals: Int,
                         sneeze: Int,
                         soreThroat: Int,
                         sputum: Int,
                         vomiting:  Int,completion:@escaping (_ response: CovidTestResponse?, _ message: String?) -> ()){
        
        let parameters:[String:Any] = ["userId":userId,"doctorId": doctorId,"abdominalPain":abdominalPain,
                                       "anorexia":anorexia,
                                       "bluishFace":bluishFace,
                                       "bodyAches":bodyAches,
                                       "chestPain":chestPain,
                                       "repeatedShaking":repeatedShaking,
                                       "confusion":confusion,
                                       "delirium":delirium,
                                       "diarrhea":diarrhea,
                                       "dizziness":dizziness,
                                       "weakness" :weakness,
                                       "fever":fever,
                                       "feeling" :feeling,
                                       "headache" :headache,
                                       "hoarseVoice" :hoarseVoice,
                                       "lossTasteAndSmell" :lossTasteAndSmell,
                                       "musclePain" :musclePain,
                                       "runnyNose" :runnyNose,
                                       "nasalStuffiness" :nasalStuffiness,
                                       "nausea" :nausea,
                                       "ocularReaction" :ocularReaction,
                                       "persistentCough" :persistentCough,
                                       "rhinorrhea" :rhinorrhea,
                                       "shortnessBreath" :shortnessBreath,
                                       "skinRush" :skinRush,
                                       "skippedMeals" :skippedMeals,
                                       "sneeze" :sneeze,
                                       "soreThroat" :soreThroat,
                                       "sputum" :sputum,
                                       "vomiting"  :vomiting]
        
        Request(endpoint: "covidTest", method: .post, parameters: parameters).request(responseType: CovidTestResponse.self) { (response, msg) in
            completion(response as? CovidTestResponse, msg)
        }
    }
    
    class func getTestHistory(userId:Int, doctorId:Int,completion:@escaping (_ response: [TestHistoryResponse]?, _ message: String?) -> ()){
        let parameters:[String:Any] = ["userId":userId, "doctorId":doctorId]
        Request(endpoint: "getTestHistory", method: .post, parameters: parameters).request(responseType: [TestHistoryResponse].self) { (response, msg) in
            completion(response as? [TestHistoryResponse], msg)
        }
    }
}
