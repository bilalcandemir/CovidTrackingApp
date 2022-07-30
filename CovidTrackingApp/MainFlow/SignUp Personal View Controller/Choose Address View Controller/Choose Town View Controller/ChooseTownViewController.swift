//
//  ChooseTownViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/7/21.
//

import UIKit

class ChooseTownViewController: UIViewController {
    @IBOutlet weak var tblMain: UITableView!
    
    var cityId:Int!
    
    var townNamesArray = [TownResponse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Choose Town"
        
        setTableView()
        
        getTown { (success, message) in
            if success {
                DispatchQueue.main.async {
                    self.tblMain.reloadData()
                }
            }
        }
        
    }
    
    func setTableView(){
        tblMain.delegate = self
        tblMain.dataSource = self
        
        tblMain.register(UINib(nibName: ChooseTownTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ChooseTownTableViewCell.identifier)
    }
    
    func getTown(completion: @escaping callback){
        ChooseAddressServices.TownList(cityId: cityId) { (response, message) in
            guard let response = response else {
                completion(false, message)
                return
            }
            self.townNamesArray = response
            completion(true, nil)
        }
    }
    
    func setNewTown(_ thisTownId:Int, completion: @escaping callback){
        
        AccountService.UpdateUserAddress(userId: (UserDefaults.standard.object(forKey: "userId") as? String)!, townId: thisTownId) { (response, message) in
            guard let response = response else {
                completion(false, message)
                return
            }
            if response.message.uppercased() == "SUCCESS"{
                completion(true, nil)
            }
            else {
                completion(false, message)
            }
            
        }
        
    }
    
}


extension ChooseTownViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return townNamesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChooseTownTableViewCell.identifier) as! ChooseTownTableViewCell
        cell.configureCell(data: townNamesArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        setNewTown(townNamesArray[indexPath.row].townId) { (success, message) in
            if success {
                UserDefaults.standard.setValue(self.townNamesArray[indexPath.row].townId, forKey: "townId")
                let diseaseViewController = PresenceOfDiseaseViewController()
                self.navigationController?.pushViewController(diseaseViewController, animated: true)
            }
            else {
                
            }
        }
        
        
    }
}

