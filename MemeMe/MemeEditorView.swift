//
//  ViewController.swift
//  MemeMe
//
//  Created by Narasimha Bhat on 31/10/15.
//  Copyright © 2015 Narasimha Bhat. All rights reserved.
//

import UIKit

class MemeEditorView: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var textFieldDelegate = TextFieldDelegate()
    
    var memedImage:UIImage!
    
    var origImgSize:CGSize!
    
    let memeTextAttributes:[String:AnyObject] = [
        NSStrokeColorAttributeName: UIColor.blackColor(),
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName: -3.0
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        prepareTextFields(topTextField, bottomTextField)
        navigationController?.setToolbarHidden(false, animated: false)

    }
    
    func prepareTextFields(textFields: UITextField...) {
        for textField in textFields {
            textField.delegate = textFieldDelegate
            textField.defaultTextAttributes = memeTextAttributes
            textField.textAlignment = .Center
            textField.adjustsFontSizeToFitWidth = true
            textField.minimumFontSize = 10.0
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        shareButton.enabled = (imageView.image != nil)
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        subscribeToKeyBoardNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        unsubscribeYoKeyBoardNotifications()
    }

    @IBAction func pickAnImage(sender: AnyObject) {
        let controller = UIImagePickerController()
        controller.delegate = self
        presentViewController(controller,animated: true,completion: nil)
    }
    
    @IBAction func shareMeme(sender: AnyObject) {
        memedImage = generateMemedImage()
        let controller = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        controller.completionWithItemsHandler = {
            (s: String?, ok: Bool, items: [AnyObject]?, err:NSError?) -> Void in
            if ok {
                self.save()
            }
            controller.dismissViewControllerAnimated(true, completion: nil)
            self.goToSentMemes(sender)
        }
        presentViewController(controller, animated: true, completion: nil)
        
    }
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    @IBAction func goToSentMemes(sender: AnyObject) {
        let controller = storyboard?.instantiateViewControllerWithIdentifier("rootView")
        presentViewController(controller!, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            origImgSize = image.size
            imageView.image = image
            imageView.contentMode = .ScaleAspectFit
            shareButton.enabled = true
        }
        picker.dismissViewControllerAnimated( true, completion: nil)
    }
    
    func keyBoardWillShow(notification:NSNotification) {
        if(bottomTextField.isFirstResponder()) {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    func keyBoardWillHide(notification:NSNotification) {
        view.frame.origin.y = 0;
    }
    func subscribeToKeyBoardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    func unsubscribeYoKeyBoardNotifications(){
        NSNotificationCenter.defaultCenter().removeObserver(self,name: UIKeyboardWillShowNotification,object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self,name: UIKeyboardWillHideNotification,object: nil)
    }
    func getKeyboardHeight(notification: NSNotification) -> CGFloat{
        let userinfo = notification.userInfo
        let keyboardSize = userinfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.CGRectValue().height
    }

    @IBAction func pickImageFromCamera(sender: AnyObject) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(controller,animated: true,completion: nil)
    }
    
    func save(){
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, image: imageView.image!, memedImage: memedImage)
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
        
        
    }
    
    func generateMemedImage() -> UIImage
    {
        toolBar.hidden = true
        navigationBar.hidden = true
        //Calculate height
        let height = imageView.frame.height
        let width = origImgSize.width * (imageView.frame.height/origImgSize.height)
        let y = -(navigationBar.frame.height + UIApplication.sharedApplication().statusBarFrame.height)
        let x = (origImgSize.width * (imageView.frame.height/origImgSize.height) - imageView.frame.width)/2
        // Render view to an image
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(width,height), false, 0);
        view.drawViewHierarchyInRect(CGRectMake(x,y,view.bounds.size.width,view.bounds.size.height),
            afterScreenUpdates: true)
        let memedImage : UIImage =
        UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        toolBar.hidden = false
        navigationBar.hidden = false
        return memedImage
    }
}

