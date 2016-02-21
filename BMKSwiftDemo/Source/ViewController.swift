//
//  ViewController.swift
//  publicBiycle
//
//  Created by wangrong on 16/2/18.
//  Copyright © 2016年 baidu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,BMKMapViewDelegate,BMKLocationServiceDelegate {

    var mapView :BMKMapView!
    var locService:BMKLocationService!
    var animatedAnnotations = [BMKPointAnnotation]()
    //自定义站点数组
    var stations = [StationStruct](){
        didSet{}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        stations = [
        StationStruct(id:16,StationCode:01010016,CountryCode:0101,name:"中国美术馆站",address: "五四大街美术馆西侧",bikeNum:30,BdLongitude: 116.414757,BdLatitude:39.930853 ,status: 2,bikes: 11,empty: 19),
        StationStruct(id:17,StationCode:01010017,CountryCode:0101,name:"地铁建国门C口站",address: "建国门地铁C出口",bikeNum:40,BdLongitude: 116.440866,BdLatitude:39.91413 ,status: 2,bikes: 1,empty: 39),
        StationStruct(id:22,StationCode:01010022,CountryCode:0101,name:"地铁朝阳门B口站",address: "地铁朝阳门B口",bikeNum:50,BdLongitude: 116.440327,BdLatitude:39.9929546 ,status: 2,bikes: 5,empty: 45)]
        mapView = BMKMapView(frame: self.view.frame)
        self.mapView.delegate = self

        
        self.locService = BMKLocationService()
        self.locService.delegate = self
        self.locService.desiredAccuracy = kCLLocationAccuracyBest
        self.locService.distanceFilter = 10
        self.locService.startUserLocationService()
        
        //设置位置跟踪状态为跟踪位置及前进方向

        //设置显示定位图层
        self.mapView.showsUserLocation = false
        self.mapView.userTrackingMode = BMKUserTrackingModeNone

        self.mapView.showsUserLocation = true
        self.mapView.zoomLevel = 15
        
        self.addAnimatedAnnotation()
        
        
        self.view = self.mapView

        // Do any additional setup after loading the view.
    }
    // MARK: 实现代理方法
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        self.mapView.viewWillAppear()
        self.mapView.delegate = self
    }
    override func viewWillDisappear(animated: Bool) {
        self.mapView.viewWillDisappear()
        self.mapView.delegate = nil
    }
    //处理方向变更信息
    func didUpdateUserHeading(userLocation: BMKUserLocation!) {
        self.mapView.updateLocationData(userLocation)
    }
    //处理位置坐标更新
    func didUpdateBMKUserLocation(userLocation: BMKUserLocation!) {
        self.mapView.updateLocationData(userLocation)
        self.mapView.setCenterCoordinate(userLocation.location.coordinate, animated: true)
    }
    //添加动画标注
    func addAnimatedAnnotation() {
        var animatedAnnotation:BMKPointAnnotation!
        var annotaion:BMKAnnotationView!
        var paopaoView:BMKActionPaopaoView!
        var view:UIView!
        for i in self.stations {
        if animatedAnnotation == nil {
            print("--=-=-=-=-=-=")
            animatedAnnotation = BMKPointAnnotation()
             print("--=-=-=-=-=-=")
            annotaion = BMKAnnotationView(annotation: animatedAnnotation, reuseIdentifier: "view")
             print("--=-=-=-=-=-=")
            animatedAnnotation?.coordinate = CLLocationCoordinate2DMake(i.BdLatitude, i.BdLongitude)
             print("--=-=-=-=-=-=")
            view = UIView(frame: CGRectMake(100, 100, 100, 100))
            view.backgroundColor = UIColor.blueColor()
             print("--=-=-=-=-=-=")
           paopaoView = BMKActionPaopaoView(customView: view)
             print("--=-=-=-=-=-=")
            annotaion.paopaoView = paopaoView
            animatedAnnotation.title = "sdjklfjsdkl"
             print("--=-=-=-=-=-=")
            self.animatedAnnotations.append(animatedAnnotation)
            animatedAnnotation = nil
            }
        }
        for i in self.animatedAnnotations{
        self.mapView.addAnnotation(i)
        }
    }
    //选中一个标注时调用此方法
    func mapView(mapView: BMKMapView!, didSelectAnnotationView view: BMKAnnotationView!) {
        NSLog("点击标注")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
