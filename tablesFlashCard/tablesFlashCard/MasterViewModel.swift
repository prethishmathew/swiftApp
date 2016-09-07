//
//  multiplicationLibrary.swift
//  tablesFlashCard
//
//  Created by sweety prethish on 6/14/16.
//  Copyright © 2016 myrattles. All rights reserved.
//

import Foundation
import UIKit
struct MasterViewModel {
    var icon : UIImage?
    var description : String?
    var title:String?
    var largeIcon : UIImage?
    var currentTableNumber : Int?
    init (index : Int){
        
        let tableList = multiplicationTableAPI().library
        let currentTable = tableList[index]
        
        let iconName = currentTable["icon"] as String!
        icon = UIImage(named: iconName)
        
        
        description = currentTable["description"] as String!
        title = currentTable["title"] as String!
        currentTableNumber = Int(currentTable["CurrentTable"] as String!)
        let largeIconName = currentTable["largeIcon"] as String!
        largeIcon = UIImage(named: largeIconName)
    
    }
    
    
}