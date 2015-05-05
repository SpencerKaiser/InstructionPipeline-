//
//  ViewController.swift
//  PipelineSimulator
//
//  Created by Spencer Kaiser on 5/3/15.
//  Copyright (c) 2015 CSE 7381. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var IF_instr: UILabel!
    @IBOutlet weak var ID_instr: UILabel!
    @IBOutlet weak var EX_instr: UILabel!
    @IBOutlet weak var MEM_instr: UILabel!
    @IBOutlet weak var WB_instr: UILabel!
    
    @IBOutlet weak var IF_bg: UIView!
    @IBOutlet weak var ID_bg: UIView!
    @IBOutlet weak var EX_bg: UIView!
    @IBOutlet weak var MEM_bg: UIView!
    @IBOutlet weak var WB_bg: UIView!

    @IBOutlet weak var instructionsTextView: UITextView!
    
    @IBOutlet weak var advanceClockButton: UIButton!
    
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var instructionSelector: UISegmentedControl!
    
    
    let instructionSet1 = ["ADD R3, R1, R2", "OR  R2, R1, R4", "ADD R4, R1, R4", "ADD R5, R3, R4", "AND R6, R4, R5", "OR  R8, R6, R7"]
    
    let instructionSet2 = ["LW  R8,  4(R3)", "SUB R2,  R4,  R5", "AND R9,  R2,  R4", "OR  R10, R2,  R7", "ADD R3,  R10, R8"]
    
    let instructionSet3 = ["OR  R1, R2, R3", "AND R4, R5, R6", "ADD R7, R1, R4", "SW R7, 0(R8)"]
    
    
    var currentInstruction : Int = 0
    var currentSet : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ROUND CORNERS OF UI ELEMENTS
        IF_bg.layer.cornerRadius = 15.0
        ID_bg.layer.cornerRadius = 15.0
        EX_bg.layer.cornerRadius = 15.0
        MEM_bg.layer.cornerRadius = 15.0
        WB_bg.layer.cornerRadius = 15.0
        advanceClockButton.layer.cornerRadius = 15.0
        
        //CLEAR LABELS
        clearLabels()
        
        //UPDATE INSTRUCTIONS
        updateInstructions()

    }
    
    func clearLabels() {
        animateObject("", label: self.IF_instr, view: self.IF_bg)
        animateObject("", label: self.ID_instr, view: self.ID_bg)
        animateObject("", label: self.EX_instr, view: self.EX_bg)
        animateObject("", label: self.MEM_instr, view: self.MEM_bg)
        animateObject("", label: self.WB_instr, view: self.WB_bg)
    }

    @IBAction func advanceClock(sender: AnyObject) {
        
        if(self.currentSet == 0) {
            switch self.currentInstruction {
            case 0:
                NSLog("CASE 0")
                animateObject(self.instructionSet1[0], label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                break
            case 1:
                NSLog("CASE 1")
                animateObject(self.instructionSet1[1], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet1[0], label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                break
            case 2:
                NSLog("CASE 2")
                animateObject(self.instructionSet1[2], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet1[1], label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet1[0], label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                break
            case 3:
                NSLog("CASE 3")
                animateObject(self.instructionSet1[3], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet1[2], label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet1[1], label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet1[0], label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                break
            case 4:
                NSLog("CASE 4")
                animateObject(self.instructionSet1[4], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet1[3], label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet1[2], label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet1[1], label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet1[0], label: self.WB_instr, view: self.WB_bg)
                break
            case 5:
                NSLog("CASE 5")
                animateObject(self.instructionSet1[4], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet1[3], label: self.ID_instr, view: self.ID_bg)
                animateObject("NOP (Stall)", label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet1[2], label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet1[1], label: self.WB_instr, view: self.WB_bg)
                break
            case 6:
                NSLog("CASE 6")
                animateObject(self.instructionSet1[5], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet1[4], label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet1[3], label: self.EX_instr, view: self.EX_bg)
                animateObject("NOP (Stall)", label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet1[2], label: self.WB_instr, view: self.WB_bg)
                break
            case 7:
                NSLog("CASE 7")
                animateObject(self.instructionSet1[5], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet1[4], label: self.ID_instr, view: self.ID_bg)
                animateObject("NOP (Stall)", label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet1[3], label: self.MEM_instr, view: self.MEM_bg)
                animateObject("NOP (Stall)", label: self.WB_instr, view: self.WB_bg)
                break
            case 8:
                NSLog("CASE 8")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet1[5], label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet1[4], label: self.EX_instr, view: self.EX_bg)
                animateObject("NOP (Stall)", label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet1[3], label: self.WB_instr, view: self.WB_bg)
                break
            case 9:
                NSLog("CASE 9")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet1[5], label: self.ID_instr, view: self.ID_bg)
                animateObject("NOP (Stall)", label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet1[4], label: self.MEM_instr, view: self.MEM_bg)
                animateObject("NOP (Stall)", label: self.WB_instr, view: self.WB_bg)
                break
            case 10:
                NSLog("CASE 10")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet1[5], label: self.EX_instr, view: self.EX_bg)
                animateObject("NOP (Stall)", label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet1[4], label: self.WB_instr, view: self.WB_bg)
                break
            case 11:
                NSLog("CASE 11")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet1[5], label: self.MEM_instr, view: self.MEM_bg)
                animateObject("NOP (Stall)", label: self.WB_instr, view: self.WB_bg)
                break
            case 12:
                NSLog("CASE 12")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet1[5], label: self.WB_instr, view: self.WB_bg)
                break
            default:
                NSLog("CASE DEFAULT")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                self.currentInstruction = -1                                //RESET
                break
            }
        } else if(self.currentSet == 1) {
            switch self.currentInstruction {
            case 0:
                NSLog("CASE 0")
                animateObject(self.instructionSet2[0], label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                break
            case 1:
                NSLog("CASE 1")
                animateObject(self.instructionSet2[1], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet2[0], label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                break
            case 2:
                NSLog("CASE 2")
                animateObject(self.instructionSet2[2], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet2[1], label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet2[0], label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                break
            case 3:
                NSLog("CASE 3")
                animateObject(self.instructionSet2[3], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet2[2], label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet2[1], label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet2[0], label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                break
            case 4:
                NSLog("CASE 4")
                animateObject(self.instructionSet2[3], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet2[2], label: self.ID_instr, view: self.ID_bg)
                animateObject("NOP (Stall)", label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet2[1], label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet2[0], label: self.WB_instr, view: self.WB_bg)
                break
            case 5:
                NSLog("CASE 5")
                animateObject(self.instructionSet2[4], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet2[3], label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet2[2], label: self.EX_instr, view: self.EX_bg)
                animateObject("NOP (Stall)", label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet2[1], label: self.WB_instr, view: self.WB_bg)
                break
            case 6:
                NSLog("CASE 6")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet2[4], label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet2[3], label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet2[2], label: self.MEM_instr, view: self.MEM_bg)
                animateObject("NOP (Stall)", label: self.WB_instr, view: self.WB_bg)
                break
            case 7:
                NSLog("CASE 7")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet2[4], label: self.ID_instr, view: self.ID_bg)
                animateObject("NOP (Stall)", label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet2[3], label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet2[2], label: self.WB_instr, view: self.WB_bg)
                break
            case 8:
                NSLog("CASE 8")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet2[4], label: self.EX_instr, view: self.EX_bg)
                animateObject("NOP (Stall)", label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet2[3], label: self.WB_instr, view: self.WB_bg)
                break
            case 9:
                NSLog("CASE 9")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet2[4], label: self.MEM_instr, view: self.MEM_bg)
                animateObject("NOP (Stall)", label: self.WB_instr, view: self.WB_bg)
                break
            case 10:
                NSLog("CASE 10")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet2[4], label: self.WB_instr, view: self.WB_bg)
                break
            default:
                NSLog("CASE DEFAULT")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                self.currentInstruction = -1                                //RESET
                break
            }
        } else {
            switch self.currentInstruction {
            case 0:
                NSLog("CASE 0")
                animateObject(self.instructionSet3[0], label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                break
            case 1:
                NSLog("CASE 1")
                animateObject(self.instructionSet3[1], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet3[0], label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                break
            case 2:
                NSLog("CASE 2")
                animateObject(self.instructionSet3[2], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet3[1], label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet3[0], label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                break
            case 3:
                NSLog("CASE 3")
                animateObject(self.instructionSet3[3], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet3[2], label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet3[1], label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet3[0], label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                break
            case 4:
                NSLog("CASE 4")
                animateObject(self.instructionSet3[3], label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet3[2], label: self.ID_instr, view: self.ID_bg)
                animateObject("NOP (Stall)", label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet3[1], label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet3[0], label: self.WB_instr, view: self.WB_bg)
                break
            case 5:
                NSLog("CASE 5")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet3[3], label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet3[2], label: self.EX_instr, view: self.EX_bg)
                animateObject("NOP (Stall)", label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet3[1], label: self.WB_instr, view: self.WB_bg)
                break
            case 6:
                NSLog("CASE 6")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject(self.instructionSet3[3], label: self.ID_instr, view: self.ID_bg)
                animateObject("NOP (Stall)", label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet3[2], label: self.MEM_instr, view: self.MEM_bg)
                animateObject("NOP (Stall)", label: self.WB_instr, view: self.WB_bg)
                break
            case 7:
                NSLog("CASE 7")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject(self.instructionSet3[3], label: self.EX_instr, view: self.EX_bg)
                animateObject("NOP (Stall)", label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet3[2], label: self.WB_instr, view: self.WB_bg)
                break
            case 8:
                NSLog("CASE 8")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject(self.instructionSet3[3], label: self.MEM_instr, view: self.MEM_bg)
                animateObject("NOP (Stall)", label: self.WB_instr, view: self.WB_bg)
                break
            case 9:
                NSLog("CASE 9")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject(self.instructionSet3[3], label: self.WB_instr, view: self.WB_bg)
                break
            default:
                NSLog("CASE DEFAULT")
                animateObject("", label: self.IF_instr, view: self.IF_bg)
                animateObject("", label: self.ID_instr, view: self.ID_bg)
                animateObject("", label: self.EX_instr, view: self.EX_bg)
                animateObject("", label: self.MEM_instr, view: self.MEM_bg)
                animateObject("", label: self.WB_instr, view: self.WB_bg)
                self.currentInstruction = -1                                //RESET
                break
            }
        }
        self.currentInstruction++
    }
    
    @IBAction func instructionSetChanged(sender: AnyObject) {
        clearLabels()
        self.currentInstruction = 0
        self.currentSet = self.instructionSelector.selectedSegmentIndex
        updateInstructions()
    }
    
    func updateInstructions() {
        var instructionString = ""

        switch self.currentSet {
        case 0:
            for instruction in self.instructionSet1 {
                instructionString = instructionString + instruction + "\n"
            }
            break
        case 1:
            for instruction in self.instructionSet2 {
                instructionString = instructionString + instruction + "\n"
            }
            break
        case 2:
            for instruction in self.instructionSet3 {
                instructionString = instructionString + instruction + "\n"
            }
            break
        default:
            break
        }
        
        self.instructionsTextView.text = instructionString
        self.instructionsTextView.font = UIFont(name: "Courier", size:14)
    }
    
    
    func animateObject(text: String, label: UILabel, view: UIView) {
        var color = UIColor.cyanColor()
        
        if text == "NOP (Stall)" {
            color = UIColor.redColor()
        }
        
        UIView.animateWithDuration(
            Double(0.5),
            animations: {
                label.alpha = 0.0
            },
            completion: { finished in
                if(finished) {
                    label.text = text;
                    UIView.animateWithDuration(Double(0.75), animations: { () -> Void in
                        view.backgroundColor = color
                        label.alpha = 1.0
                    })
                }
        })
    }
    
    
}

