//
//  Calculator.swift
//  TypeCalculator
//
//  Created by Aimun Khan on 12/3/17.
//  Copyright © 2017 Aimun Khan. All rights reserved.
//

import Foundation
import Cocoa

//: Defs of types
let normal = 0
let fire = 1
let water = 2
let electric = 3
let grass = 4
let ice = 5
let fighting = 6
let poison = 7
let ground = 8
let flying = 9
let psychic = 10
let bug = 11
let rock = 12
let ghost = 13
let dragon = 14
let dark = 15
let steel = 16
let fairy = 17
let none = 18

var types = ["normal": 0, "fire": 1, "water": 2, "electric": 3, "grass": 4, "ice": 5, "fighting": 6, "poison": 7, "ground": 8, "flying": 9, "psychic": 10, "bug": 11, "rock": 12, "ghost": 13, "dragon": 14, "dark": 15, "steel": 16, "fairy": 17, "none": 18]
var invertTypes = [0: "normal", 1: "fire", 2: "water", 3: "electric", 4: "grass", 5: "ice", 6: "fighting", 7: "poison", 8: "ground", 9: "flying", 10: "psychic", 11: "bug", 12: "rock", 13: "ghost", 14: "dragon", 15: "dark", 16: "steel", 17: "fairy", 18: "none"]

let typeMatrix: [[Double]] = [
    [1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1], //normal
    [1, 0.5, 2, 1, 0.5, 0.5, 1, 1, 2, 1, 1, 0.5, 2, 1, 1, 1, 0.5, 0.5], //fire
    [1, 0.5, 0.5, 2, 2, 0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.5, 1], //water
    [1, 1, 1, 0.5, 1, 1, 1, 1, 2, 0.5, 1, 1, 1, 1, 1, 1, 0.5, 1], //electric
    [1, 2, 0.5, 0.5, 0.5, 2, 1, 2, 0.5, 2, 1, 2, 1, 1, 1, 1, 1, 1], //grass
    [1, 2, 1, 1, 1, 0.5, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1], //ice
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0.5, 0.5, 1, 1, 0.5, 1, 2], //fighting
    [1, 1, 1, 1, 0.5, 1, 0.5, 0.5, 2, 1, 2, 0.5, 1, 1, 1, 1, 1, 0.5], //poison
    [1, 1, 2, 0, 2, 2, 1, 0.5, 1, 1, 1, 1, 0.5, 1, 1, 1, 1, 1], //ground
    [1, 1, 1, 2, 0.5, 2, 0.5, 1, 0, 1, 1, 0.5, 2, 1, 1, 1, 1, 1], //flying
    [1, 1, 1, 1, 1, 1, 0.5, 1, 1, 1, 0.5, 2, 1, 2, 1, 2, 1, 1], //psychic
    [1, 2, 1, 1, 0.5, 1, 0.5, 1, 0.5, 2, 1, 1, 2, 1, 1, 1, 1, 1], //bug
    [0.5, 0.5, 2, 1, 2, 1, 2, 0.5, 2, 0.5, 1, 1, 1, 1, 1, 1, 2, 1], //rock
    [0, 1, 1, 1, 1, 1, 0, 0.5, 1, 1, 1, 0.5, 1, 2, 1, 2, 1, 1], //ghost
    [1, 0.5, 0.5, 0.5, 0.5, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2], //dragon
    [1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 0, 2, 1, 0.5, 1, 0.5, 1, 2], //dark
    [0.5, 2, 1, 1, 0.5, 0.5, 2, 0, 2, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 1, 0.5, 0.5], //steel
    [1, 1, 1, 1, 1, 1, 0.5, 2, 1, 1, 1, 0.5, 1, 1, 0, 0.5, 2, 1], //fairy
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] //none
]

//: Functions
// Description: Calculates how effective a move is based on typing
// Inputs: Move type, pokemon type(s)
// Outputs: Multiplier
func damageCalc(offense: String, defense1: String = "none", defense2: String = "none") -> Double {
    var output: Double = 1
    let offenseType = types[offense]
    let defense1Type = types[defense1]
    let defense2Type = types[defense2]
    if (offenseType != nil) && (defense1Type != nil) && (defense2Type != nil){
        output *= typeMatrix[defense1Type!][offenseType!]
        output *= typeMatrix[defense2Type!][offenseType!]
    }
    else {
        return -1
    }
    return output
}

// Description: Returns list of types that correspond to a type and matchup
// Inputs: pokemon type(s)
// Outputs: array of types is [matchup] to
func checkMatchup(type1: String = "none", type2: String = "none", modifier: Double) -> [String]{
    var output = [String]()
    for (type, _) in types{//
        if(type != "none"){
            if(damageCalc(offense: type, defense1: type1, defense2: type2) ==  modifier){
                output.append(type)
            }
        }
        
    }
    return output
}

func setToString(set: [String]) -> String{
    var output: String = ""
    for element in set{
        output += element + "\n"
    }
    return output
}
