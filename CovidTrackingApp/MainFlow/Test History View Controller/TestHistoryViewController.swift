//
//  TestHistoryViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 6/15/21.
//

import UIKit

class TestHistoryViewController: UIViewController {
    
    @IBOutlet weak var cltnMain: UICollectionView!
    
    var mockList = [TestHistoryResponse]()
    var historyArray = [TestHistoryResponse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Test History"
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        setCollectionView()
        getTestHistory { (success, msg) in
            if success {
                self.cltnMain.reloadData()
            }
            else {
                
            }
        }
        //loadMockList()
    }
    
    func setCollectionView(){
        ///Add Section Inset For UI Collection View
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        ///Minimum line Spacing Each Cells
        layout.minimumLineSpacing = 15
        cltnMain.collectionViewLayout = layout
        
        ///Register Collection View With Custom Cell
        cltnMain.register(UINib(nibName: TestHistoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TestHistoryCollectionViewCell.identifier)

        ///Collection View Delegate and Data Source settings
        cltnMain.delegate = self
        cltnMain.dataSource = self
    }
    
    func loadMockList(){
//        var data = TestHistoryResponse(testDate: "2021-08-10 09:36:31", probabilityValue: 99.9, doctorName: "Dr. Cansel Bayraktaroğlu Öztekiner", doctorProfession: "Internal Medicine", hospitalName: "Dr. Burhan Nalbantoğlu Devlet Hastanesi", userIdentity: 456789, userAge: 45)
//        mockList.append(data)
//
//        data = TestHistoryResponse(testDate: "2021-08-10 09:36:31", probabilityValue: 99.9, doctorName: "Dr. Cansel Bayraktaroğlu Öztekiner", doctorProfession: "Internal Medicine", hospitalName: "Dr. Burhan Nalbantoğlu Devlet Hastanesi", userIdentity: 456789, userAge: 45)
//        mockList.append(data)
//
//        data = TestHistoryResponse(testDate: "2021-08-10 09:36:31", probabilityValue: 99.9, doctorName: "Dr. Cansel Bayraktaroğlu Öztekiner", doctorProfession: "Internal Medicine", hospitalName: "Dr. Burhan Nalbantoğlu Devlet Hastanesi", userIdentity: 456789, userAge: 45)
//        mockList.append(data)
    }
    
    func getTestHistory(complation: @escaping callback){
        CovidTestService.getTestHistory(userId: 464047, doctorId: 3) { (response, message) in
            guard let response = response else {
                complation(false, message)
                return
            }
            self.historyArray = response
            complation(true, nil)
        }
    }
}


extension TestHistoryViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return historyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
            let cell:TestHistoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: TestHistoryCollectionViewCell.identifier, for: indexPath) as! TestHistoryCollectionViewCell
        cell.configureCell(data: historyArray[indexPath.row])
            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}


extension TestHistoryViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let contentInset = collectionView.contentInset
            var itemsInRow: CGFloat = 1 //Default row value is 1
            if UIDevice.current.userInterfaceIdiom == .pad{ // Change default row value to 2 if the device is iPad
                itemsInRow = 2
            }
            
            //Basic space calculations for usable width
            let innerSpace = layout.minimumInteritemSpacing * (itemsInRow - 1.0)
            let insetSpace = contentInset.left + contentInset.right + layout.sectionInset.left + layout.sectionInset.right
            let width = floor(((collectionView.frame.width) - insetSpace - innerSpace) / itemsInRow);
            
            let height:CGFloat = 120
            

            let cellSize =  CGSize.init(width: width, height: height)
            
            return cellSize
            
        }
        return CGSize.init(width: 0, height: 0)
    }
    
}

    
    


