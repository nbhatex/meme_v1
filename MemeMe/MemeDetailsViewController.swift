//
//  MemeDetailsViewController.swift
//  MemeMe
//
//  Created by Narasimha Bhat on 01/12/15.
//  Copyright © 2015 Narasimha Bhat. All rights reserved.
//

import UIKit

class MemeDetailsViewController:UIViewController {
    var meme:Meme!
    
    @IBOutlet weak var memeImageView:UIImageView!
    
    override func viewDidLoad() {
        memeImageView.contentMode = .ScaleAspectFit
        memeImageView.image = meme.memedImage
    }
}
