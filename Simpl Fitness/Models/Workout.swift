//
//  Workout.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import Foundation

struct Workout: Codable, Identifiable{
    let id: String
    let name: String
    let category: String
    let exercises: [Exercise]
    let createdDate: TimeInterval
}
