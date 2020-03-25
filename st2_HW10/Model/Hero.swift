//
//  Hero.swift
//  st2_HW10
//
//  Created by qwerty on 24.03.2020.
//  Copyright © 2020 Dmitry Shuvalov. All rights reserved.
//

struct Hero: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let origin: Location?
    let location: Location?
    let image: String?
}

struct Location: Decodable {
    let name: String?
    let url: String?
}

struct Heroes: Decodable {
    let results: [Hero]?
}
