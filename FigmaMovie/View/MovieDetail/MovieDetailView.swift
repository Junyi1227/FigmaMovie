//
//  MovieDetailView.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/24.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image("xxx")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)

            Group {
                Text("13+")
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)

                Text("Avengers:End Game")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Action,Drama")
                    .foregroundColor(Color(#colorLiteral(red: 0.9990326762, green: 0.1983285844, blue: 0.3980412483, alpha: 1)))
                    .font(.system(size: 12))

                HStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, spacing: 2) {
                    ForEach(1 ..< 6) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor((num < 4) ? Color(#colorLiteral(red: 0.9990326762, green: 0.1983285844, blue: 0.3980412483, alpha: 1)) : Color(.gray))
                            .font(.system(size: 12))
                    }
                    Text("124 REVIEWS")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .padding(.leading, 4)

                }.padding(.bottom, 16)

                Text("Stroyline")
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)

                Text("Stroylinexxxxxtroylinexxxxxtroylinexxxxxtroylinexxxxxtroylinexxxxx")
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)

                HStack {
                    Text("Cast")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)

                    Spacer()

                    Button(action: {}, label: {
                        Text("See All")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    })
                }
            }

            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(80))]) {
                    ForEach(0 ..< 8) { _ in
                        VStack {
                            Image("IPMan")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                            Text("Robert Downey Jr.")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                    }
                }
            }

            Spacer()

            HStack(spacing: 8) {
                Button(action: {}, label: {
                    Spacer()
                    Text("LEAVE A REVIEW")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                })
                    .frame(height: 48)
                    .background(LinearGradient(
                        gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.4588235294, alpha: 1)), Color(#colorLiteral(red: 0.231372549, green: 0.231372549, blue: 0.3019607843, alpha: 1))]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .cornerRadius(15)

                Button(action: {}, label: {
                    Spacer()
                    Text("BOOK YOUR TICKTET")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                })
                    .frame(height: 48)
                    .background(LinearGradient(gradient:
                        Gradient(colors: [Color(#colorLiteral(red: 0.5019607843, green: 0.2117647059, blue: 0.9058823529, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.2, blue: 0.3960784314, alpha: 1))]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing))
                    .cornerRadius(15)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
        .background(Color(#colorLiteral(red: 0.1056719795, green: 0.1047194526, blue: 0.1585861742, alpha: 1)))
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
