//
//  Breeder.swift
//  BootlegPokemon
//
//  Created by Mahasvan Mohan on 07/01/26.
//

import Foundation

class Breeder {
    var pokemon: [PokemonInterface] = []
    
    init(pokemon: [PokemonInterface]) {
        self.pokemon = pokemon
    }
    
    private func checkConstraints() -> Bool {
        return true
    }
    
    func challenge(opponent: Breeder, verbose: Bool = false) -> Int {
        // returns number of battles won
        var res = 0
        for i in 0...self.pokemon.count-1 {
            
            let outcome = self.pokemon[i].battle(opponent: opponent.pokemon[i])
            switch outcome {
            case .win:
                if verbose {
                    print("\(self.pokemon[i].repr()) won against \(opponent.pokemon[i].repr())")
                }
                res += 1
            case .lose:
                if verbose {
                    print("\(self.pokemon[i].repr()) lost against \(opponent.pokemon[i].repr())")
                }
            case .draw:
                if verbose {
                    print("\(self.pokemon[i].repr()) draw against \(opponent.pokemon[i].repr())")
                }
            }
        }
        
        return res
    }
    
    func optimize(for opponent: Breeder) throws -> Void {
        let allPermutations = self.pokemon.permutations()
        var maxWins = 0
        for permutation in allPermutations {
            self.pokemon = permutation
            let r = challenge(opponent: opponent)
            maxWins = max(r, maxWins)
        }
        if maxWins < 3 {
            throw NSError(domain: "Breeder", code: 1, userInfo: [NSLocalizedDescriptionKey: "Could not find a winning permutation"])
        }
        print("Optimized - Max wins = \(maxWins)")
    }
}
