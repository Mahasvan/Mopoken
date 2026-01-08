//
//  PokemonFactory.swift
//  SOLIDPokemon
//
//  Created by Mahasvan Mohan on 08/01/26.
//

import Foundation

class PokemonFactory {
    
    static let mapping: [String: any PokemonInterface.Type] = [
        "Fire": FirePokemon.self,
        "Water": WaterPokemon.self,
        "Psychic": PsychicPokemon.self,
        "Fighting": FightingPokemon.self,
        "Electric": ElectricPokemon.self,
        "Ghost": GhostPokemon.self,
        "Grass": GrassPokemon.self
    ]
    
    static func getInstance(for type: String, _ level: Int) -> PokemonInterface? {
        let t = self.mapping[type]
        if (t == nil) {
            return nil
        }
        return t!.init(xp: 0, level: level)
    }
}
