//
//  LanguageManager.swift
//  LanguageSwitcher
//
//  Created by David Sobeski on 6/4/14.
//  Copyright (c) 2014 osnine. All rights reserved.
//

import Foundation

// -------------------------------------------------------------------------------------------------
// MARK: - Constants

let kLanguageChanged = "onLanguageChanged"

// -------------------------------------------------------------------------------------------------
// MARK: - LanguageManager Protocol Definition

protocol LanguageManagerProtocol
{
    func onLanguageChanged()
}

// -------------------------------------------------------------------------------------------------
// MARK: - Enumerations

//
//  This enumeration is all the languages that our application supports.
//
enum LanguageType: Int
{
    case English, Czech, Spanish, French, German, Russian
    
    //
    //  This function coverts the enumeration of language type to the two letter string type that
    //  is used by iOS and bundles for localizaiton.
    //
    func toString() -> String
    {
        switch self
        {
            case .English:      return "en"
            case .Czech:        return "cs"
            case .Spanish:      return "es"
            case .French:       return "fr"
            case .German:       return "de"
            case .Russian:      return "ru"
        }
    }
}

// -------------------------------------------------------------------------------------------------
// MARK: - Class Definition

//
//  Our LanguageManager class is a series of helpers that allow us to easily switch between
//  languages.
//
class LanguageManager : NSObject
{
    // ---------------------------------------------------------------------------------------------
    // MARK: - Properties
    
    var localeBundle : NSBundle = NSBundle()

    // ---------------------------------------------------------------------------------------------
    // MARK: - LanguageManager Methods
    
    //
    //  Perform default object initialization.
    //
    init()
    {
        super.init()
    }
    
    //
    //  This method is used to switch languages. It sets the property localeBundle to the newly
    //  selected language bundle.
    //
    func switchLanguage(language: LanguageType)
    {
        //
        //  iOS is smart, if we pass it in an invalid type, it will return the default language and
        //  the path to that resource.
        //
        let path = NSBundle.mainBundle().pathForResource(language.toString(), ofType: "lproj")
        self.localeBundle = NSBundle(path: path)
        
        //
        //  Fire the event to let anyone observing to know that we changed our language.
        //
        self.fireEvent(kLanguageChanged)
    }
    
    //
    //  This method returns the string for the appropriate locale.
    //
    func localizedString(key: String) -> String
    {
        let localeString = NSLocalizedString(key,
                                             tableName: nil,
                                             bundle: self.localeBundle,
                                             value: "",
                                             comment: "")
        
        return localeString;
    }
    
    //
    //  We fire events whenever the language has been changed. Therefore, anyone that wants an
    //  event needs to add themselves as an observer.
    //
    func addObserver(notifyObserver: AnyObject)
    {
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(notifyObserver, selector: Selector(kLanguageChanged), name: kLanguageChanged, object: nil)
    }
    
    //
    //  This method is used when an object wants to stop receiving notifications.
    //
    func removeObserver(notifyObserver: AnyObject)
    {
        let center = NSNotificationCenter.defaultCenter()
        center.removeObserver(notifyObserver)
    }
    
    //
    //  We use this method internally to fire any of our events.
    //
    func fireEvent(eventName: String)
    {
        //
        //  If our eventName is nil or not defined when being pased into this function, simply 
        //  return and log an error message.
        //
        if eventName.isEmpty
        {
            ErrorMessage.println(ErrorMessage.errorInvalidEventName)
            return;
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName(kLanguageChanged, object: self)
    }
}