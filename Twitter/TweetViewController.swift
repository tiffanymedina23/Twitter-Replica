//
//  TweetViewController.swift
//  Twitter
//
//  Created by Tiffany Medina on 10/2/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetButton(_ sender: Any) {
        if (!composeTweet.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: composeTweet.text, success: { self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                print("error in composetweet")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var composeTweet: UITextView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    


}
