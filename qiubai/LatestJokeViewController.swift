//
//  LatestJokeViewController.swift
//  qiubai
//
//  Created by 马威 on 15/12/13.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import UIKit

class LatestJokeViewController: UIViewController,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UserInfoDelegate{

    
    @IBOutlet weak var tableView: UITableView!
    
    // 糗事对象列表
    var jokes : [Joke]!
    
    // 当前页数
    var currentPage = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // 啥意思？ 研究下
        tableView.separatorStyle = .None //去掉下划线
        tableView.estimatedRowHeight = 160
        // 自适应
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // 初始化jokes
        jokes = [Joke]()
        
        
        // 加载数据
        HttpRequest.getLatestJokeForPage(currentPage++, completionHandler: didLoadHotJokes)

        // Do any additional setup after loading the view.
    }
    
    func didLoadHotJokes(jokes: [Joke]) {
        
        for joke in jokes {
            self.jokes.append(joke)
        }
        //print(jokes.count)
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
        return jokes.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if indexPath.row == jokes.count{
            let cell = tableView.dequeueReusableCellWithIdentifier(EmptyCellIdentify, forIndexPath: indexPath) as! EmptyCell
                return cell
            
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(JokeCellIdentify, forIndexPath: indexPath) as! JokeCell
        let joke = jokes[indexPath.row]
        cell.delegate = self
        cell.joke = joke
        cell.drawCell(indexPath.row)
        return cell
    }
    

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == jokes.count{
            HttpRequest.getLatestJokeForPage(currentPage++, completionHandler: didLoadHotJokes)
        }else {
            performSegueWithIdentifier(ShowCommentSegueIdentify, sender: indexPath.row)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    // MARK: - UserInfo Delegate
    
    func showUserInfo(index: Int) {
        performSegueWithIdentifier(UserInfoIdentify, sender: index)
    }
    
    func showImageInfo(index: Int) {
        performSegueWithIdentifier(ImagePopIdentify, sender: index)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let index = sender as! Int
        switch segue.identifier!{
        case ImagePopIdentify :
            let ipvc = segue.destinationViewController as! ImagePopViewController
            ipvc.joke = jokes[index]
        case UserInfoIdentify :
            let uivc = segue.destinationViewController as! UserInfoViewController
            uivc.user = jokes[index].user
        case ShowCommentSegueIdentify :
            let jdvc = segue.destinationViewController as! JokeDetailViewController
            jdvc.joke = jokes[index]
        default : break
        }
    }
    
    // MARK: - Scroll View Delegate
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        // 下拉加载更多囧事
        if scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height {
            HttpRequest.getLatestJokeForPage(currentPage++, completionHandler: didLoadHotJokes)
        }
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
