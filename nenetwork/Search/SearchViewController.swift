//
//  SearchViewController.swift
//  Pods
//
//  Created by 이주송 on 2022/08/09.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(Lat: String, Lot:String, Name:String, Count:String)
}

class SearchViewController: UIViewController {
    
    let dataModel = ModelForMarker ()
    let APICaller = API_Callers ()
    let searchDataModel = SearchDataModel ()
    
    var countOfSearchItem = 0
    
    weak var delegate: SendDataDelegate? // weak로 해야 메모리 누수 x
    
    @IBOutlet var thereIsNoResult: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func searchArea(_ sender: Any) {
        let CycleData = API_Callers ()
        CycleData.getCycleData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(test(_:)), name: NSNotification.Name("locateInfo"), object: nil)
        tableView?.register(
            UINib(nibName: "TableViewCell", bundle: nil),
            forCellReuseIdentifier: "TableViewCell")
    }
            
    @objc func test(_ notification:NSNotification){

        guard let Lat = notification.userInfo!["Lat"] as? Array<Any> else {return}
        guard let Lot = notification.userInfo!["Lot"] as? Array<Any> else {return}
        guard let Cnt = notification.userInfo!["Cnt"] as? Array<Any> else {return}
        guard let Name = notification.userInfo!["Name"] as? Array<Any> else {return}
       
        for i in 0..<Name.count {
            if Name.contains(where: {_ in
                (Name[i] as AnyObject).contains(self.textField.text ?? "")
             }) {
                self.countOfSearchItem += 1
                self.tableView.isHidden = false
                self.thereIsNoResult.isHidden = true
                print(Name[i], Lat[i], Lot[i], Cnt[i])
                self.searchDataModel.inputData(stationName: Name[i] as! String ?? ""  , stationLatitude: Lat[i] as! String ?? "" , stationLongitude: Lot[i] as! String ?? "" , parkingBikeTotCnt: Cnt[i] as! String ?? "", index: i)
                
            }
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(self.dataModel.count)
    }
    
 
}
 
 
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.label.text = self.searchDataModel.getStationName(index: indexPath.row) // data model
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(self.searchDataModel.getLatitude(index: indexPath.row))
        print(self.searchDataModel.getLongitude(index: indexPath.row))
        print(self.searchDataModel.getStationName(index: indexPath.row))
        print(self.searchDataModel.getParkingBikeTotCnt(index: indexPath.row))
        
        let selectedIndex = self.searchDataModel.getIndex(index:indexPath.row)
        
        self.delegate?.sendData(Lat: self.searchDataModel.getLatitude(index: indexPath.row), Lot: self.searchDataModel.getLongitude(index: indexPath.row),Name: self.searchDataModel.getStationName(index: indexPath.row), Count: self.searchDataModel.getParkingBikeTotCnt(index: indexPath.row))
        
        UserDefaults.standard.setValue(selectedIndex, forKey: "Selected")
        self.navigationController?.popViewController(animated: true)
    } 
}

