//
//  ViewController.swift
//  nenetwork
//
//  Created by 이주송 on 2022/08/08.
//

import UIKit
import CoreLocation
import NMapsMap


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var newLat = 0.0
    var newLot = 0.0
    
    @IBOutlet var willBeOpenWhenItClicked: UIView!
    
    @IBOutlet weak var StationName: UILabel!
    @IBOutlet weak var cycleCount: UILabel!
    @IBOutlet weak var cycleCount_Big: UILabel!
    @IBOutlet weak var mapView: NMFMapView!
    @IBOutlet weak var star: UIButton!
    @IBOutlet weak var map: UIButton!
    @IBOutlet weak var navi: UIButton!
    @IBOutlet weak var greenLight: UIButton!
    
    
    @IBAction func tapSearchButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else {return}
        viewController.delegate = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func tapWeatherButton(_ sender: Any) {
//        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController else {return}
//        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.setValue(0, forKey: "Selected")
        
        
//        let mapView = NMFMapView(frame: view.frame)
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(mapView)

//        mapView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
//        mapView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
//        mapView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
//        mapView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
         
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManager.startUpdatingLocation()
            print(locationManager.location?.coordinate)
            
            //현 위치로 카메라 이동
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0))
            cameraUpdate.animation = .easeIn
            mapView.moveCamera(cameraUpdate)
            
            //MARK: - 마커 표시
            let marker = NMFMarker()
            marker.position = NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0)
            marker.width = 25
            marker.height = 35
            marker.captionColor = UIColor.red
            marker.captionText = "2"
            marker.mapView = mapView
            
            let marker2 = NMFMarker()
            marker2.position = NMGLatLng(lat: 37.6215, lng: 127.0598)
            marker2.width = 25
            marker2.height = 35
            marker2.captionColor = UIColor.red
            marker2.captionText = "6"
            marker2.mapView = mapView
            
            let marker3 = NMFMarker()
            marker3.position = NMGLatLng(lat: 37.6231, lng: 127.0601)
            marker3.width = 25
            marker3.height = 35
            marker3.captionColor = UIColor.red
            marker3.captionText = "2"
            marker3.mapView = mapView
            
            let marker4 = NMFMarker()
            marker4.position = NMGLatLng(lat: 37.6279, lng: 127.0555)
            marker4.width = 25
            marker4.height = 35
            marker4.captionColor = UIColor.red
            marker4.captionText = "5"
            marker4.mapView = mapView
            
            let marker5 = NMFMarker()
            marker5.position = NMGLatLng(lat: 37.6267, lng: 127.0536)
            marker5.width = 25
            marker5.height = 35
            marker5.captionColor = UIColor.red
            marker5.captionText = "3"
            marker5.mapView = mapView
            
            let marker6 = NMFMarker()
            marker6.position = NMGLatLng(lat: 37.6258, lng: 127.06)
            marker6.width = 25
            marker6.height = 35
            marker6.captionColor = UIColor.red
            marker6.captionText = "6"
            marker6.mapView = mapView
            
            let marker7 = NMFMarker()
            marker7.position = NMGLatLng(lat: 37.6251, lng: 127.0558)
            marker7.width = 25
            marker7.height = 35
            marker7.captionColor = UIColor.red
            marker7.captionText = "21"
            marker7.mapView = mapView
            
            let marker8 = NMFMarker()
            marker8.position = NMGLatLng(lat: 37.6184, lng: 127.0574)
            marker8.width = 25
            marker8.height = 35
            marker8.captionColor = UIColor.red
            marker8.captionText = "13"
            marker8.mapView = mapView
            
            let marker9 = NMFMarker()
            marker9.position = NMGLatLng(lat: 37.6204, lng: 127.0544)
            marker9.width = 25
            marker9.height = 35
            marker9.captionColor = UIColor.red
            marker9.captionText = "3"
            marker9.mapView = mapView
            
            let marker10 = NMFMarker()
            marker10.position = NMGLatLng(lat: 37.6165, lng: 127.0599)
            marker10.width = 25
            marker10.height = 35
            marker10.captionColor = UIColor.red
            marker10.captionText = "0"
            marker10.mapView = mapView
            
            let marker11 = NMFMarker()
            marker11.position = NMGLatLng(lat: 37.6155, lng: 127.0643)
            marker11.width = 25
            marker11.height = 35
            marker11.captionColor = UIColor.red
            marker11.captionText = "7"
            marker11.mapView = mapView
            

            
        } else {
            print("위치 서비스 Off 상태")
        }

        
    }

    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.integer(forKey: "Selected") != 0 {
            print("it`s woring")
            print(newLot)
        }
        self.willBeOpenWhenItClicked.reloadInputViews()
    }
    
    func moveToSearchedPlace() {
        // 정보 받아오기
        // 위도 경도로 마커 띄우기
        // 정차 대수 화면에 표시 및 뷰에도 띄우기
//            print(UserDefaults.standard.integer(forKey: "Selected"))
        
    }
    
    

}
// 나침반, 날씨, 클릭이벤트, 로그인(화면), 로고 
// escaping , 로그인 넘어갈때 비동기 처리 (날씨)
// 클릭 하면 자전거 사고 현황 받아오기
extension ViewController: SendDataDelegate {
    func sendData(Lat: String, Lot:String, Name:String, Count:String) {
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: Double(Lat) ?? 0.0, lng: Double(Lot) ?? 0.0))
        cameraUpdate.animation = .easeIn
        mapView.moveCamera(cameraUpdate)
        
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: Double(Lat) ?? 0.0, lng: Double(Lot) ?? 0.0)
        marker.width = 25
        marker.height = 35
        marker.captionColor = UIColor.red
        marker.captionText = Count
        // 바꿀거임 대수랑 이름도 받아와서 띄우기 !!
        marker.mapView = mapView
        
        marker.touchHandler = { (overlay: NMFOverlay) -> Bool in
            self.willBeOpenWhenItClicked.isHidden = false
            self.greenLight.tintColor = .green
            self.star.tintColor = .lightGray
            self.map.tintColor = .lightGray
            self.navi.tintColor = .lightGray
            
            self.StationName.text = Name
            self.cycleCount.text = Count
            self.cycleCount_Big.text = Count
            return true // 이벤트 소비, -mapView:didTapMap:point 이벤트는 발생하지 않음
        }
        
    }
}

// 클릭이벤트 -> 사고현황(폴리곤) 및 주차장 이름 파악하는 뷰 띄우기
