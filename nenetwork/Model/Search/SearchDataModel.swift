//
//  SearchDataModel.swift
//  nenetwork
//
//  Created by 이주송 on 2022/08/11.
//

import Foundation

class SearchDataModel {
    
    private var arraySearchData: [SearchData] = [
    ]

    public func inputData(stationName:String, stationLatitude:String, stationLongitude:String, parkingBikeTotCnt:String, index:Int) {
        arraySearchData.append(SearchData(stationName: stationName, stationLatitude: stationLatitude, stationLongitude: stationLongitude, parkingBikeTotCnt: parkingBikeTotCnt, index: index))
    }
    
    
    public func getIndex(index: Int) -> Int {
        return arraySearchData[index].index ?? 0
    }

    public var count: Int {
        return arraySearchData.count
    }
    
    public func getStationName(index: Int) -> String {
        return arraySearchData[index].stationName ?? ""
    }
    
    public func getLatitude(index: Int) -> String {
        return arraySearchData[index].stationLatitude ?? ""
    }
    
    public func getLongitude(index: Int) -> String {
        return arraySearchData[index].stationLongitude ?? ""
    }
    
    public func getParkingBikeTotCnt(index: Int) -> String {
        return arraySearchData[index].parkingBikeTotCnt ?? ""
    }

}
