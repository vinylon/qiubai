//
//  ImagePopViewController.swift
//  qiubai
//
//  Created by 马威 on 15/12/13.
//  Copyright © 2015年 vinylon. All rights reserved.
//

import UIKit

class ImagePopViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var joke : Joke!
    @IBAction func closeImagePop(sender: AnyObject) {
        // 关闭model视图
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageURL = Utils.getImageURL(joke.content.id, image: joke.content.image, type: "medium")
        
        image.hnk_setImageFromURL(imageURL)
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
