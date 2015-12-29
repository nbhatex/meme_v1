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
    @IBOutlet weak var memeText: UILabel!
    
    func updateContent(meme:Meme) {
        memeImage.image = meme.memedImage
        memeImage.contentMode = .ScaleAspectFit
        memeImage?.frame = CGRectMake(0, 0, 200, 200)
        memeText.text = meme.fullText()
        memeText.lineBreakMode = .ByTruncatingMiddle
    }
}
