//
//  Exercise.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import Foundation

struct Exercise: Codable, Identifiable, Hashable{
    let id: String
    let name: String
    let weight: Int
    let sets: String
    let reps: String
    let category: String
}
