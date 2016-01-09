//
//  MemeCollectionViewCell.swift
//  MemeMe
//
//  Created by Narasimha Bhat on 08/12/15.
//  Copyright © 2015 Narasimha Bhat. All rights reserved.
//

import UIKit

class MemeCollectionViewCell:UICollectionViewCell {
    
    @IBOutlet weak var memeImage: UIImageView!
    
    func updateContent(meme:Meme) {
        memeImage.image = meme.memedImage
        memeImage.frame = bounds
        memeImage.contentMode = .ScaleAspectFill
    }
}
