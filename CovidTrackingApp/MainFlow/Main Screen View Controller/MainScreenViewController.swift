//
//  MainScreenViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 4/14/21.
//

import UIKit
import CoreLocation

struct pinMeans {
    var image:String
    var means:String
}

class MainScreenViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var vw250M: UIView!
    @IBOutlet weak var vw500M: UIView!
    @IBOutlet weak var vw1KM: UIView!
    @IBOutlet weak var vw2KM: UIView!
    @IBOutlet weak var lblDistanceTitle: UILabel!
    @IBOutlet weak var imgPin: UIImageView!
    @IBOutlet weak var lblDistanceSubtitle: UILabel!
    @IBOutlet weak var tblPinMeans: UITableView!
    @IBOutlet weak var lblLastTestDate: UILabel!
    
    var distance = 250
    
    var pinMeansArray = [pinMeans]()
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        setBorder()
        loadPinMeans()
        setTableView()
        locationSettings()
        getLastTestDate()
        lblDistanceTitle.text = "On your location 250 Meters Status:"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        getValue(userLatitude: locValue.latitude, userLongitude: locValue.longitude)
    }
    
    func getLastTestDate(){
        AccountService.getLastTestDate(userId: 464047) { (response, message) in
            guard let response = response else {
                return
            }
            
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
            if let date = formatter.date(from: response.lastTestDate) {
                print(date)
                self.setLastTestDate(testDate: date)
            }
            else {
                print("error")
            }
        }
    }
    
    func setLastTestDate(testDate:Date){
        let dateFormatter = DateFormatter()
        // short format like "12/9/14, 9:50 AM"
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .short
        // will default to user's time zone & locale
        let displayString = dateFormatter.string(from: testDate)
        lblLastTestDate.text = displayString
        print(displayString)
    }
    
    func getValue(userLatitude:Double!, userLongitude:Double!){
        ChooseAddressServices.SafeArea(userId: (UserDefaults.standard.object(forKey: "userId") as? String)!,currentLatitude: userLatitude, currentLongitude: userLongitude, distance: distance) { (response, message) in
            guard let response = response else {
                return
            }
            self.lblDistanceSubtitle.text = "There are \(response.peopleCount) people in your area"
            if response.pinColor == "#FFFFFF" {
                self.imgPin.image = UIImage(named: "pinBlue")
            }
            else if response.pinColor == "#FF0000" {
                self.imgPin.image = UIImage(named: "pinRed")
            }
            
            else if response.pinColor == "#00FF00" {
                ///Add here gray or green color
            }
            else if response.pinColor == "#103FF2" {
                ///Not tested long time
            }
            
            else if response.pinColor == "#000000" {
                self.imgPin.image = UIImage(named: "pinBlack")
            }
        }
    }
    
    func setTableView(){
        tblPinMeans.delegate = self
        tblPinMeans.dataSource = self
        tblPinMeans.separatorStyle = .none
        
        tblPinMeans.register(UINib(nibName: PinMeaningTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PinMeaningTableViewCell.identifier)
    }
    
    func setBorder(){
        vw250M.layer.backgroundColor = UIColor(named: "greenColor")?.cgColor
        vw250M.layer.borderWidth = 1
        vw250M.layer.borderColor = UIColor(named: "greenColor")?.cgColor
        
        vw500M.layer.borderWidth = 1
        vw500M.layer.borderColor = UIColor(named: "greenColor")?.cgColor
        
        vw1KM.layer.borderWidth = 1
        vw1KM.layer.borderColor = UIColor(named: "greenColor")?.cgColor
        
        vw2KM.layer.borderWidth = 1
        vw2KM.layer.borderColor = UIColor(named: "greenColor")?.cgColor
    }
    
    func loadPinMeans(){
        var item = pinMeans(image: "pinRed", means: ": There are people in your area who the last Covid-19 test is Positive")
        pinMeansArray.append(item)
        
        item = pinMeans(image: "pinBlack", means: ": There are people in your area who is don’t Know the Covid-19 test history.")
        pinMeansArray.append(item)
        
        item = pinMeans(image: "pinOrange", means: ": There are people in your area who There are positive tests in the history of Covid-19 testing")
        pinMeansArray.append(item)
        
        item = pinMeans(image: "pinBlue", means: ": There are people in your area who the last Covid-19 test is Negative")
        pinMeansArray.append(item)
    }
    
    func locationSettings(){
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    
    @IBAction func menuPressed(_ sender: Any) {
        openLeftMenu()
    }
    
    
    @IBAction func nearlyPressed(_ sender: Any) {
        vw250M.layer.backgroundColor = UIColor(named: "greenColor")?.cgColor
        vw500M.layer.backgroundColor = UIColor(named: "whiteColor")?.cgColor
        vw1KM.layer.backgroundColor = UIColor(named: "whiteColor")?.cgColor
        vw2KM.layer.backgroundColor = UIColor(named: "whiteColor")?.cgColor
        distance = 250
        getValue(userLatitude: locationManager.location?.coordinate.latitude, userLongitude: locationManager.location?.coordinate.longitude)
        lblDistanceTitle.text = "On your location 250 Meters Status:"
    }
    
    @IBAction func midPressed(_ sender: Any) {
        vw250M.layer.backgroundColor = UIColor(named: "whiteColor")?.cgColor
        vw500M.layer.backgroundColor = UIColor(named: "greenColor")?.cgColor
        vw1KM.layer.backgroundColor = UIColor(named: "whiteColor")?.cgColor
        vw2KM.layer.backgroundColor = UIColor(named: "whiteColor")?.cgColor
        distance = 500
        getValue(userLatitude: locationManager.location?.coordinate.latitude, userLongitude: locationManager.location?.coordinate.longitude)
        lblDistanceTitle.text = "On your location 500 Meters Status:"
    }
    
    @IBAction func farPressed(_ sender: Any) {
        vw250M.layer.backgroundColor = UIColor(named: "whiteColor")?.cgColor
        vw500M.layer.backgroundColor = UIColor(named: "whiteColor")?.cgColor
        vw1KM.layer.backgroundColor = UIColor(named: "greenColor")?.cgColor
        vw2KM.layer.backgroundColor = UIColor(named: "whiteColor")?.cgColor
        distance = 1000
        getValue(userLatitude: locationManager.location?.coordinate.latitude, userLongitude: locationManager.location?.coordinate.longitude)
        lblDistanceTitle.text = "On your location 1 Kilometers Status:"
    }
    
    @IBAction func tooFarPressed(_ sender: Any) {
        vw250M.layer.backgroundColor = UIColor(named: "whiteColor")?.cgColor
        vw500M.layer.backgroundColor = UIColor(named: "whiteColor")?.cgColor
        vw1KM.layer.backgroundColor = UIColor(named: "whiteColor")?.cgColor
        vw2KM.layer.backgroundColor = UIColor(named: "greenColor")?.cgColor
        distance = 2000
        getValue(userLatitude: locationManager.location?.coordinate.latitude, userLongitude: locationManager.location?.coordinate.longitude)
        lblDistanceTitle.text = "On your location 2 Kilometers Status:"
    }
    
}

extension MainScreenViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pinMeansArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblPinMeans.dequeueReusableCell(withIdentifier: PinMeaningTableViewCell.identifier) as! PinMeaningTableViewCell
        cell.configureCell(item: pinMeansArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}




