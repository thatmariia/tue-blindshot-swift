//
//  BluetoothDevice.swift
//  BlindShot
//
//  Created by Mariia Turchina on 17/09/2019.
//  Copyright © 2019 Mariia Turchina. All rights reserved.
//

import Foundation
import CoreBluetooth

class BluetoothDevice {
    var mac: String
    var name: String
    
    var connected : Bool {
        get { if( peripheral == nil) { return false;}
        else if(peripheral!.state == CBPeripheralState.connected) {
            return true
        }
        else {
            return false
            }
        }
    }
    var peripheral : CBPeripheral?
    var characteristic : CBCharacteristic?
    
    init(MAC: String, name: String) {
        self.mac = MAC
        self.name = name
    }
    
    func sendMessage(message: String) {
        if(connected && characteristic != nil) {
            let data: Data = message.data(using: .utf8)!
            peripheral!.writeValue(data, for: characteristic!, type: .withoutResponse)
        }
    }
}
