//
//  MoviesViewModel.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/27.
//

import Alamofire
import Foundation

class MoviesViewModel: ObservableObject {
    let endpoint: APIService.Endpoint
    @Published var movies: PaginatedResponse<Movie>?

    init(endpoint: APIService.Endpoint) {
        self.endpoint = endpoint
    }

    func fetchList(endpoint: APIService.Endpoint) {
        APIService.shared.GET(endpoint: endpoint) { (model: PaginatedResponse<Movie>) in
            self.movies = model
            print(model)
        } failure: { error in
            print(error.debugDescription)
        }
    }
}
