//
//  MovieGridView.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/3.
//

import SwiftUI

struct FavouriteView: View {
    private var threeColumnGrid = [GridItem(.flexible())]

    var body: some View {
        NavigationView{
            ScrollView(.vertical) {
                LazyVGrid(columns: threeColumnGrid) {
                    ForEach(0..<5){i in
                        FavouriteCardView().id("xxxx"+String(i))
                    }
                }
                .padding(.horizontal,16)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Favourite Movies")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

//struct FavouriteView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouriteView()
//    }
//}



struct FavouriteCardView: View {
    var body: some View {
        HStack(alignment: .top){
            GeometryReader(content: { geometry in

                ZStack(alignment:.topLeading){
                    VStack(alignment:.leading){
                        ZStack(alignment: .topLeading){
                            Image("IPMan")
                                .resizable()
                                .aspectRatio(contentMode: .fit)

                            Rectangle()
                                .foregroundColor(.clear)
                                .background(LinearGradient(gradient: Gradient(colors: [
                                                                                Color(#colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.1490196078, alpha: 0)), Color(#colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.1490196078, alpha: 1))]), startPoint: .top, endPoint: .bottom))

                        }
                        
                        VStack(alignment:.leading){
                            Text("Action,Drama")
                                .foregroundColor(.red)
                                .font(.system(size: 8))
                                
                            HStack(alignment: .center, spacing: 2){
                                ForEach(1..<6) { i in
                                    Image(systemName:"star.fill")
                                        .foregroundColor((i<4) ? Color(#colorLiteral(red: 0.9990326762, green: 0.1983285844, blue: 0.3980412483, alpha: 1)) : Color(.gray))
                                        .font(.system(size: 8))
                                }
                                Text("124 REVIEWS")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 8))
                                    .fontWeight(.bold)
                                    .padding(.leading,4)

                            }
                        }
                        .padding(8)
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        HStack{
                            VStack(alignment:.leading, spacing: 0){
                                Text("13+")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding(4)
                            }
                            .background(Color.black)
                            .cornerRadius(5.0)
                            
                            Spacer()
                            Button(action: {
                                
                            }){
                                Image(systemName:"heart.fill")
                                    .foregroundColor(Color(#colorLiteral(red: 0.9990326762, green: 0.1983285844, blue: 0.3980412483, alpha: 1)))
                            }
                        }
                        Spacer()
                        
                    }
                    .fixedSize(horizontal: false, vertical: false)
                    .padding(8)
                }
                .frame(width:geometry.frame(in:.global).size.width/2)
                
                VStack(alignment: .leading, spacing: 0){
                    Text("IP Man 4")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 12))

                    Text("137MIN")
                        .foregroundColor(.gray)
                        .font(.custom("Gilroy", size: 8))
                        .padding(.bottom,16)
                    
                    Text("image named 'xxx' found in asset catalog for /Users/jimmy/Library/Developer/CoreSimulator/Devices/08286A50-7069-4A8D-A3AD-0A47A7124B26/data/Containers/Bundle/Application/8A1D3A76-F5B5-40E7-BD14-25D2B79FF681/FigmaMovie.app")
                        .foregroundColor(Color(#colorLiteral(red: 0.721439898, green: 0.7213187814, blue: 0.7378022075, alpha: 1)))
                        .font(.system(size: 8))
                    
                    Spacer()
                    
                    Button(action:{}){
                        Spacer()
                        Text("BOOK YOUR TICKTET")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .frame(height:24)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5019607843, green: 0.2117647059, blue: 0.9058823529, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.2, blue: 0.3960784314, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(15)
                }.padding(8)
                .frame(width:geometry.frame(in:.global).size.width/2)
                .offset(x:geometry.frame(in:.global).size.width/2)

            })
        
        }
        .frame(width: 350, height: 290)
        .background(Color(#colorLiteral(red: 0.1095940247, green: 0.1086468026, blue: 0.1625134349, alpha: 1)))
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(#colorLiteral(red: 0.2703185678, green: 0.2691814005, blue: 0.3396263719, alpha: 1)),lineWidth: 2)
        )
    }
}

struct FavouriteCardView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteCardView()
    }
}
