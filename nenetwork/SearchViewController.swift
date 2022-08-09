//
//  SearchViewController.swift
//  Pods
//
//  Created by 이주송 on 2022/08/09.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchArea(_ sender: Any) {
        print(self.textField.text)
        getCycleData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
 
}
 
 
