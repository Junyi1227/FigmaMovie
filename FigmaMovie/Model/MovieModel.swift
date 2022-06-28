//
//  MovieModel.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/12/1.
//

import Foundation

// MARK: - Paginated

struct PaginatedResponse<T: Codable>: Codable,Identifiable {
    var id = UUID()
    let totalResults, page, totalPages: Int?
    let results: [T]

    enum CodingKeys: String, CodingKey {
        case totalResults = "total_results"
        case page
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Movie

struct Movie: Codable, Identifiable {
    let originalTitle, posterPath: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let releaseDate, title: String?
    let popularity: Double?
    let adult: Bool?
    let id: Int?
    let backdropPath: String?
    let genreIDS: [Int]?
    let overview: String?
    let originalLanguage: String?

    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case title, popularity, adult, id
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case overview
        case originalLanguage = "original_language"
    }
}
