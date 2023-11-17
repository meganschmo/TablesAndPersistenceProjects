//
//  ViewController.swift
//  AppEventCount
//
//  Created by Megan Schmoyer on 10/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var didFinishLaunching: UILabel!
    
    @IBOutlet weak var configForConnecting: UILabel!
    var configForConnectingCount = 0
    
    @IBOutlet weak var willConnect: UILabel!
    var willConnectCount = 0
    
    @IBOutlet weak var didBecomeActive: UILabel!
    var didBecomeActiveCount = 0
    
    @IBOutlet weak var didResignActive: UILabel!
    var didResignActiveCount = 0
    
    @IBOutlet weak var willEnterForeground: UILabel!
    var willEnterforegroundCount = 0
    
    @IBOutlet weak var didEnterBackground: UILabel!
    var didEnterBackgroundCount = 0
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func updateView() {
        didFinishLaunching.text = "The App has launched \(appDelegate.launchCount) time(s)"
        configForConnecting.text = "The App has configured \(configForConnectingCount) time(s)"
        willConnect.text = "The app's will connect \(willConnectCount) time(s)"
        didBecomeActive.text = "The app's did become active \(didBecomeActiveCount) time(s)"
        didResignActive.text = "The app's did resign active \(didResignActiveCount) time(s)"
        willEnterForeground.text = "The App will enter foreground \(willEnterforegroundCount) time(s)"
        didEnterBackground.text = "The App did enter background \(didEnterBackgroundCount) time(s)"
    }

}

