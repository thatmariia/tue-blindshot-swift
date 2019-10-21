//
//  BLEController.swift
//  BlindShot
//
//  Created by Mariia Turchina on 17/09/2019.
//  Copyright © 2019 Mariia Turchina. All rights reserved.
//


//MARK: - UNCOMMENT FOR BLE COMMUNICATION
/*
import Foundation
import CoreBluetooth

extension ViewController : CBCentralManagerDelegate, CBPeripheralDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("central.state is .unknown")
        case .resetting:
            print("central.state is .resetting")
        case .unsupported:
            print("central.state is .unsupported")
        case .unauthorized:
            print("central.state is .unauthorized")
        case .poweredOff:
            print("central.state is .poweredOff")
            print("BLUETOOTH IS NOT ENABLED")
            // make alert to turn bluetooth on
            message = 7
            received()
        case .poweredOn:
            print("central.state is .poweredOn")
            // scan for the peripheral
            print([gunCamCBUUID!])
            centralManager?.scanForPeripherals(withServices: nil)
        @unknown default:
            print("Execution error")
            message = 7
            received()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(peripheral.name ?? "*no name*", " *** ", peripheral.identifier)
        if (peripheral.identifier == gunCamUUID){
            gunCamPeripheral = peripheral
            gunCamPeripheral.delegate = self
            centralManager!.stopScan()
            centralManager?.connect(gunCamPeripheral)
            print("got the right thing ****")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("now connected to the peripheral")
        connected = true
        connectionLabel.text = "connected"
        gunCamPeripheral.discoverServices(/*[gunCamCBUUID]*/nil)
        print("discovered services")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
        guard let services = peripheral.services else { return }
        print("now printing services:")
        print(services)
        for service in services {
            print("curr service : ", service)
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        
        guard let characteristics = service.characteristics else { return }
        
        for characteristic in characteristics {
            print(characteristic)
            
            if characteristic.properties.contains(.read) {
                print("\(characteristic.uuid): properties contains .read")
                peripheral.readValue(for: characteristic)
            }
            if characteristic.properties.contains(.notify) {
                print("\(characteristic.uuid): properties contains .notify")
                peripheral.setNotifyValue(true, for: characteristic)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        print("__________________________________________________________________")
        print("****** char uuid : \n", characteristic.uuid)
        //let test = characteristic.uuid
        
        switch characteristic.uuid {
        case gunCamCBUUID:
        //case test:
            // must be CBUUID of the specific service
            print(characteristic.value ?? "no value")
            print(characteristic.value?.base64EncodedString() as Any)
            // send the value to play sound
            message = characteristic.value?.first ?? 7
            print(" ----------- going to received")
            print("received message : ", message)
            received()
        default:
            print("Unhandled Characteristic UUID: \n", characteristic.uuid)
        }
    }
    
    
    
    func disconnect () {
        centralManager?.cancelPeripheralConnection(gunCamPeripheral!)
    }
    
}
 
 */

