//
//  ViewController.swift
//  tablesFlashCard
//
//  Created by sweety prethish on 6/13/16.
//  Copyright © 2016 myrattles. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

        
    var imageUIList: Array<UIImageView> = []
    var tableCount : Int = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var library = multiplicationTableAPI().library
        tableCount = library.count
        for index in 0..<library.count {
            
            let currentTable = library[index]
            let iconName = currentTable["icon"] as String!
            let icon = UIImage(named: iconName)
            let uiImageView = UIImageView()
            uiImageView.image = icon
            imageUIList.append(uiImageView)
 
        }
        
        //let viewModel = MasterViewModel(index: 0)
        //Image1.image = viewModel.icon
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableCount
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCellContainer
        
        let viewmodel = MasterViewModel(index:indexPath.row)
        
        cell.imageView!.image = viewmodel.icon
        cell.imageView.clipsToBounds = true
        cell.imageView.layer.masksToBounds = true
        //cell.imageView.layer.cornerRadius = cell.imageView.frame.width/2
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
    
        print("View Collection Selected")
        self.performSegueWithIdentifier("showTableSegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        /*
        if segue.identifier == "showTableSegue"
        {
            let detailController = segue.destinationViewController as! TableDisplayViewController
            let currentImage = sender?.view as! UIImageView
            let currentIndex = imageUIList.indexOf(currentImage)
            detailController.CurrentTable = currentIndex!
         }
        */
        if segue.identifier == "showTableSegue"
        {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            let detailController = segue.destinationViewController as! TableDisplayViewController
            detailController.CurrentTable = indexPath.row + 1
            
        
        }

    
    }
    
    @IBAction func onTapImage(sender: AnyObject) {
        
        performSegueWithIdentifier("showTableSegue", sender: sender)
        print("Dont touch me again !!")
    }
   }

