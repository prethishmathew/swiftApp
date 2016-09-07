//
//  TableGenerator.swift
//  tablesFlashCard
//
//  Created by sweety prethish on 6/19/16.
//  Copyright © 2016 myrattles. All rights reserved.
//

import Foundation


class TableGenerator {
    
    
    let multiplierApp: [Int] = [1,4,8,4,2,1,6,8,6,4,6,1,8,6,2,8,2,4,2,6,1,11,4,8,11,6,2,4,9,2,9,8,9,4,6,2,7,11,7,4,9,11,8,2,7,3,4,3,9,3,11,7,2,3,6,9,4,7,12,7,12,9,3,5,8,5,6]

    var CurrentPointer: Int = -1
    var CurrentTable: Int = 1
    
    func getNext () -> Int {
        
        CurrentPointer += 1
        if CurrentPointer >= multiplierApp.count
        {
           CurrentPointer = multiplierApp.count - 1
        }
        return getCurrent()
    }
    
    func getPrev () -> Int {
        if CurrentPointer <= 0
        {
           CurrentPointer = 1
        }
        CurrentPointer -= 1
        return getCurrent()
        
    }
    
    func getCurrent() -> Int {
        
        switch(CurrentPointer) {
        case _ where CurrentPointer<0  :
            CurrentPointer = 0
            break;
        case _ where CurrentPointer >= self.multiplierApp.count  :
            CurrentPointer = multiplierApp.count - 1
            break;
        default :
            break
        }
        
        
        return multiplierApp[CurrentPointer]
    }
    
}