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
        let memeCell = tableView.dequeueReusableCellWithIdentifier("memeCell") as! MemeTableViewCell
        
        let height = tableView.bounds.height / 6
        let width = tableView.bounds.width / 2
        
        memeCell.updateContent(memes[indexPath.row],height: height,width: width)
                
        return memeCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let meme = memes[indexPath.row]
        let controller = storyboard?.instantiateViewControllerWithIdentifier("MemeDetailsView") as! MemeDetailsViewController
        controller.meme = meme
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.bounds.height / 6
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
}
