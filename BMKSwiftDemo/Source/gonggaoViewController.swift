//
//  gonggaoViewController.swift
//  publicBiycle
//
//  Created by wangrong on 16/2/18.
//  Copyright © 2016年 baidu. All rights reserved.
//

import UIKit

class gonggaoViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var gonggaoWebView: UIWebView!
    let url = "http://101.251.199.204/Bicycle/views/ServiceInfo.html"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gonggaoWebView.delegate = self
        self.gonggaoWebView.scalesPageToFit = true
        self.gonggaoWebView.loadRequest(NSURLRequest(URL: NSURL(string: self.url)!))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
