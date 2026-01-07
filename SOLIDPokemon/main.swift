//
//  main.swift
//  BootlegPokemon
//
//  Created by Mahasvan Mohan on 07/01/26.
//

import Foundation

// Factory mapping from type name to a creator closure that takes a level and returns a concrete Pokemon
let mapping: [String: (Int) -> any PokemonInterface] = [
    "Fire": { level in FirePokemon(xp: 0, level: level) },
    "Water": { level in WaterPokemon(xp: 0, level: level) },
    "Psychic": { level in PsychicPokemon(xp: 0, level: level) },
    "Fighting": { level in FightingPokemon(xp: 0, level: level) },
    "Electric": { level in ElectricPokemon(xp: 0, level: level) },
    "Ghost": { level in GhostPokemon(xp: 0, level: level) },
    "Grass": { level in GrassPokemon(xp: 0, level: level) }
]

func parseInput(_ text: String) -> [Breeder] {
    let lines = text.split(separator: "\n").map(String.init).filter { !$0.isEmpty }
    var breeders: [Breeder] = []

    for line in lines {
        let pokemonSpecs = line.split(separator: ";").map(String.init)
        var mons: [any PokemonInterface] = []
        for spec in pokemonSpecs {
            let parts = spec.split(separator: "#").map(String.init)
            guard parts.count == 2 else { continue }
            let type = parts[0]
            let levelString = parts[1]
            guard let level = Int(levelString), let factory = mapping[type] else { continue }
            let mon = factory(level)
            mons.append(mon)
        }
        breeders.append(Breeder(pokemon: mons))
    }
    return breeders
}

let text = """
Fire#10;Water#20;Fighting#6;Psychic#10;Electric#12
Water#10;Fighting#10;Psychic#10;Fire#12;Grass#2
"""

let breeders = parseInput(text)

let me = breeders[0]
let opp = breeders[1]

do {
    try me.optimize(for: opp)
    print(me.pokemon.map { $0.repr() } )
    let res = me.challenge(opponent: opp, verbose: true)
    print("Battles won after optimization: \(res)")
} catch {
    print("Could not optimize breeder: \(error)")
}
