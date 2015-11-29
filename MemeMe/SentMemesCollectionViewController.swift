//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Narasimha Bhat on 29/11/15.
//  Copyright © 2015 Narasimha Bhat. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController:UICollectionViewController {
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let memeCell = collectionView.dequeueReusableCellWithReuseIdentifier("memeCollectionViewCell",forIndexPath: indexPath)
        let meme = memes[indexPath.row]
        memeCell.backgroundView = UIImageView(image: meme.memedImage)
        return memeCell
    }
}
