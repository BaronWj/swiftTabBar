
//
//  FirstViewController.swift
//  TabBarController
//
//  Created by 潘伟杰 on 16/7/27.
//  Copyright © 2016年 潘伟杰. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //数据源

    var dataArr = NSMutableArray();

    override func viewDidLoad() {
        
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.blueColor()
        
        var _tableView :UITableView?;

        //初始化数据源
        for i in 0...20{
            dataArr.addObject("row\(i)");
        }
        print(dataArr);
        
        let rect:CGRect = self.view.bounds;//
        _tableView = UITableView(frame: rect,style: .Plain);
        _tableView!.delegate = self;
        _tableView!.dataSource = self;
        self.view.addSubview(_tableView!);
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataArr.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
       let cellid = "my cell id";
        var cell = tableView.dequeueReusableCellWithIdentifier(cellid);
        if (cell == nil) {
            cell = UITableViewCell(style:.Default,reuseIdentifier: cellid);
        }
        let s = dataArr.objectAtIndex(indexPath.row);
        cell?.textLabel?.text = s as? String;
        return cell!;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let nextViewCon = ViewController();
        nextViewCon.title = "详情";
        self.navigationController?.pushViewController(nextViewCon, animated: true);
    }
}