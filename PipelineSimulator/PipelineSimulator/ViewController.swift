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

    @IBOutlet weak var advanceClockButton: UIButton!
    
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var instructionSelector: UISegmentedControl!
    
    let instructionSet1 = ["ADD R3, R1, R2", "OR R2, R1, R4", "ADD R4, R1, R4", "ADD R5, R3, R4", "AND R6, R4, R5", "OR R8, R6, R7"]


    var currentInstruction : Int = 0
    var currentSet : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        IF_bg.layer.cornerRadius = 15.0
        ID_bg.layer.cornerRadius = 15.0
        EX_bg.layer.cornerRadius = 15.0
        MEM_bg.layer.cornerRadius = 15.0
        WB_bg.layer.cornerRadius = 15.0
        advanceClockButton.layer.cornerRadius = 15.0
        
        
    }

    @IBAction func advanceClock(sender: AnyObject) {
        
        if(self.currentSet == 0) {
            switch self.currentInstruction {
            case 0:
                NSLog("CASE 0")
                self.IF_instr.text = self.instructionSet1[0]
                break
            case 1:
                NSLog("CASE 1")
                self.IF_instr.text = self.instructionSet1[1]
                self.ID_instr.text = self.instructionSet1[0]
                break
            case 2:
                NSLog("CASE 2")
                self.IF_instr.text = self.instructionSet1[2]
                self.ID_instr.text = self.instructionSet1[1]
                self.EX_instr.text = self.instructionSet1[0]
                break
            case 3:
                NSLog("CASE 3")
                self.IF_instr.text = self.instructionSet1[3]
                self.ID_instr.text = self.instructionSet1[2]
                self.EX_instr.text = self.instructionSet1[1]
                self.MEM_instr.text = self.instructionSet1[0]
                break
            case 4:
                NSLog("CASE 4")
                self.IF_instr.text = self.instructionSet1[4]
                self.ID_instr.text = self.instructionSet1[3]
                self.EX_instr.text = self.instructionSet1[2]
                self.MEM_instr.text = self.instructionSet1[1]
                self.WB_instr.text = self.instructionSet1[0]
                break
            case 5:
                NSLog("CASE 5")
                self.IF_instr.text = self.instructionSet1[5]
                self.ID_instr.text = self.instructionSet1[4]
                self.MEM_instr.text = self.instructionSet1[2]
                self.WB_instr.text = self.instructionSet1[1]
                self.EX_bg.backgroundColor = UIColor.redColor()
                self.EX_instr.text = "STALL"
                break
            case 6:
                NSLog("CASE 6")
                break
            case 7:
                NSLog("CASE 7")
                break
            case 8:
                NSLog("CASE 8")
                break
            case 9:
                NSLog("CASE 9")
                break
            case 10:
                NSLog("CASE 10")
                break
            case 11:
                NSLog("CASE 11")
                break
            case 12:
                NSLog("CASE 12")
                break
            case 13:
                NSLog("CASE 13")
                break
            default:
                NSLog("CASE DEFAULT")
                self.currentInstruction = -1
                break
            }
        } else if(self.currentSet == 1) {
            switch self.currentInstruction {
                default:
                    break
            }
        } else {
            switch self.currentInstruction {
                default:
                    break
            }
        }
        self.currentInstruction++
    }
    
    @IBAction func instructionSetChanged(sender: AnyObject) {
        self.currentInstruction = 0
        self.currentSet = self.instructionSelector.selectedSegmentIndex
    }
}

