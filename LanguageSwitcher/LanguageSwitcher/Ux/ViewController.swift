//
//  ViewController.swift
//  LanguageSwitcher
//
//  Created by David Sobeski on 6/4/14.
//  Copyright (c) 2014 osnine. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LanguageManagerProtocol
{
    // ---------------------------------------------------------------------------------------------
    // MARK: - Constants
    
    let kButtonAnimationDuration: NSTimeInterval    = 0.5
    let kButtonAnimationDelay: NSTimeInterval       = 0.5
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - Properties
    
    @IBOutlet var labelHello:           UILabel
    @IBOutlet var labelGoodbye:         UILabel
    @IBOutlet var labelLanguageType:    UILabel
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - UIViewController Method Implementation
    
    //
    //  We are called on this method when we need to initialize the controller. The controller is the
    //  container object of the view (which his done at loadView time) and the model, which we will
    //  initialize here. This is called from the NIB or STORYBOARD. The init method is called when
    //  initializing from code with [[... alloc] init].
    //
    init(coder decoder: NSCoder!)
    {
        //
        //  Call our super to fininalize initialization.
        //
        super.init(coder: decoder)
    }
    
    //
    //  This method is called after the view controller has loaded its view hierarchy into memory.
    //  This method is called regardless of whether the view hierarchy was loaded from a nib file or
    //  created programmatically in the loadView method. You usually override this method to perform
    //  additional initialization on views that were loaded from nib files.
    //
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //
        //  We want to set our hello and goodbye labels to the appropriate text. The first time we
        //  load, we want to set the language to English. Note, in a real application, we would
        //  let the user select their preferred language and we would save it in the UserDefaults.
        //  Then, we would fetch the stored language preference and use that to setup the user
        //  interface components.
        //
        
        //
        //  Fetch the application delegate from the sharedApplication object.
        //
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        //
        //  We want to regsiter ourselves to listen to language changed events.
        //
        appDelegate.languageManager.addObserver(self)
        
        //
        //  Change our language to English.
        //
        appDelegate.languageManager.switchLanguage(LanguageType.English)
        
        //
        //  Animate our language selection buttons to come up from the bottom of the screen.
        //
        animateButton(self.view.viewWithTag(Resource.kButton_English),  forDelay: kButtonAnimationDelay * 1)
        animateButton(self.view.viewWithTag(Resource.kButton_Czech),    forDelay: kButtonAnimationDelay * 2)
        animateButton(self.view.viewWithTag(Resource.kButton_Russian),  forDelay: kButtonAnimationDelay * 3)
        animateButton(self.view.viewWithTag(Resource.kButton_French),   forDelay: kButtonAnimationDelay * 4)
        animateButton(self.view.viewWithTag(Resource.kButton_German),   forDelay: kButtonAnimationDelay * 5)
        animateButton(self.view.viewWithTag(Resource.kButton_Spanish),  forDelay: kButtonAnimationDelay * 6)
    }

    //
    //  We are notified that view was added to a view hierarchy for this view controller.
    //
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
    }
    
    //
    //  This method should free up as much memory as possible by purging cached data objects that can
    //  be recreated (or reloaded from disk) later. Use this method in conjunction with the
    //  didReceiveMemoryWarning of the UIViewController class and the
    //  UIApplicationDidReceiveMemoryWarningNotification notification to release memory throughout
    //  the application.
    //
    //  It is strongly recommended that you implement this method. If your application does not release
    //  enough memory during low-memory conditions, the system may terminate it outright.
    //
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //
    //  The preferred status bar style for the view controller. In our case, we want the light
    //  style content. Therefore, we override this fucntion and pass back our light style.
    //
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return UIStatusBarStyle.LightContent
    }
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - LanguageManager Protocol Implementation
    
    //
    //  We are notified on this mehtod whenever the language changes. At this point, we want to
    //  change the language of all of our labels.
    //
    func onLanguageChanged()
    {
        //
        //  Fetch the application delegate from the sharedApplication object.
        //
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate

        //
        //  Set the labels of our text items.
        //
        self.labelHello.text    = appDelegate.languageManager.localizedString("STRING_HELLO")
        self.labelGoodbye.text  = appDelegate.languageManager.localizedString("STRING_GOODBYE")
        
        //
        //  ILLUSTRATION: This is an illustration of using the SWIFT language operator overload
        //  feature. Once we know what language was selected, we simply get the string value for
        //  the selected language type and set our label (labelLanguageType) to the value.
        //
        self.labelLanguageType.text = ~appDelegate.languageManager.currentLanguage
    }
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - UI Event Actions
    
    //
    //  The user taps the switch to English button. We need to load the appropriate string table
    //  and set the values of the hello and goodbye labels.
    //
    @IBAction func switchToEnglish(sender : AnyObject)
    {
        //
        //  Fetch the application delegate from the sharedApplication object.
        //
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        //
        //  Change our language to English.
        //
        appDelegate.languageManager.switchLanguage(LanguageType.English)
    }
    
    //
    //  The user taps the switch to Czech button. We need to load the czech string string table
    //  and set the values of the hello and goodbye labels.
    //
    @IBAction func switchToCzech(sender : AnyObject)
    {
        //
        //  Fetch the application delegate from the sharedApplication object.
        //
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        //
        //  Change our language to Czech.
        //
        appDelegate.languageManager.switchLanguage(LanguageType.Czech)
    }
    
    //
    //  The user taps the switch to Russian button. We need to load the czech string string table
    //  and set the values of the hello and goodbye labels.
    //
    @IBAction func switchToRussian(sender : AnyObject)
    {
        //
        //  Fetch the application delegate from the sharedApplication object.
        //
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        //
        //  Change our language to Russian.
        //
        appDelegate.languageManager.switchLanguage(LanguageType.Russian)
    }
    
    //
    //  We use this method to illustrate three of our button all using the same event to determine
    //  which language we need to switch and perform the switch based on the button.
    //
    @IBAction func switchLanguage(sender : AnyObject)
    {
        //
        //  Cast our "sender" object to a UIButton.
        //
        let button: UIButton = sender as UIButton
        
        //
        //  Fetch the application delegate from the sharedApplication object.
        //
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        //
        //  Based on the tag, we want to set the language.
        //
        var language : LanguageType!
        
        switch button.tag
        {
            case Resource.kButton_French:   language = LanguageType.French
            case Resource.kButton_German:   language = LanguageType.German
            case Resource.kButton_Spanish:  language = LanguageType.Spanish
            default:                        language = LanguageType.English
        }
        
        //
        //  Change our language to the appropriately selected language.
        //
        appDelegate.languageManager.switchLanguage(language)
    }
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - Internal Helper Methods
    
    //
    //  This mehtod is used to animate our core ui buttons from the bottom of the screen and put them
    //  in the right place.
    //
    func animateButton(button: UIView, forDelay delay: NSTimeInterval)
    {
        //
        //  Cache the current frame for the view.
        //
        let cachedButtonFrame = button.frame
        
        //
        //  Compute the area below the bottom of the screen and place the view at that location.
        //
        button.frame = CGRectMake(button.frame.origin.x, self.view.bounds.size.height, button.frame.size.width, button.frame.size.height)
        
        //
        //  Animate for a duration of 0.5 seconds and move the buttom from the bottom to its correct
        //  location. We set the right location in the animations block simply by resetting the button's
        //  frame location to the original location that we cached.
        //
        UIView.animateWithDuration(kButtonAnimationDuration,
            delay: delay,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: { () -> Void in button.frame = cachedButtonFrame },
            completion: { (Bool) -> Void in var finished = true })
    }
}

