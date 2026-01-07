//
//  PokemonTypes.swift
//  BootlegPokemon
//
//  Created by Assistant on 07/01/26.
//

import Foundation

struct FirePokemon: PokemonInterface {
    let defeats: [PokemonInterface.Type] = [GrassPokemon.self, GhostPokemon.self]
    var xp: Int
    var level: Int

    init(xp: Int = 0, level: Int = 1) {
        self.xp = xp
        self.level = level
    }
}

struct WaterPokemon: PokemonInterface {
    let defeats: [PokemonInterface.Type] = [FirePokemon.self]
    var xp: Int
    var level: Int

    init(xp: Int = 0, level: Int = 1) {
        self.xp = xp
        self.level = level
    }
}

struct GrassPokemon: PokemonInterface {
    let defeats: [PokemonInterface.Type] = [ElectricPokemon.self, FightingPokemon.self]
    var xp: Int
    var level: Int

    init(xp: Int = 0, level: Int = 1) {
        self.xp = xp
        self.level = level
    }
}

struct ElectricPokemon: PokemonInterface {
    let defeats: [PokemonInterface.Type] = [WaterPokemon.self]
    var xp: Int
    var level: Int

    init(xp: Int = 0, level: Int = 1) {
        self.xp = xp
        self.level = level
    }
}

struct PsychicPokemon: PokemonInterface {
    let defeats: [PokemonInterface.Type] = [GhostPokemon.self]
    var xp: Int
    var level: Int

    init(xp: Int = 0, level: Int = 1) {
        self.xp = xp
        self.level = level
    }
}

struct GhostPokemon: PokemonInterface {
    let defeats: [PokemonInterface.Type] = [FightingPokemon.self, FirePokemon.self, ElectricPokemon.self]
    var xp: Int
    var level: Int

    init(xp: Int = 0, level: Int = 1) {
        self.xp = xp
        self.level = level
    }
}

struct FightingPokemon: PokemonInterface {
    let defeats: [PokemonInterface.Type] = [ElectricPokemon.self]
    var xp: Int
    var level: Int

    init(xp: Int = 0, level: Int = 1) {
        self.xp = xp
        self.level = level
    }
}
