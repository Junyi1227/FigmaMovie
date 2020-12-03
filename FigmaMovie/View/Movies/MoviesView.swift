//
//  MoviesView.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/3.
//

import SwiftUI

struct MoviesView: View {
    @State var menuIndex: Int = 0
    @State var searchText = ""
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding(16)
            TopMenu(selection: $menuIndex, titles: ["Near You", "Coming Soon", "Permiers"])
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    ScrollViewReader(content: { proxy in
                        HStack {
                            ForEach(0 ..< 3) { num in
                                MovieGridView(endpoint: .popular)
                                    // this case geometry also can use .global
                                    .frame(width: geometry.frame(in: .named("base scrollview")).size.width)
                                    .id(num)
                            }
                        }.onChange(of: menuIndex) { _ in
                            print(menuIndex)
                            withAnimation {
                                proxy.scrollTo(menuIndex)
                            }
                        }
                    })
                }.coordinateSpace(name: "base scrollview")
            }
//            Button(action: {
//                //TODO:怎麼回傳回去啊@@
//                menuIndex = 2
//            }, label: {
//                Text("Test")
//            })

        }.background(Color.black)
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
