//
//  ViewController.swift
//  TypeCalculator
//
//  Created by Aimun Khan on 11/29/17.
//  Copyright © 2017 Aimun Khan. All rights reserved.
//

import Cocoa
//import Calculator

class ViewController: NSViewController {
    // Runs the call to the fuction
    var type1: String = "none"
    var type2: String = "none"
    @IBOutlet var type1list: NSPopUpButton!
    @IBOutlet var type2list: NSPopUpButton!
    
    // Add the types to the lists
    //type1list.insertItem(withTitle: "Normal", at: 0)

    // Text to output to console
    @IBOutlet weak var weakto: NSTextField!
    @IBOutlet weak var weakto4: NSTextField!
    @IBOutlet weak var resto: NSTextField!
    @IBOutlet weak var resto4: NSTextField!
    @IBOutlet weak var immto: NSTextField!
    
    // Controls what the text changes to
    @IBAction func type1(_ sender: NSPopUpButton) {
        type1 = sender.titleOfSelectedItem!
        updateOutput()
    }
    
    @IBAction func type2(_ sender: NSPopUpButton) {
        type2 = sender.titleOfSelectedItem!
        updateOutput()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func updateOutput(){
        var output: String = ""
        let weaknesses = checkMatchup(type1: type1, type2: type2, modifier: 2)
        for element in weaknesses{
            output += element
            output += "\n"
        }
        weakto.stringValue = output
        
        output = ""
        let weaknesses4 = checkMatchup(type1: type1, type2: type2, modifier: 4)
        for element in weaknesses4{
            output += element
            output += "\n"
        }
        weakto4.stringValue = output
        
        output = ""
        let resistances = checkMatchup(type1: type1, type2: type2, modifier: 0.5)
        for element in resistances{
            output += element
            output += "\n"
        }
        resto.stringValue = output
        
        output = ""
        let resistances4 = checkMatchup(type1: type1, type2: type2, modifier: 0.25)
        for element in resistances4{
            output += element
            output += "\n"
        }
        resto4.stringValue = output
        
        output = ""
        let immunities = checkMatchup(type1: type1, type2: type2, modifier: 0)
        for element in immunities{
            output += element
            output += "\n"
        }
        immto.stringValue = output
    }

}
