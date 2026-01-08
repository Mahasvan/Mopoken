//
//  BattleEngine.swift
//  SOLIDPokemon
//
//  Created by Mahasvan Mohan on 08/01/26.
//

import Foundation


protocol BattleEngine {
    static func battle(_ poke: PokemonInterface, vs opponent: PokemonInterface) -> BattleResult
}

class StandardBattleEngine: BattleEngine {
    static let LEVEL_MULTIPLIER = 2
    
    static func battle(_ poke: PokemonInterface, vs opponent: PokemonInterface) -> BattleResult {
        
        let selfDefeatsOpponent = poke.defeats.contains { $0 == type(of: opponent) }
        let opponentDefeatsSelf = opponent.defeats.contains { $0 == type(of: poke) }
            
        if (!selfDefeatsOpponent && !opponentDefeatsSelf) {
            if (poke.level > opponent.level) {
                return .win
            } else if (poke.level < opponent.level) {
                return .lose
            } else {
                return .draw
            }
        }
        
        var q: Int? = nil
        var r: Int? = nil
        
        if (selfDefeatsOpponent) {
            q = opponent.level / poke.level
            r = opponent.level % poke.level
            
            if q! > Self.LEVEL_MULTIPLIER {
                return .lose
            }
            if q! < Self.LEVEL_MULTIPLIER {
                return .win
            }
            // if q == Self.LEVEL_MULTIPLIER, the case is handled outside the if (selfDefeatsOpponent) statements.
        } else {
            // the opponent can defeat our pokemon
            q = poke.level / opponent.level
            r = poke.level % opponent.level
            
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
}
