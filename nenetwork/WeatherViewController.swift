//
//  WeatherViewController.swift
//  nenetwork
//
//  Created by 이주송 on 2022/08/11.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    let API_Caller = API_Callers ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API_Caller.getCurrentWeather(lat:37.6215, lon:127.0598, onCompleted: { [weak self] response in
            print(response)
            
            // DispatchQueue. main
            DispatchQueue.main.async {
//                self?.resultLabel.text = response
            }
        })
        
    }
    
}
