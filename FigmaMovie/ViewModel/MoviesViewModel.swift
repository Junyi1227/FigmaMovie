//
//  MoviesViewModel.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/27.
//

import Foundation
import Alamofire

struct PaginatedResponse<T: Codable>: Codable {
    let page: Int?
    let total_results: Int?
    let total_pages: Int?
    let results: [T]
}

// MARK: - Movie
struct Movie:Codable,Identifiable {
    let originalTitle, posterPath: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let releaseDate, title: String?
    let release_date: String?
//    var releaseDate: Date? {
//        return release_date != nil ? Movie.dateFormatter.date(from: release_date!) : Date()
//    }
//
//    static let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyy-MM-dd"
//        return formatter
//    }()

    let popularity: Double?
    let adult: Bool?
    let id: Int?
    let backdropPath: String?
    let genreIDS: [Int]?
    let overview, originalLanguage: String?
}

class MoviesViewModel:ObservableObject {
    let endpoint:APIService.Endpoint
    @Published var movies : PaginatedResponse<Movie>? = nil
    
    init(endpoint:APIService.Endpoint) {
        self.endpoint = endpoint
    }
    func fetchList(endpoint:APIService.Endpoint) {
        APIService.shared.GET(endpoint: endpoint) { (model:PaginatedResponse<Movie>) in
            self.movies = model
            print(model)
        } failure: { (error) in
            print(error.debugDescription)
        }
    }
}
