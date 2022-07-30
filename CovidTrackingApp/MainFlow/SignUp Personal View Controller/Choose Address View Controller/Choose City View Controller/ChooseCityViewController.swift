//
//  ChooseCityViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/6/21.
//

import UIKit

class ChooseCityViewController: UIViewController {
    
    @IBOutlet weak var tblMain: UITableView!
    
    var cityNamesArray = [CityListResponse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Choose City"
        
        setTableView()
        getCityList { (success, msg) in
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
        
        tblMain.register(UINib(nibName: CityNameTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CityNameTableViewCell.identifier)
    }
    
    func getCityList(completion: @escaping callback){
        ChooseAddressServices.CityList { (response, message) in
            guard let response = response  else {
                completion(false, message)
                return
            }
            self.cityNamesArray = response
            completion(true, message)
        }
    }

}


extension ChooseCityViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityNamesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityNameTableViewCell.identifier) as! CityNameTableViewCell
        cell.configureCell(data: cityNamesArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chooseTownViewController = ChooseTownViewController()
        chooseTownViewController.cityId = cityNamesArray[indexPath.row].cityId
        self.navigationController?.pushViewController(chooseTownViewController, animated: true)
    }
}
