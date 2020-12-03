//
//  ContentView.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/3.
//

import SwiftUI

struct ContentView: View {
    @State var index: Int = 0
    var body: some View {
        Form {
            Section(header: Text("Menu")) {
                Menu("Actions") {
                    Button("Set TextEditor text to   'magic'") {
//                        someText = "magic"
                    }

                    Button("Turn first picker green") {
//                        color = Color.green
                    }
                }
            }
        }
    }
}

public struct GridView: View {
    private var threeColumnGrid = [GridItem(.flexible())]
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: threeColumnGrid) {
                ForEach(0 ..< 5) { num in
                    ZStack {
                        Rectangle()
                        Text("id:\(num)")
                            .foregroundColor(.white)
                    }
                    .frame(height: 400)
                    .id(num)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
