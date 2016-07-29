//
//  FirstViewCell.swift
//  TabBarController
//
//  Created by 潘伟杰 on 16/7/28.
//  Copyright © 2016年 潘伟杰. All rights reserved.
//

import Foundation
import UIKit
class FirstViewCell: UITableViewCell {
    
    var titlelable:UILabel!
    var messsagelabel:UILabel!
    var timelabel:UILabel!
    var headImage:UIImageView!
    
    // Xib 初始化
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.backgroundColor = UIColor.redColor()
    }
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.whiteColor()
        if !self.isEqual(nil) {
            titlelable = UILabel(frame: CGRectMake(75, 5, 100, 34));
            titlelable.textColor = UIColor.blackColor();
            titlelable.backgroundColor = UIColor.whiteColor();
            titlelable.textAlignment = NSTextAlignment.Left;
            titlelable.font = UIFont(name: "zapfino", size: 15);
            self.contentView.addSubview(titlelable);
            
            messsagelabel = UILabel(frame:CGRectMake(75, 30, 200, 34));
            messsagelabel.textColor = UIColor.grayColor();
            messsagelabel.textAlignment = NSTextAlignment.Left
            messsagelabel.font = UIFont(name: "zapfino", size: 11);
            messsagelabel.text = "好好学习，天天向上。";
            self.contentView.addSubview(messsagelabel);
            
            timelabel = UILabel(frame:CGRectMake(self.bounds.width, 0, 40, 34));
            timelabel.font = UIFont.systemFontOfSize(11);
            timelabel.textColor = UIColor.grayColor();
//            timelabel.backgroundColor = UIColor.brownColor();
            timelabel.textAlignment = NSTextAlignment.Right;
            timelabel.text = "2:35";
            self.contentView.addSubview(timelabel);
            
            headImage = UIImageView(frame: CGRectMake(15, 5,50, 50))
            headImage.image = UIImage(named:"ic_okay")
            self.contentView.addSubview(headImage);
            
            
        }
        
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        fatalError("init(coder:) has not been implemented")

    }

}