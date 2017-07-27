//
//  JMHomeViewController.swift
//  SwiftSina
//
//  Created by 营 on 2017/7/18.
//  Copyright © 2017年 营. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class JMHomeViewController: JMBaseViewController,UITableViewDataSource,UITableViewDelegate {
    var _homeTableView :UITableView?
    var json :JSON = JSON.null
    var array :[Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        loadData()
        
    }
    private func setupTableview(){
        _homeTableView = UITableView.init(frame: view.bounds, style: .plain)
        view.addSubview(_homeTableView!)
        _homeTableView?.dataSource = self
        _homeTableView?.delegate = self
        _homeTableView?.register(JMHomeCell.self, forCellReuseIdentifier: "id")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.json["data"].type {
        case Type.array, Type.dictionary:
            return self.json["data"].count
        default:
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "id")
        cell?.textLabel?.text = String.init(format: "%ld", indexPath.row)
        return cell!
    }
    let requestComplete: (HTTPURLResponse?, Result<String>) -> Void = { response, result in
        let end = CACurrentMediaTime()
//        self.elapsedTime = end - start
        
        if let response = response {
            for (field, value) in response.allHeaderFields {
//                self.headers["\(field)"] = "\(value)"
            }
        }
        
    }
    private func loadData(){
//        let request = Alamofire.request("https://httpbin.org/get")
//        request.responseString { response in
//            JMPrint("\(String(describing: response.response))\n\(response.result)")
//            self.requestComplete(response.response, response.result)
//        }
//
//        JMPrint("\(request)")
        let requestComplete: (HTTPURLResponse?, Result<String>) -> Void = { response, result in
            JMPrint("\(String(describing: result.value))")
        }

        let request = Alamofire.request("https://brandrelliancetest.actoys.net/socializationapiv2/web/index.php?r=index/playershow_index", method: .post, parameters: nil, encoding: JSONEncoding.default)
        request.responseString { response in
            requestComplete(response.response, response.result)
            self.json =  JSON(parseJSON: response.result.value!)
            self._homeTableView?.reloadData()
            print("\(self.json["data"])")
//            print("\(json)")
//            JMPrint("\(String(describing: response.result.value))")
        }
        
        
    }
//    let parameters: Parameters = [
//            "page_size": 10,
//            "page":10
//        ]
//    let data = Alamofire.request("https://brandrelliancetest.actoys.net/socializationapiv2/web/index.php?r=index/playershow_index", method: .post, parameters: parameters, encoding: JSONEncoding.default)
//        JMPrint("\(data)")
//    }
    
}
