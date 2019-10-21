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
        let urlString =  "https://myurl.com"
        
        if let url = URL(string: urlString) {
            do {
                let content = try String(contentsOf: url)
                print("**** content : ", content)
                message = Int(content) ?? 7
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
        secLeft = 600
        print("TIMER SET")
    }
    
    @objc func fire(timer: Timer)
    {
        secLeft -= 1
        fetchAdvice()
        
        if (secLeft <= 0){
            timer.invalidate()
            print("TIMER INVALIDATED")
        }
    }
}
