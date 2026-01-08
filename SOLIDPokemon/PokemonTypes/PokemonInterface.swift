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
    
    init(xp: Int, level: Int);
}

extension PokemonInterface {
    // This battle logic will be common across all pokemon types.
    func battle(opponent: PokemonInterface) -> BattleResult {
        return Self.battleEngine.battle(self, vs: opponent)
    }
    
    func repr() -> String {
        return "\(type(of: self)) (Level \(level))"
    }
}

extension PokemonInterface {
    static var LEVEL_THRESHOLD: Int { 100 }
    static var BATTLE_XP: Int { 10 }
    static var battleEngine: BattleEngine.Type { StandardBattleEngine.self }
}

