//
//  ViewController.swift
//  99 Red Balloons
//
//  Created by Marc on 09/10/2014.
//  Copyright (c) 2014 Account Hero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var currentIndex = 0
    var currentNumber = 0
    var balloonsArray:[Balloons] = []
    var currentBalloonsItem = Balloons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBalloons(99)
        
        currentBalloonsItem = balloonsArray[currentIndex]
    
        self.imageView.image = currentBalloonsItem.image
        self.textLabel.text = "There are \(currentBalloonsItem.numberOfBalloons) balloons."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        var randomNumber = 0
        
        do {
        randomNumber = Int(arc4random_uniform(UInt32(100)))
        } while randomNumber == currentIndex || balloonsArray[randomNumber].image == balloonsArray[currentIndex].image
        
        currentIndex = randomNumber
        
        currentBalloonsItem = balloonsArray[currentIndex]
        
        self.imageView.image = currentBalloonsItem.image
        self.textLabel.text = "There are \(currentBalloonsItem.numberOfBalloons) balloons."
    }
    
    // Helper Methods
    
    func createBalloons(numberOfBalloons: Int) {
        
        var randomNumber = 0
        
        for var i = 0; i < (numberOfBalloons + 1); i++ {
            
            var balloonsItem = Balloons()
            
            if i == 0 {
                balloonsItem.numberOfBalloons = i
                balloonsItem.image = UIImage(named: "BerlinTVTower.jpg")
            }
            else {
                
                var nextBalloons = Balloons()
                var randomImage = UIImage(named: "")
                
                do {
                    randomNumber = Int(arc4random_uniform(UInt32(4)))
                } while randomNumber == currentNumber
                
                currentNumber = randomNumber
                
                switch randomNumber {
                case 0:
                    randomImage = UIImage(named: "RedBalloon1.jpg")
                case 1:
                    randomImage = UIImage(named: "RedBalloon2.jpg")
                case 2:
                    randomImage = UIImage(named: "RedBalloon3.jpg")
                case 3:
                    randomImage = UIImage(named: "RedBalloon4.jpg")
                default:
                    randomImage = UIImage(named: "BerlinTVTower.jpg")
                }
                
                balloonsItem.numberOfBalloons = i
                balloonsItem.image = randomImage
            }
            
            balloonsArray.append(balloonsItem)
            
        }
        
    }

}

