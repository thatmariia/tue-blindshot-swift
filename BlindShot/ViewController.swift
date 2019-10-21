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
    
    //MARK: - UNCOMMENT FOR BLE COMMUNICATION
    /*
    var centralManager: CBCentralManager? = nil
    var gunCamUUID = UUID(uuidString: "F0C837A7-C20C-B0C8-F5BA-6B0826F6565D")
    // D29F3F3B-B9E7-104F-CC52-AD71257F86D4 - prev use
    // AC79AFFB-1C07-B3BD-2221-A7166028E559 - my mac
    var gunCamCBUUID : CBUUID!
    var gunCamPeripheral : CBPeripheral!
    */
    
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
    @IBOutlet weak var logoImage: UIImageView!
    
    
    // to execute when the bluetooth message is received
    func received () {
        
        print(" ----------- now in received")
        
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
        
        connectionLabel.text = currentAudio
        
    }

    func setInitAppearance () {
        UIApplication.shared.isIdleTimerDisabled = true
        // make screen pretty
        connectionLabel.text = "not connected"
        connectionLabel.textColor = .black
        let lsfont = UIFont(name: "Verdana-Bold", size: 25)
        connectionLabel.font = lsfont
        logoImage.image = UIImage(named: "logo_image")
    }
    
    func initPlay () {
        audioCommunicate(fileName: currentAudio, stop: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitAppearance()
        initPlay()
        
        //MARK: - UNCOMMENT FOR BLE COMMUNICATION
        /*
        gunCamCBUUID = CBUUID(string: "E7244BEB-0C3F-5624-9BB2-1619EB2165A4")
        centralManager = CBCentralManager(delegate: self, queue: nil)
        */

    }


}

