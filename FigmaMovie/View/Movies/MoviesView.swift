//
//  MoviesView.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/3.
//

import SwiftUI
struct MoviesView: View {
    @ObservedObject var moviesVM: MoviesViewModel

    @State var menuIndex: Int = 0
    @State var searchText = ""
    let menuInfos : [MenuInfo] = [.popular,.topRated,.upcoming,.nowPlaying]

    init() {
        self.moviesVM = MoviesViewModel(menuInfos: menuInfos)
    }

    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding(16)
            TopMenu(movieVm:moviesVM, titles:menuInfos.map{ $0.title() })
//            TabView(selection: $moviesVM.menuIndex) {
//                ForEach(0..<self.moviesVM.movies.count) { index in
//                    MovieGridView(moviePage:self.moviesVM.movies[index])
//                        .tag(index)
//                }
//            }
//            .tabViewStyle(PageTabViewStyle())
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    ScrollViewReader(content: { proxy in
                        HStack {
                            ForEach(self.moviesVM.movies) { movie in
                                MovieGridView(moviePage:movie)
                                    .id(movie.id)
//                                    // this case geometry also can use .global
                                    .frame(width: geometry.frame(in: .named("base scrollview")).size.width)
                            }
                        }.onChange(of: moviesVM.menuIndex) { _ in
                            print(moviesVM.menuIndex)
                            withAnimation {
                                proxy.scrollTo(self.moviesVM.movies[moviesVM.menuIndex].id)
                            }
                        }
                        .onChange(of: proxy.x, perform: { value in
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
                        })
                    })
                }
                .coordinateSpace(name: "base scrollview")
            }
            Button(action: {
                //TODO:怎麼回傳回去啊@@
                menuIndex = 1
            }, label: {
                Text("Test")
            })

        }.background(Color.black)
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
