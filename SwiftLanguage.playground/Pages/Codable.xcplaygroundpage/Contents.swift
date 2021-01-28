//: [Previous](@previous)

import Foundation

struct Experience: Codable {
    var graduation: String
    var languages: [String]

    enum CodingKeys: String, CodingKey {
        case graduation = "graduation_key"
        case languages = "languages_key"
    }
}

struct Developer: Codable {
    var age: Int
    var name: String
    var experience: Experience

    enum CodingKeys: String, CodingKey {
        case age = "graduation_key"
        case name = "languages_key"
        case experience = "experience_key"
    }
}

let developer = Developer(age: 22, name: "João da Silva", experience: Experience(graduation: "Some Course", languages: ["Swift", "Objective C"]))

do {
    let jsonData = try JSONEncoder().encode(developer)

    print(String(data: jsonData, encoding: .utf8) ?? "")
}


do {
    let data = #"""
                {
                    "age": 34,
                    "name": "Valentina da Silva",
                    "experience": {
                        "graduation": "Awesome Course",

                        "unknownProperty": 10,

                        "languages": [
                            "Swift"
                        ]
                    }
                }
                """#.data(using: .utf8)!

    let decodedDeveloper = try JSONDecoder().decode(Developer.self, from: data)
    print(decodedDeveloper.name)
    print(decodedDeveloper.experience.graduation)
}

//: ## FIM 😎
