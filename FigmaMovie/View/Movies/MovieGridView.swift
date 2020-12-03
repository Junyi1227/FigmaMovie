//
//  MovieGridView.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/3.
//

import SwiftUI

struct MovieGridView: View {
    @ObservedObject var moviesVM: MoviesViewModel

    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]

    init(endpoint: APIService.Endpoint) {
        moviesVM = MoviesViewModel(endpoint: endpoint)
    }

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: threeColumnGrid) {
                ForEach(moviesVM.movies?.results ?? []) { movie in
                    MovieCardView(movie: movie)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct MovieGridView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGridView(endpoint: .popular)
    }
}

struct MovieCardView: View {
    let movie: Movie
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                ZStack(alignment: .top) {
                    Image("IPMan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                    Rectangle()
                        .foregroundColor(.clear)
                        .background(LinearGradient(gradient:
                            Gradient(colors: [
                                Color(.sRGB, red: 25.0 / 255, green: 25.0 / 255, blue: 38.0 / 255, opacity: 0.0001),
                                Color(.sRGB, red: 25.0 / 255, green: 25.0 / 255, blue: 38.0 / 255, opacity: 1)
                            ]), startPoint: .top, endPoint: .bottom))
                }
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("13+")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(4)
                        }
                        .background(Color.black)
                        .cornerRadius(5.0)

                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color(#colorLiteral(red: 0.9990326762, green: 0.1983285844, blue: 0.3980412483, alpha: 1)))
                        })
                    }
                    Spacer()

                    Text("Action,Drama")
                        .foregroundColor(.red)
                        .font(.system(size: 8))

                    HStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, spacing: 2) {
                        ForEach(1 ..< 6) { num in
                            Image(systemName: "star.fill")
                                .foregroundColor((num < 4) ? Color(#colorLiteral(red: 0.9990326762, green: 0.1983285844, blue: 0.3980412483, alpha: 1)) : Color(.gray))
                                .font(.system(size: 8))
                        }
                        Text("124 REVIEWS")
                            .foregroundColor(.gray)
                            .font(.system(size: 8))
                            .fontWeight(.bold)
                            .padding(.leading, 4)

                    }.padding(.vertical, 4)
                }
                .fixedSize(horizontal: false, vertical: false)
                .padding(8)
            }
            VStack(alignment: .leading, spacing: 0) {
                Text(movie.title ?? "")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 12))

                Text("137MIN")
                    .foregroundColor(.gray)
                    .font(.custom("Gilroy", size: 8))

            }.padding(8)
        }
        .background(Color(#colorLiteral(red: 0.1095940247, green: 0.1086468026, blue: 0.1625134349, alpha: 1)))
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(#colorLiteral(red: 0.2703185678, green: 0.2691814005, blue: 0.3396263719, alpha: 1)),
                        lineWidth: 2)
        )
    }
}

// struct MovieCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieCardView()
//    }
// }
