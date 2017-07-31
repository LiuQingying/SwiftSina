//
//  JMHomeModel.swift
//  SwiftSina
//
//  Created by 营 on 2017/7/27.
//  Copyright © 2017年 营. All rights reserved.
//

import UIKit
import Kingfisher
class JMHomeModel: NSObject {
    /*
    "upvotes" : 0,
    "title" : "123",
    "replies" : 0,
    "favorites" : 0,
    "transformDate" : "2016-10-26",
    "tags" : [
    {
    "name" : "变形金刚",
    "type" : "subject",
    "tag_id" : 1
    }
    ],
    "if_upvotes" : 0,
    "total" : "9962",
    "hits" : 0,
    "if_favorite" : 0,
    "images" : [
    {
    "small" : "http:\/\/han.test.mall.actoys.net\/data\/sdata\/2016102603211477452073489_w332_h220.jpg",
    "big" : "http:\/\/han.test.mall.actoys.net\/data\/sdata\/2016102603211477452073489_w332_h220.jpg"
    }
    ],
    "images_count" : 1,
    "category" : "玩家秀",
    "authorportrait" : "http:\/\/bbs.app.actoys.net\/120\/app_portrait\/259668\/20160129095438_47353.jpg",
    "detail_type_from" : "app",
    "detail_type" : "sunpictures",
    "id" : "1370974",
    "author_id" : "259668",
    "m_url" : "https:\/\/brandrelliancetest.actoys.net\/msocialization\/web\/index.php?r=sdata\/view&tid=1370974&type=sunpictures",
    "detail_refparam" : "1370974",
    "publish_date" : 1477452508,
    "author" : "三星anycall",
    "description" : "123"
 */
    var author :String = ""
    var authorportrait :String = ""
    var transformDate :String = ""
    class func dictForModel(list: [[String :Any]]) ->[JMHomeModel] {
        var models = [JMHomeModel]()
        for dict in list {
            models.append(JMHomeModel(dict: dict))
        }
        return models
    }
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }


}
