//
//  ViewController.swift
//  NationGuess
//
//  Created by Jacob Brooks on 7/6/15.
//  Copyright (c) 2015 Jacob Brooks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var flag: UIImageView!
    
    @IBOutlet var country: UIImageView!
    
    @IBOutlet var answer: UITextField!
    
    @IBOutlet var score: UILabel!
    
    @IBOutlet var outcome: UILabel!
    
    @IBOutlet var startimg: UIButton!
    
    @IBOutlet var fate: UIImageView!
    
    @IBOutlet var resetimg: UIButton!
    
    @IBOutlet var enterbutton: UIButton!
    
    @IBOutlet var question: UILabel!
    
    @IBOutlet var itwas: UILabel!
    
    @IBOutlet var slab: UILabel!
    
    var num: Int!
    
    var points = 0
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.answer.resignFirstResponder()
    }
    

    
    @IBAction func reset(sender: UIButton) {
        points = 0
        startimg.hidden = false
        beginning()

    }
    
    @IBAction func enter(sender: UIButton) {
    
        
        self.answer.resignFirstResponder()
        
        fate.hidden = false
        
        if names[num]==answer.text{
            ++points
            fate.image = UIImage(named: "check")
            itwas.hidden = true
        }
        
        else{
            --points
            fate.image = UIImage(named: "x")
            itwas.text = "It was \(names[num])"
            itwas.hidden = false
        }
        
        score.text = String(points)
        
        if points < 0{
            outcome.text = "You Lose!"
            outcome.textColor = UIColor.redColor()
            outcome.hidden = false
            endGame()
        }
        
        if points == 10{
            outcome.text = "You Win!"
            outcome.textColor = UIColor.greenColor()
            outcome.hidden = false
            endGame()
        }
        
        changeImage()
        
        
        
    }
    
    func endGame(){
        resetimg.hidden = false
        answer.hidden = true
        enterbutton.hidden = true
        question.hidden = true
        country.hidden = true
        
    }
    
    func startGame(){
        
        score.text = String(points)
        answer.hidden = false
        enterbutton.hidden = false
        question.hidden = false
        country.hidden = false
        score.hidden = false
        slab.hidden = false
        
    }
    
    func beginning(){
        
        resetimg.hidden = true
        country.hidden = true
        slab.hidden = true
        score.hidden = true
        question.hidden = true
        itwas.hidden = true
        outcome.hidden = true
        answer.hidden = true
        fate.hidden = true
        enterbutton.hidden = true
    }
    
    
    @IBAction func start(sender: UIButton) {
        startimg.hidden = true
        changeImage()
        startGame()

        
    }
    
    func changeImage(){
        num = Int(arc4random_uniform(89))
        self.country.image = UIImage(named: String(num))
        answer.text = ""
        
    }
    
    
    var names = ["Poland", "India", "France", "South Africa", "United Kingdom", "Israel", "Russia", "Brazil", "Egypt", "Ukraine", "Germany", "Greece", "Kenya", "Japan", "Mexico", "Nigeria", "Spain", "Sweden", "United States", "Canada", "Argentina", "Chile", "China", "Denmark", "Iraq", "Norway", "Mongolia", "Italy", "Sudan", "Ireland", "Libya", "Latvia", "Afghanistan", "Algeria", "Australia", "Austria", "Belgium", "Botswana", "Chad", "Colombia", "Croatia", "Cuba", "Czech Republic", "Congo", "Dominican Republic", "Estonia", "Yemen", "Uzbekistan", "Hungary", "Iceland", "Jamaica", "Jordan", "Netherlands", "North Korea", "Pakistan", "Romania", "Saudi Arabia", "Finland", "Syria", "Tunisia", "Venezuela", "Slovakia", "Albania", "Indonesia", "Uganda", "Ecuador", "Bosnia", "New Zealand", "Vietnam", "Philippines", "Kazakhstan", "Lithuania", "Nicaragua", "Sri Lanka", "Turkey", "Nepal", "Serbia", "Georgia", "Greenland", "Kuwait", "Lebanon", "Macedonia", "Madagascar", "Turkmenistan", "United Arab Emirates", "Portugal", "Zimbabwe", "Belarus", "Bulgaria"]
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

