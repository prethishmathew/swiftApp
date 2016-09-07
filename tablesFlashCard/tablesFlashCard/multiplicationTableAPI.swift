//
//  minaViewIimageList.swift
//  tablesFlashCard
//
//  Created by sweety prethish on 6/13/16.
//  Copyright © 2016 myrattles. All rights reserved.
//

import Foundation

struct multiplicationTableAPI {
    
    
    let library = [
        ["title" : "1 Table", "icon" : "One-t.pdf", "largeIcon":"Image1_Large.pdf", "description" : "Learn your ones table", "CurrentTable" : "1" ],
        ["title" : "2 Table", "icon" : "Two-t.pdf", "largeIcon":"Image2_Large.pdf", "description" : "Learn your twos table", "CurrentTable" : "2" ],
        ["title" : "2 Table", "icon" : "Three-t.pdf", "largeIcon":"Image2_Large.pdf", "description" : "Learn your twos table", "CurrentTable" : "3" ],
        ["title" : "2 Table", "icon" : "Four-t.pdf", "largeIcon":"Image2_Large.pdf", "description" : "Learn your twos table", "CurrentTable" : "4" ],
        ["title" : "2 Table", "icon" : "Five-t.pdf", "largeIcon":"Image2_Large.pdf", "description" : "Learn your twos table", "CurrentTable" : "5" ],
        ["title" : "2 Table", "icon" : "Six-t.pdf", "largeIcon":"Image2_Large.pdf", "description" : "Learn your twos table", "CurrentTable" : "6" ],
        ["title" : "7 Times Table", "icon" : "Image7.pdf", "largeIcon":"Image7_Large.pdf", "description" : "Learn your twos table", "CurrentTable" : "7" ],
        ["title" : "8 Times Table", "icon" : "Image8.pdf", "largeIcon":"Image8_Large.pdf", "description" : "Learn your twos table", "CurrentTable" : "8" ],
        ["title" : "9 Times Table", "icon" : "Image9.pdf", "largeIcon":"Image9_Large.pdf", "description" : "Learn your twos table", "CurrentTable" : "9" ],
         ["title" : "10 Times Table", "icon" : "Image10.pdf", "largeIcon":"Image10_Large.pdf", "description" : "Learn your twos table", "CurrentTable" : "10" ]
        
    ]
    
    func getCurrentTabeFromIcon(iconName: String) -> Int?
    {
        for code in library {
            if code["icon"]! == iconName
            {
                let curTab = code["CurrentTable"]!
                return Int(curTab)
            }
        }
    
        return nil
    }
}


