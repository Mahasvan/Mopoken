//
//  AbstractPokemon.swift
//  BootlegPokemon
//
//  Created by Mahasvan Mohan on 07/01/26.
//

import Foundation

enum BattleResult {
    case win
    case lose
    case draw
}

protocol PokemonInterface {
    var defeats: [PokemonInterface.Type] { get }
    var xp: Int { get set }
    var level: Int { get set }
    
    static var LEVEL_THRESHOLD: Int { get }
    static var BATTLE_XP: Int { get }
    static var LEVEL_MULTIPLIER: Int { get }
}

extension PokemonInterface {
    // This battle logic will be common across all pokemon types.
    func battle(opponent: PokemonInterface) -> BattleResult {
        let selfType = type(of: self)
        let oppType = type(of: opponent)
        
        let selfDefeatsOpponent = self.defeats.contains { $0 == oppType }
        let opponentDefeatsSelf = opponent.defeats.contains { $0 == selfType }
            
        if (!selfDefeatsOpponent && !opponentDefeatsSelf) {
            if (self.level > opponent.level) {
                return .win
            } else if (self.level < opponent.level) {
                return .lose
            } else {
                return .draw
            }
        }
        
        var q: Int? = nil
        var r: Int? = nil
        
        if (selfDefeatsOpponent) {
            q = opponent.level / level
            r = opponent.level % level
            
            if q! > Self.LEVEL_MULTIPLIER {
                return .lose
            }
            if q! < Self.LEVEL_MULTIPLIER {
                return .win
            }
            // if q == Self.LEVEL_MULTIPLIER, the case is handled outside the if (selfDefeatsOpponent) statements.
        } else {
            // the opponent can defeat our pokemon
            q = self.level / opponent.level
            r = self.level % opponent.level
            
            if q! > Self.LEVEL_MULTIPLIER {
                return .win
            }
            if q! < Self.LEVEL_MULTIPLIER {
                return .lose
            }
            
            // if q == Self.LEVEL_MULTIPLIER, the case is handled outside the if statement.
        }
        
        // here, q == Self.LEVEL_MULTIPLIER
        if (r! > 0) {
            return .win
        }
        else {
            return .draw
        }
    }
    
    func repr() -> String {
        return "\(type(of: self)) (Level \(level))"
    }
}

extension PokemonInterface {
    static var LEVEL_THRESHOLD: Int { 100 }
    static var BATTLE_XP: Int { 10 }
    static var LEVEL_MULTIPLIER: Int { 2 }
}
