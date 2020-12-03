//
//  HomeView.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/24.
//

import SwiftUI

struct HomeView: View {
    init() {
        UITabBar.appearance().isTranslucent = false

        UITabBar.appearance().barTintColor = UIColor(.black)
//                Color(#colorLiteral(red: 0.09782768041, green: 0.09686375409, blue: 0.1507310271, alpha: 1))
    }

    var body: some View {
        TabView {
            MoviesView().tabItem {
                VStack {
                    Image("MOVIES")
                    Text("MOVIES")
                        .padding(.top, -4)
                }
            }
            .tag(0)

            MoviesView().tabItem {
                VStack {
                    Image("Tickets")
                    Text("Tickets")
                        .padding(.top, -4)
                }
            }
            .tag(1)

            VStack { Text("xxx") }.tabItem {
                VStack {
                    Image("CINEMAS")
                    Text("CINEMAS")
                        .padding(.top, -4)
                }
            }
            .tag(2)

            VStack { Text("xxx") }.tabItem {
                VStack {
                    Image("FAVOURITE")
                    Text("FAVOURITE")
                        .padding(.top, -4)
                }
            }
            .tag(3)

            VStack { Text("xxx") }.tabItem {
                VStack {
                    Image("PROFILE")
                    Text("PROFILE")
                        .padding(.top, -4)
                }
            }
            .tag(4)
        }
        .accentColor(Color(#colorLiteral(red: 0.9078335166, green: 0.1932446063, blue: 0.3721014857, alpha: 1)))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
