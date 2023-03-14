//
//  Joke.swift
//  JokeGenerator
//
//  Created by Viktoriya on 14.03.2023.
//

import Foundation

struct Joke: Codable {
    let type: String?
    let setup: String?
    let punchline: String?
    let id: Int?
}
