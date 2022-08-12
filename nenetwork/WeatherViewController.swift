//
//  WeatherViewController.swift
//  nenetwork
//
//  Created by 이주송 on 2022/08/11.
//

import UIKit


class WeatherViewController: UIViewController {
    
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var temp: UILabel!
    @IBOutlet var rain: UILabel!
    @IBOutlet var maxTamp: UILabel!
    @IBOutlet var minTemp: UILabel!
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    let API_Caller = API_Callers ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    
    
        API_Caller.getCurrentWeather(onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):
                                
                DispatchQueue.main.async {
                    
                    let nowTemp = result.current.temp
                    self.temp.text = String(format: "%.1f", nowTemp)
                    let imageCode = result.current.weather[0].icon
                    let url = URL(string: "http://openweathermap.org/img/wn/\(imageCode)@2x.png")
                    self.iconImage.load(url: url!)
                    self.rain.text = String(round(result.daily[0].rain ?? 0.0))
                    self.maxTamp.text = String(round(result.daily[0].temp.max - result.current.temp))
                    self.minTemp.text = String(round(result.current.temp - result.daily[0].temp.min))

                }
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
}
 
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
