//
//  Source.swift
//  hwPhotos
//
//  Created by Anthony on 14.02.2023.
//

import Foundation

struct Photo {
    let id: Int
    let imageName: String
}

struct Source {
    static func allPhotos() -> [Photo] {
        [
            .init(id: 0, imageName: "grayscale21"),
            .init(id: 1, imageName: "grayscale01"),
            .init(id: 2, imageName: "grayscale02"),
            .init(id: 3, imageName: "grayscale03"),
            .init(id: 4, imageName: "grayscale04"),
            .init(id: 5, imageName: "grayscale05"),
            .init(id: 6, imageName: "grayscale06"),
            .init(id: 7, imageName: "grayscale07"),
            .init(id: 8, imageName: "grayscale08"),
            .init(id: 9, imageName: "grayscale09"),
            .init(id: 10, imageName: "grayscale10"),
            .init(id: 11, imageName: "grayscale11"),
            .init(id: 12, imageName: "grayscale12"),
            .init(id: 13, imageName: "grayscale13"),
            .init(id: 14, imageName: "grayscale14"),
            .init(id: 15, imageName: "grayscale15"),
            .init(id: 16, imageName: "grayscale16"),
            .init(id: 17, imageName: "grayscale17"),
            .init(id: 18, imageName: "grayscale18"),
            .init(id: 19, imageName: "grayscale19"),
            .init(id: 20, imageName: "grayscale20")
        ]
    }
    
    // имитация загрузки фото в рандомном порядке
    static func randomPhotos(with count: Int) -> [Photo] {
        return (0..<count).map { _ in allPhotos().randomElement()! }
    }
}

struct SectionPhoto {
    let sectionName: String
    var photo: [Photo]
}
