//
//  PermutationExtension.swift
//  BootlegPokemon
//
//  Created by Mahasvan Mohan on 07/01/26.
//

import Foundation

extension Collection {
    func permutations() -> [[Element]] {
        var scratch = Array(self) // Create a mutable copy for in-place swaps
        var result: [[Element]] = []
        let n = scratch.count

        // Heap's algorithm implementation
        func heapPermutation(_ k: Int) {
            if k == 1 {
                result.append(scratch)
                return
            }

            for i in 0..<k {
                heapPermutation(k - 1)
                // Swap elements based on parity of k
                if k % 2 == 1 {
                    scratch.swapAt(0, k - 1)
                } else {
                    scratch.swapAt(i, k - 1)
                }
            }
        }

        heapPermutation(n)
        return result
    }
}
