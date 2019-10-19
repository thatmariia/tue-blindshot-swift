//
//  ViewController.swift
//  BlindShot
//
//  Created by Mariia Turchina on 17/09/2019.
//  Copyright © 2019 Mariia Turchina. All rights reserved.
//

import UIKit
import AVFoundation
import CoreBluetooth

class ViewController: UIViewController {
    
    // bluetooth
    var centralManager: CBCentralManager? = nil
    var gunCamUUID = UUID(uuidString: "AC79AFFB-1C07-B3BD-2221-A7166028E559")
    // D29F3F3B-B9E7-104F-CC52-AD71257F86D4 - prev use
    // AC79AFFB-1C07-B3BD-2221-A7166028E559
    // 5F10EE98-407E-EDC3-6581-F44130BEFB77
    // "D29F3F3B-B9E7-104F-CC52-AD71257F86D4"   @!
    //"85C43909-E07F-9338-D6E3-E684EF52D50D" // upright
    //"AC79AFFB-1C07-B3BD-2221-A7166028E559" // my mac?
    //"E21D9032-7C39-50DB-200B-EE22B57E34BE" // my apple tv
    var gunCamCBUUID : CBUUID!
    var gunCamPeripheral : CBPeripheral!
    
    var message : UInt8 = 7
    
    // audio
    var audioPlayer: AVAudioPlayer? = nil
    
    // auidio library
    var currentAudio : String = "notconnected"
    let audioLib : [UInt8 : String] = [0 : "notdetected",
                                       1 : "detected",
                                       2 : "shoot",
                                       3 : "left",
                                       4 : "right",
                                       5 : "up",
                                       6 : "down",
                                       7 : "notconnected"]
    
    // connection manager
    var connected = false
    @IBOutlet weak var connectionLabel: UILabel!
    
    
    // to execute when the bluetooth message is received
    func received () {
        
        print(" ----------- now in received")
        
        message = 4
        
        // continue playing if the message has been received immediately before
        if (currentAudio == audioLib[message]) {
            return
        }
        
        print("****in playing mode****")
        
        // if smth different is already playing, make it stop
        audioCommunicate(fileName: currentAudio, stop: true)
        
        // loop play newly received message
        currentAudio = audioLib[message]!
        audioCommunicate(fileName: currentAudio, stop: false)
        
    }

    func setInitAppearance () {
        // make screen pretty
        connectionLabel.text = "not connected"
    }
    
    func initPlay () {
        audioCommunicate(fileName: currentAudio, stop: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitAppearance()
        initPlay()
        
        gunCamCBUUID = CBUUID(nsuuid: gunCamUUID!)
        //gunCamCBUUID = CBUUID(string: gunCamUUID)
        centralManager = CBCentralManager(delegate: self, queue: nil)

    }


}
