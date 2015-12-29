//
//  MemeTableViewCell.swift
//  MemeMe
//
//  Created by Narasimha Bhat on 02/12/15.
//  Copyright © 2015 Narasimha Bhat. All rights reserved.
//

import UIKit

class MemeTableViewCell:UITableViewCell {
   
    
    @IBOutlet weak var memeText: UILabel!
    
    @IBOutlet weak var memeImage: UIImageView!
    
    func updateContent(meme:Meme,height:CGFloat,width:CGFloat){
        memeImage?.image = meme.memedImage
        memeImage.contentMode = .ScaleAspectFit
        memeImage?.frame = CGRectMake(0, 0, width, height)
        memeText?.text = meme.fullText()
        memeText?.lineBreakMode = .ByTruncatingMiddle

    }
}