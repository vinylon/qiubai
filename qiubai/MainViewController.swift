//
//  MainViewController.swift
//  qiubai
//
//  Created by 马威 on 15/12/13.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(red:255.0/255.0, green:124.0/255.0, blue:56.0/255.0, alpha:1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
