//
//  AppDelegate.swift
//  TabBarController
//
//  Created by 潘伟杰 on 16/7/27.
//  Copyright © 2016年 潘伟杰. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        
        tabBarItem();
        self.window!.makeKeyAndVisible();
        
        return true
    }

    
    func tabBarItem() {
        let vc1:UIViewController = FirstViewController();
        vc1.navigationItem.title = "会话";
        let nav1 = UINavigationController(rootViewController:vc1);
        let image1 = UIImage(named: "ic_message_n");
        nav1.tabBarItem = UITabBarItem(title: "会话",image: image1,tag: 1);
        
        let vc2:UIViewController = SecondViewController();
        vc2.navigationItem.title = "通讯录";
        let nav2 = UINavigationController(rootViewController:vc2);
        let image2 = UIImage(named: "ic_home_n");
        nav2.tabBarItem = UITabBarItem(title: "通讯录",image: image2,tag: 1);
        
        
        let vc3:UIViewController = ThirdViewController();
        vc3.navigationItem.title = "设置";
        let nav3 = UINavigationController(rootViewController:vc3);
        let image3 = UIImage(named: "ic_mine_n");
        nav3.tabBarItem = UITabBarItem(title: "设置",image: image3,tag: 1);
        
        
        let arr = [nav1,nav2,nav3];
        let tabBarController = UITabBarController();
        tabBarController.viewControllers = arr;
        self.window!.rootViewController = tabBarController;
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

