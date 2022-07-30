//
//  ChooseAddressViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/5/21.
//

import UIKit

class ChooseAddressViewController: UIViewController {
    
    @IBOutlet weak var tblMain: UITableView!
    
    var countryNamesArray = [CountryName]()
    
    let customView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Choose Country"
        getCountryNames()
        getMockData()
        setTableView()
    }
    
    func setTableView(){
        tblMain.delegate = self
        tblMain.dataSource = self
        
        tblMain.tableFooterView = customView
        
        tblMain.register(UINib(nibName: CountryNameTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CountryNameTableViewCell.identifier)
    }
    
    func getCountryNames() {
        // Get Country Names From API
    }
    
    func getMockData(){
        var data = CountryName(name: "Turkey")
        countryNamesArray.append(data)
        
        data = CountryName(name: "Cyprus")
        countryNamesArray.append(data)
    }

}

extension ChooseAddressViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryNamesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryNameTableViewCell.identifier) as! CountryNameTableViewCell
        cell.configureCell(data: countryNamesArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if countryNamesArray[indexPath.row].name.uppercased() == "TURKEY" {
            let chooseCityViewController = ChooseCityViewController()
            navigationController?.pushViewController(chooseCityViewController, animated: true)
        }
        else {
            
        }
    }
    
    
}
