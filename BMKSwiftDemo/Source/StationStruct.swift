//
//  StationStruct.swift
//  publicBiycle
//
//  Created by wangrong on 16/2/18.
//  Copyright © 2016年 baidu. All rights reserved.
//
//自定义站点数据结构
import Foundation
struct StationStruct {
    let id:Int
    let StationCode:Int
    let CountryCode:Int
    let name:String
    let address:String
    //站点锁车器数量
    let bikeNum:Int
    let BdLongitude:Double
    let BdLatitude:Double
    let status:Int
    //剩余自行车数量
    let bikes:Int
    //空车位数辆
    let empty:Int
}
