//
//  UserInfoViewController.swift
//  qiubai
//
//  Created by 马威 on 15/12/13.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var user : User!
    var dataArr = [["手机品牌", "注册时间"], ["常出没地", "兴趣爱好", "个人说明"]]
    var tag: Int!
    var userArr: [[String]]!

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.separatorStyle = .None
        iconImage.layer.cornerRadius = iconImage.frame.size.width / 2
        iconImage.clipsToBounds = true
        
        let iconURL = Utils.getAvatarURL(user.id, icon: user.icon)
        
        iconImage.hnk_setImageFromURL(iconURL)
        userNameLabel.text = "\(user.name)"
        
        
        userArr = [[String]]()
        
        let createAt = Utils.formatData(user.createdAt)
        var _userArr = [String]()
        _userArr.append(user.device)
        _userArr.append(createAt)
        
        userArr.append(_userArr)
        
        var detailArr = [String]()
        detailArr.append("")
        detailArr.append("")
        detailArr.append("")
        
        userArr.append(detailArr)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataArr.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = dataArr[indexPath.section][indexPath.row]
        cell.detailTextLabel?.text = userArr[indexPath.section][indexPath.row]
        return cell
    }
    
    // MARK: - UITableView delegate
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
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
