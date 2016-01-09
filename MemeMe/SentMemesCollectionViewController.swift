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
    
    @IBOutlet weak var flowLayout:UICollectionViewFlowLayout!
    
    override func viewWillAppear(animated: Bool)  {
        let space: CGFloat = 3.0
        let size = view.frame.size
        let dimension:CGFloat = size.width >= size.height ? (size.width - (5 * space)) / 6.0 :  (size.width - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension,dimension)
        
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let memeCell = collectionView.dequeueReusableCellWithReuseIdentifier("memeCollectionViewCell",forIndexPath: indexPath) as! MemeCollectionViewCell
        let meme = memes[indexPath.row]
        
        memeCell.updateContent(meme)
        
        return memeCell
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let meme = memes[indexPath.row]
        let controller = storyboard?.instantiateViewControllerWithIdentifier("MemeDetailsView") as! MemeDetailsViewController
        controller.meme = meme
        navigationController?.pushViewController(controller, animated: true)
    }

}
