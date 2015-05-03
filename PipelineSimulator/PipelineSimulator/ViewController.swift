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

    @IBOutlet weak var instructionLabel: UILabel!
    
    let instructionSet1 = ["LW R8, 4(R3)", "SUB R2, R4, R5", "AND R9, R10, R11", "OR R16, R17, R18", "ADD R13, R14, R0"]
    let instructionSet2 = ["LW R8, 4(R3)", "SUB R2, R4, R5", "AND R9, R10, R11", "OR R16, R17, R18", "ADD R13, R14, R0"]
    let instructionSet3 = ["LW R8, 4(R3)", "SUB R2, R4, R5", "AND R9, R10, R11", "OR R16, R17, R18", "ADD R13, R14, R0"]

    var currentInstruction : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func advanceClock(sender: AnyObject) {
    }
    
    @IBAction func instructionSetChanged(sender: AnyObject) {
    }


}

