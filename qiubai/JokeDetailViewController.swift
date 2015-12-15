//
//  JokeDetailViewController.swift
//  qiubai
//
//  Created by 马威 on 15/12/13.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import UIKit

class JokeDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var joke : Joke!
    var comments : [Comment]!
    var currentPage = 1
    
 
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .None //去掉下划线
        tableView.estimatedRowHeight = 180 //cell初始行高
        // 自适应
        tableView.rowHeight = UITableViewAutomaticDimension // 自动计算行高
        // Do any additional setup after loading the view.
        // 获取comments
        comments = [Comment]()
        HttpRequest.getCommentByJokeIDAndForPage(joke.content.id, page: currentPage++, completionHandler: didLoadComtents)
    }
    
    func didLoadComtents(comments : [Comment]){
        for comment in comments {
            self.comments.append(comment)
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
           let cell = tableView.dequeueReusableCellWithIdentifier(JokeCellIdentify, forIndexPath: indexPath) as! JokeDetailCell
            cell.drawCell(joke)
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(CommentCellIdentify, forIndexPath: indexPath) as! CommentCell
            cell.drawCell(comments[indexPath.row - 1])
            return cell
        }
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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
