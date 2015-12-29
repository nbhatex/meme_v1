//
//  Meme.swift
//  MemeMe
//
//  Created by Narasimha Bhat on 06/11/15.
//  Copyright © 2015 Narasimha Bhat. All rights reserved.
//

import UIKit

struct Meme {
    var topText:String
    var bottomText:String
    var image:UIImage
    var memedImage:UIImage

    func fullText() ->String  {
        return topText + " " + bottomText
    }
}