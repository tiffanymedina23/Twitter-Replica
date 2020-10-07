//
//  TweetCell.swift
//  Twitter
//
//  Created by Tiffany Medina on 10/1/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    var favorited:Bool = false
    var tweetID:Int = -1

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var retweet: UIButton!
    @IBOutlet weak var favTweet: UIButton!
    
    @IBAction func retweetButton(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetID: tweetID, success: {
            self.setRetweeted(true)
        }, failure: { (Error) in
            print("error")
        })
    }
    
    @IBAction func favButton(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(true)
            }, failure: { (Error) in
                print("error")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(false)
            }, failure: { (Error) in
                print("error")
            })
        }
    }
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            favTweet.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            favTweet.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
        if (isRetweeted) {
            retweet.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweet.isEnabled = false
        } else {
            retweet.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweet.isEnabled = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
