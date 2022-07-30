//
//  ChooseDoctorViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 3/13/21.
//

import UIKit

enum sections{
    case city
    case hospital
    case doctor
}

struct city{
    var cityName:String
}

struct hospital {
    var hospitalName:String
}

struct ChooseDoctor {
    var id:Int
    var section:sections
    var cityName:city
    var hospitalName:hospital
    var doctorName:String
    var doctorProfession:String
}

class ChooseDoctorViewController: UIViewController {
    
    @IBOutlet weak var cltnMain: UICollectionView!
    @IBOutlet weak var btnChoose: UIButton!
    
    
    var mockList = [ChooseDoctor]()
    var selectedDoctors = [ChooseDoctor]()
    
    
    var doctorList = [ChooseDoctorResponse]()
    
    var items = [SelectDoctor]()
    
    var towns = [Town]()
    var hospitals = [Hospital]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadMockList()
        setCollectionView()
        btnChoose.isHidden = true
        
        loadMockList()
        
//        getDoctors { (success, message) in
//            if success {
//                DispatchQueue.main.async {
//                    self.cltnMain.reloadData()
//                }
//            }
//            else {
//                ///Add alert
//            }
//        }
    }
    
    
    
    func setCollectionView(){
        ///Add Section Inset For UI Collection View
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        ///Minimum line Spacing Each Cells
        layout.minimumLineSpacing = 15
        cltnMain.collectionViewLayout = layout
        
        ///Register Collection View With Custom Cell
        cltnMain.register(UINib(nibName: CityHeaderCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CityHeaderCollectionViewCell.identifier)
        ///Register Collection View With Custom Cell
        cltnMain.register(UINib(nibName: ChooseDoctorHospitalCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChooseDoctorHospitalCollectionViewCell.identifier)
        ///Register Collection View With Custom Cell
        cltnMain.register(UINib(nibName: ChooseDoctorCustomCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChooseDoctorCustomCollectionViewCell.identifier)
        
        
        
        ///Collection View Delegate and Data Source settings
        cltnMain.delegate = self
        cltnMain.dataSource = self
    }
    
    
    func getDoctors(completion: @escaping callback){
        AccountService.chooseDoctor(townId: 2) { (response, msg) in
            guard let response = response else {
                completion(false, msg)
                return
            }
            
            var i = 0

            while i < response.count {
                let item = Town(townName: response[i].townName)
                self.towns.append(item)
//                var item = SelectDoctor(type: .town, items: response[i].townName)
//                self.items.append(item)
//
//                item = SelectDoctor(type: .hospital, items: response[i].hospitalName)
//                self.items.append(item)
                i += 1
            }
            self.doctorList = response
            completion(true, nil)
        }
    }
    
    
    
    func loadMockList(){
        var data = ChooseDoctor(id: 1,section: .city, cityName: city(cityName: "Lefkoşa"), hospitalName: hospital(hospitalName: "Dr Nalbant"), doctorName: "Ahmet Bilal Candemir", doctorProfession: "Internal Medicine")
        mockList.append(data)
        data = ChooseDoctor(id: 2,section: .hospital, cityName: city(cityName: "Lefkoşa"), hospitalName: hospital(hospitalName: "Dr. Burhan Nalbantoğlu Devlet Hastanesi"), doctorName: "Ahmet Bilal Candemir", doctorProfession: "Pulmonologist")
        mockList.append(data)
        data = ChooseDoctor(id: 3,section: .doctor, cityName: city(cityName: "Gazimağusa"), hospitalName: hospital(hospitalName: "Dr Nalbant"), doctorName: "Dr. Ahmet Bilal Candemir", doctorProfession: "Pulmonologist")
        mockList.append(data)
        data = ChooseDoctor(id: 4,section: .doctor, cityName: city(cityName: "Gazimağusa"), hospitalName: hospital(hospitalName: "Dr Nalbant"), doctorName: "Dr. Gamze Çelikkaya", doctorProfession: "Internal Medicine")
        mockList.append(data)
        data = ChooseDoctor(id: 5,section: .hospital, cityName: city(cityName: "Lefkoşa"), hospitalName: hospital(hospitalName: "Lefkoşa Acil Durum Hastanesi"), doctorName: "Ahmet Bilal Candemir", doctorProfession: "Internal Medicine")
        mockList.append(data)
        data = ChooseDoctor(id: 6,section: .doctor, cityName: city(cityName: "Gazimağusa"), hospitalName: hospital(hospitalName: "Dr Nalbant"), doctorName: "Dr. Sevban Kurucan", doctorProfession: "Internal Medicine")
        mockList.append(data)
    }
    
    
    
    @IBAction func choosePressed(_ sender: Any) {
        self.appDelegate.openMain()
    }
    

}



extension ChooseDoctorViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        if items[indexPath.row].type == .town {
//            let cell:CityHeaderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CityHeaderCollectionViewCell.identifier, for: indexPath) as! CityHeaderCollectionViewCell
//            cell.configureCell(townName: doctorList[indexPath.row])
//            return cell
//        }
//
//        else if items[indexPath.row].type == .hospital {
//            let cell:ChooseDoctorHospitalCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseDoctorHospitalCollectionViewCell.identifier, for: indexPath) as! ChooseDoctorHospitalCollectionViewCell
//            cell.configureCell(hospitalName: doctorList[indexPath.row])
//            return cell
//        }

//        if doctorList[indexPath.row].townName != ""{
//            let cell:CityHeaderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CityHeaderCollectionViewCell.identifier, for: indexPath) as! CityHeaderCollectionViewCell
//            cell.configureCell(townName: doctorList[indexPath.row])
//            return cell
//        }
//
//        if doctorList[indexPath.row].hospitalName != "" {
//            let cell:ChooseDoctorHospitalCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseDoctorHospitalCollectionViewCell.identifier, for: indexPath) as! ChooseDoctorHospitalCollectionViewCell
//            cell.configureCell(hospitalName: doctorList[indexPath.row])
//            return cell
//        }

//        else {
//            let cell:ChooseDoctorCustomCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: ChooseDoctorCustomCollectionViewCell.identifier, for: indexPath) as! ChooseDoctorCustomCollectionViewCell
//            cell.layer.borderWidth = 1
//            cell.layer.borderColor = UIColor(named: "checkBoxBorder")?.cgColor
//            cell.layer.cornerRadius = 10
//            let isSelected = selectedDoctors.contains(where: {$0.id == mockList[indexPath.row].id
//            })
//            cell.configureCell(data: doctorList[indexPath.row].doctors[indexPath.row], isSelected: isSelected)
//            return cell
//        }
        if mockList[indexPath.row].section == sections.city {
            let cell:CityHeaderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CityHeaderCollectionViewCell.identifier, for: indexPath) as! CityHeaderCollectionViewCell
            cell.configureCell(townName: mockList[indexPath.row])
            return cell
        }
        else if mockList[indexPath.row].section == sections.hospital {
            let cell:ChooseDoctorHospitalCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseDoctorHospitalCollectionViewCell.identifier, for: indexPath) as! ChooseDoctorHospitalCollectionViewCell
            cell.configureCell(hospitalName: mockList[indexPath.row])
            return cell
        }
        else {
            let cell:ChooseDoctorCustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseDoctorCustomCollectionViewCell.identifier, for: indexPath) as! ChooseDoctorCustomCollectionViewCell

            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor(named: "checkBoxBorder")?.cgColor
            cell.layer.cornerRadius = 10

            let isSelected = selectedDoctors.contains(where: {$0.id == mockList[indexPath.row].id
            })
            cell.configureCell(data: mockList[indexPath.row], isSelected: isSelected)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if mockList[indexPath.row].section == sections.doctor {
            
            if let index = selectedDoctors.firstIndex(where: {$0.id == mockList[indexPath.row].id}) {
                selectedDoctors.remove(at: index)
            }
            
            else {
                selectedDoctors.append(mockList[indexPath.row])
            }
            collectionView.reloadData()
        }
        
        if selectedDoctors.isEmpty {
            btnChoose.isHidden = true
        }
        else {
            btnChoose.isHidden = false
        }
        
    }
    
}


extension ChooseDoctorViewController:UICollectionViewDelegateFlowLayout {
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
            
            var height:CGFloat = 0
            
//            if doctorList[indexPath.row].townName != "" {
//                height = 50.0
//            }
//            else if doctorList[indexPath.row].hospitalName != "" {
//                height = 50.0
//            }
//            else {
//                height = 80.0
//            }
            
            if mockList[indexPath.row].section == .city {
                            height = 50.0
                        }
            else if mockList[indexPath.row].section == .hospital {
                            height = 50.0
                        }
                        else {
                            height = 80.0
                        }
            
            

            let cellSize =  CGSize.init(width: width, height: height)
            
            return cellSize
            
        }
        return CGSize.init(width: 0, height: 0)
    }
    
}

    
    

