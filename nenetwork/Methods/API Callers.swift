//
//  API Callers.swift
//  nenetwork
//
//  Created by 이주송 on 2022/08/09.
//

import Foundation
import Alamofire
import Security

class API_Callers {
    
    let dataModel = ModelForMarker ()
    
    public var stationLatitudeArray:[String] = []
    public var stationLongitudeArray:[String] = []
    public var parkingBikeTotCntArray:[String] = []
    public var stationName:[String] = []

//MARK: - OpenWeather : 실시간 날씨 데이터
    func getCurrentWeather(lat:Double, lon:Double, onCompleted: @escaping (String) -> Void) {
        // 데이터 요청
        
        // 2. Method Chaining...
        
        AF.request("https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=hourly,daily&appid=70712209ed38b3c9995cdcdd87bda250")
            .responseDecodable(of: WeatherInfo.self) { response in
                
                // 3. Result type
                // Switch - case
                switch response.result { // Swift Result
                case .success(let data):
                    // 1. Escaping..
                    onCompleted(data.timezone)
                    
                case let .failure(error):
                    print(error)
                }
            }
    }

    
//MARK: - 공공데이터 포털 : 공공자전거 실시간 대여현황
    func getCycleData() {
        let url = "http://openapi.seoul.go.kr:8088/4c55476d556a75733638574e646456/json/bikeList/1/1000"
        AF.request(url,
                   method:.get, // 어떤 통신방식을 사용할 지
                   parameters: nil, // 서버로 보낼 parameter를 담는 것(POST)
                   encoding: URLEncoding.default // URL을 통해 접근할 것이니 URLEncoding
                   ) // json 형식으로 받게끔
        .validate(statusCode: 200..<500) // 에러여부
        .responseData(completionHandler: { response in // 응답데이터를 받을수 있는 메소드를 Chaning
            switch response.result { // 요청에 대한 응답 결과
            case let .success(data): // 요청 O
                do { // 요청 O 응답 O
                    let decoder = JSONDecoder()
                    // json 객체에서 data 유형의 인스턴스로 디코딩하는 객체! Decodable, Codable 프로토콜을 준수하는 라인!
                    let result = try decoder.decode(Ddarengi.self, from: data)
                    
                        self.stationLatitudeArray = result.rentBikeStatus.row.map({
                            $0.stationLatitude
                        })

                        self.stationLongitudeArray = result.rentBikeStatus.row.map({
                            $0.stationLongitude
                        })

                        self.parkingBikeTotCntArray = result.rentBikeStatus.row.map({
                            $0.parkingBikeTotCnt
                        })
                            
                        self.stationName = result.rentBikeStatus.row.map({
                            $0.stationName
                        })
                    
                    
                    NotificationCenter.default.post(name: NSNotification.Name("locateInfo"), object: nil,
                    userInfo: ["Lat":self.stationLatitudeArray,
                                 "Lot":self.stationLongitudeArray,
                                 "Cnt":self.parkingBikeTotCntArray,
                                 "Name":self.stationName])
                    

                    // 응답이 완료되면. Completion Handler가 호출됨 -> result를 넘겨받아 data가 구조체로 매핑
                } catch { // 요청 O 응답 X
                    print("error")

                    // 응답을 못받으면 error를 받음
                }
                
            case let .failure(error): break // 요청 X
            }
        })
    }

}


