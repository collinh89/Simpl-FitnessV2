//
//  Workout.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import Foundation

struct Workout: Codable, Identifiable, Hashable{
    let id: String
    let name: String
    let createdDate: TimeInterval
}
