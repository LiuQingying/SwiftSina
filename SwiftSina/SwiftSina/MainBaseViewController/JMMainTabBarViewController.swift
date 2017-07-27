//
//  JMMainTabBarViewController.swift
//  SwiftSina
//
//  Created by 营 on 2017/7/18.
//  Copyright © 2017年 营. All rights reserved.
//

import UIKit

class JMMainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        addChildViewController(className:"JMHomeViewController", imageName: "tabbar_home", title: "首页")
        addChildViewController(className:"JMMessageViewController", imageName: "tabbar_message_center", title: "消息")
        addChildViewController(className:"JMMainViewController", imageName: "tabbar_compose_icon_add", title: "主页")
        addChildViewController(className:"JMDiscoverViewController", imageName: "tabbar_discover", title: "发现")
        addChildViewController(className:"JMMeViewController", imageName: "tabbar_profile", title: "我")
        
    }
    private func addChildViewController(className :String ,imageName: String ,title :String){
        // 获取命名空间
        guard let nsp = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else
        {
            print("没有获得命名空间")
            return
        }
        // 通过一个字符串创建一个类
        let cls: AnyClass? = NSClassFromString(nsp + "." + className)
        // 通过一个Class创建一个对象
        // Swift中如果想通过一个AnyClass来创建一个对象，必须先明确这个类的类型
        guard let vcCls = cls as? JMBaseViewController.Type else
        {
        
            print("anyClass没有值")
            return
        }
        let vc = vcCls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage.init(named: imageName)
        vc.tabBarItem.selectedImage =  UIImage.init(named: imageName + "_highlighted")?.withRenderingMode(.alwaysOriginal);
        let navVC = JMNavigationViewController(rootViewController: vc)
        addChildViewController(navVC)
        
    }
    private func string() ->String{
        return "  ";
        
    }
}
