//
//  APIService.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/27.
//

import Alamofire
import Foundation

public struct APIService {

    let baseURL = URL(string: "https://api.themoviedb.org/3")!
    let apiKey = "1d9b898a212ea52e283351e521e17871"

    struct API_Url {
        static let DmgUrl = "https://dmgapi.dmg.tv"

        static let qaList = DmgUrl + "/api/App/FAQ/List"
        static let messageList = DmgUrl + "/api/App/Message/List"
        static let unRead = DmgUrl + "/api/App/Message/UnRead"
        static let setRead = DmgUrl + "/api/App/Message/SetRead"

        static let carrier = "https://www.dafeng.tv/pay_method/CarrierApply.php"
    }

    public static let shared = APIService()
    let decoder = JSONDecoder()

    public enum APIError: Error {
        case noResponse
        case jsonDecodingError(error: Error)
        case networkError(error: Error)
    }

    public enum Endpoint {
        case popular, topRated, upcoming, nowPlaying, trending
        case movieDetail(movie: Int), recommended(movie: Int), similar(movie: Int), videos(movie: Int)
        case credits(movie: Int), review(movie: Int)
        case searchMovie, searchKeyword, searchPerson
        case popularPersons
        case personDetail(person: Int)
        case personMovieCredits(person: Int)
        case personImages(person: Int)
        case genres
        case discover

        func path() -> String {
            switch self {
            case .popular:
                return "movie/popular"
            case .popularPersons:
                return "person/popular"
            case .topRated:
                return "movie/top_rated"
            case .upcoming:
                return "movie/upcoming"
            case .nowPlaying:
                return "movie/now_playing"
            case .trending:
                return "trending/movie/day"
            case let .movieDetail(movie):
                return "movie/\(String(movie))"
            case let .videos(movie):
                return "movie/\(String(movie))/videos"
            case let .personDetail(person):
                return "person/\(String(person))"
            case let .credits(movie):
                return "movie/\(String(movie))/credits"
            case let .review(movie):
                return "movie/\(String(movie))/reviews"
            case let .recommended(movie):
                return "movie/\(String(movie))/recommendations"
            case let .similar(movie):
                return "movie/\(String(movie))/similar"
            case let .personMovieCredits(person):
                return "person/\(person)/movie_credits"
            case let .personImages(person):
                return "person/\(person)/images"
            case .searchMovie:
                return "search/movie"
            case .searchKeyword:
                return "search/keyword"
            case .searchPerson:
                return "search/person"
            case .genres:
                return "genre/movie/list"
            case .discover:
                return "discover/movie"
            }
        }
    }

    public func GET<T: Codable>(endpoint: Endpoint,
                                params: [String: String] = [String: String](),
                                success: @escaping (_ response: T) -> Void,
                                failure: @escaping (_ error: Error?) -> Void) {
        var queryItems = ["api_key": apiKey,
                          "language": Locale.preferredLanguages[0]]
        queryItems = queryItems.merging(params) { $1 }

        AF.request(baseURL.appendingPathComponent(endpoint.path()), method: .get, parameters: queryItems)
            .responseDecodable(of: T.self) { response in

                if let result = response.value {
                    success(result)
                    return
                }

                failure(response.error)
            }
    }
}
