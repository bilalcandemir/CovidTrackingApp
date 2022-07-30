//
//  SideMenuViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 4/15/21.
//

import UIKit


struct MenuItem {
    var title:String
    var imageName:String
}

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var tblMain: UITableView!
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    let menuItems:[MenuItem] = [MenuItem.init(title: "Online Covid-19 Test", imageName: "covidTest"),
                                MenuItem.init(title: "Test History", imageName: "history"),
                                MenuItem.init(title: "Log Out", imageName: "logout")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func configureTableView() {
        self.tblMain.delegate = self
        self.tblMain.dataSource = self
        
        let nib = UINib(nibName: SideMenuTableViewCell.identifier, bundle: nil)

        self.tblMain.register(nib, forCellReuseIdentifier: SideMenuTableViewCell.identifier)

        self.tblMain.rowHeight = UITableView.automaticDimension
        self.tblMain.estimatedRowHeight = 40
        self.tblMain.tableFooterView = UIView.init(frame: CGRect.zero)
    }
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.identifier, for: indexPath) as! SideMenuTableViewCell
        cell.configureCell(data:self.menuItems[indexPath.row])
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.menuItems[indexPath.row].title == "Online Covid-19 Test" {
            let testViewController = TestMainViewController()
            navigationController!.pushViewController(testViewController, animated: true)
        }
        
        else if self.menuItems[indexPath.row].title == "Test History" {
            let historyViewController = TestHistoryViewController()
            navigationController!.pushViewController(historyViewController, animated: true)
        }
        
        else {
            self.appDelegate.openLogin()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56.0
    }
    
}

