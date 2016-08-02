
//
//  FirstViewController.swift
//  TabBarController
//
//  Created by 潘伟杰 on 16/7/27.
//  Copyright © 2016年 潘伟杰. All rights reserved.
//

import Foundation
import UIKit
@objc(FirstViewController)
class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate {
    //数据源
    var dataArr = NSMutableArray();
    
    //MARK: cell 标识符
    let CellIdentifierNib = "Nib"

    override func viewDidLoad() {
        
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.whiteColor()
        self.setupNavigation();
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
        
        // Class
        _tableView!.registerClass(FirstViewCell.self, forCellReuseIdentifier: "my cell id")

        self.view.addSubview(_tableView!);
    }
    
    
    func setupNavigation() {
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.title = "会话列表"        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataArr.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellid:String = "my cell id";
        var cell:FirstViewCell = tableView.dequeueReusableCellWithIdentifier(cellid) as! FirstViewCell

        if cell.isEqual(nil) {
            cell = FirstViewCell(style:.Default,reuseIdentifier: cellid);
        }
        let s = dataArr.objectAtIndex(indexPath.row);
        cell.titlelable?.text = "瞧瞧\(indexPath.row)"
//        cell?.textLabel?.text = s as? String;
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let nextViewCon = ChatViewController();
        nextViewCon.title = "详情";
        nextViewCon.hidesBottomBarWhenPushed = true;
        self.navigationController?.pushViewController(nextViewCon, animated: true);
    }
}