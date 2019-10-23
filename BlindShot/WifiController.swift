//
//  WifiController.swift
//  BlindShot
//
//  Created by Mariia Turchina on 21/10/2019.
//  Copyright © 2019 Mariia Turchina. All rights reserved.
//

import Foundation

extension ViewController {
    
    func fetchAdvice () {
        //let urlString =  "http://192.168.1.211:8080/blindshot"
        let urlString =  "http://blindshot.local"
        
        if let url = URL(string: urlString) {
            do {
                let content = try String(contentsOf: url)
                print("**** content : ", content)
                
                var contentFirst : Character = "7"
                if (content != ""){
                    contentFirst = strIndex(str: content, index: 0)
                }

                print("**** content first : ", contentFirst)
                
                message = Int(String(contentFirst)) ?? 7
                if ((message < 0) || (message > 7)){
                    message = 7
                }
                
                print("**** message : ", message)
        
                received()
            } catch {
                print("content could not be loaded")
            }
        } else {
            print("no such url")
        }
    }
    
    func setTimer () {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(fire(timer:)), userInfo: nil, repeats: true)
        //secLeft = 600
        print("TIMER SET")
    }
    
    @objc func fire(timer: Timer)
    {
        //secLeft -= 1
        fetchAdvice()
        
        /*if (secLeft <= 0){
            timer.invalidate()
            print("TIMER INVALIDATED")
        }*/
    }
    
    func strIndex (str : String, index : Int) -> Character {
        let i = str.index(str.startIndex, offsetBy: index)
        return str[i]
    }
}
