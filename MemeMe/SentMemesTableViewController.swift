//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Narasimha Bhat on 15/11/15.
//  Copyright © 2015 Narasimha Bhat. All rights reserved.
//

import UIKit

class SentMemesTableViewController:UITableViewController {
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var memeCell = tableView.dequeueReusableCellWithIdentifier("memeCell")
        if memeCell == nil {
            memeCell = UITableViewCell()
        }
        memeCell?.imageView?.image = memes[indexPath.row].memedImage
        
        return memeCell!
    }
}
