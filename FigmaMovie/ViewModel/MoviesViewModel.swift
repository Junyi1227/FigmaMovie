//
//  MoviesViewModel.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/27.
//

import Alamofire
import Foundation

enum MenuInfo:String,CaseIterable,Identifiable {
    case popular
    case topRated
    case upcoming
    case nowPlaying

    var id: String {
        return self.rawValue
    }

    func title() -> String {
        switch self {
            case .popular:    return "Popular"
            case .topRated:   return "Top rated"
            case .upcoming:   return "Upcoming"
            case .nowPlaying: return "Now Playing"
        }
    }

    func endpoint() -> APIService.Endpoint {
        switch self {
            case .popular:    return .popular
            case .topRated:   return .topRated
            case .upcoming:   return .upcoming
            case .nowPlaying: return .nowPlaying
        }
    }
}

class MoviesViewModel: ObservableObject {
    @Published var menuIndex: Int = 0

    let menuInfos: [MenuInfo]
    @Published var movies: [PaginatedResponse<Movie>]

    init(menuInfos: [MenuInfo]) {
        self.menuInfos = menuInfos
        let model = PaginatedResponse<Movie>(totalResults: nil, page: nil, totalPages: nil, results: [Movie]())
        movies = [PaginatedResponse<Movie>](repeating: model, count: self.menuInfos.count)
        for (index,menu) in self.menuInfos.enumerated() {
            fetchList(endpoint: menu.endpoint(),index: index)
        }

    }

    func fetchList(endpoint: APIService.Endpoint,index:Int) {
        APIService.shared.GET(endpoint: endpoint) { (model: PaginatedResponse<Movie>) in
            self.movies[index] = model
            print(model)
        } failure: { error in
            print(error.debugDescription)
        }
    }
}

//class MoviesViewModel: ObservableObject {
//    let endpoint: APIService.Endpoint
//    @Published var movies: PaginatedResponse<Movie>?
//
//    init(endpoint: APIService.Endpoint) {
//        self.endpoint = endpoint
//        fetchList(endpoint: endpoint)
//    }
//
//    func fetchList(endpoint: APIService.Endpoint) {
//        APIService.shared.GET(endpoint: endpoint) { (model: PaginatedResponse<Movie>) in
//            self.movies = model
//            print(model)
//        } failure: { error in
//            print(error.debugDescription)
//        }
//    }
//}
