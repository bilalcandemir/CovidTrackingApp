import Foundation
import UIKit

//MARK: typealias for callbacks used in Data Service
typealias callback = (_ success: Bool, _ message: String?) -> ()

//MARK: device info
let UDID:String = UIDevice.current.identifierForVendor!.uuidString
var USER_TOKEN = ""
let APP_STORE_LINK = "https://apps.apple.com/app/id1505086578"

//MARK: messages

struct Message {
    static var network = ""
    static var unknown = ""
    static var workInProgress = ""
    
    static func load() {
        Message.network = "message_network"
        Message.unknown = "message_unknown"
        Message.workInProgress = "message_work_in_progress"
    }
}

//struct DeviceProperties {
//    static func get() -> [String:Any] {
//        return ["Ip":DeviceProperties.getIPAddress(),
//                "Os":"iOS-\(DeviceProperties.getOSVersion())",
//                "Device":DeviceProperties.getDeviceName(),
//                "Browser":DeviceProperties.getBrowser()]
//    }
//
////    static func getIPAddress() -> String {
////        return IPAddress.getAddress() ?? "127.0.0.1"
////    }
//
//    static func getOSVersion() -> String {
//        return UIDevice.current.systemVersion
//    }
//
//    static func getDeviceName() -> String {
//        return UIDevice.modelName
//    }
//
//    static func getBrowser() -> String {
//        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
//        let buildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
//        return "case-future-ios-client-\(appVersion)-\(buildVersion)"
//    }
//}

//MARK: lengths

struct Length {
    static let searchLocation = 100
    static let email = 100
    static let password = 50
    static let name = 200
    static let phone = 15
    static let website = 200
    static let smsCode = 6
    static let duration = 4
    static let tckn = 11
    static let birthdate = 50
    static let city = 200
    static let address = 500
    static let note = 500
    static let cardNumber = 16
    static let cvc = 4
    static let cardDate = 20
    static let issue = 50
    static let hour = 20
    static let couponCode = 200
    static let passport = 50
    static let message = 500
    static let minimumPassword = 8
}
