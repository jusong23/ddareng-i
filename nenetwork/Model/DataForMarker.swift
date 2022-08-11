//
//  DataForMarker.swift
//  nenetwork
//
//  Created by 이주송 on 2022/08/10.
//

import Foundation

class ModelForMarker {
    
    private var arrayInfo: [DataStruct] = [
      DataStruct(stationLatitudeArray: "37.6215", stationLongitudeArray: "127.0598", parkingBikeTotCntArray: "77")
    ]
    

    public func inputData(stationLatitudeArray:String, stationLongitudeArray:String, parkingBikeTotCntArray:String) {
        self.arrayInfo.append(DataStruct(stationLatitudeArray: stationLatitudeArray, stationLongitudeArray: stationLongitudeArray, parkingBikeTotCntArray: parkingBikeTotCntArray))
    }
    
    public var count:Int {
        return arrayInfo.count
    }
}
