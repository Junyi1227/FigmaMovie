//
//  TopMenu.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/3.
//

import SwiftUI
//TODO:未來改成可以左右滑動的menu/固定寬的menu 參數可自訂
struct TopMenu: View {
    @State var selectIndex:Int = 0
    @Binding var selection:Int
//    {
//        didSet {
//            selectIndex = selection
//        }
//    }
    
    var titles:[String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Spacer()
            HStack(spacing:0){
                ForEach(titles,id:\.self) { title in
                    Button(action: {
                        self.selectIndex = titles.firstIndex(of: title) ?? 0
                        self.selection = self.selectIndex
                    }){
                        Spacer()
                        Text(title)
                            .bold()
                            .foregroundColor(self.selectIndex == titles.firstIndex(of: title) ? .white : .gray)

                        Spacer()
                    }
                }
            }
            Spacer()
            //TODO: 為何無法置底
            GeometryReader(content: { geometry in
                ZStack(alignment: .leading){
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("LinearPurpleColor"), Color("LinearPinkColor")]), startPoint: .leading, endPoint: .trailing))
                        .frame(width:geometry.size.width/CGFloat(titles.count), height:2)
                        .offset(x: (geometry.size.width/CGFloat(self.titles.count))*CGFloat(selectIndex), y: 0)
                        .animation(.default)
                    
                }
            }).fixedSize(horizontal: false, vertical: true)
        }.background(Color(.black))
        .fixedSize(horizontal: false, vertical: true)
    }
}

//struct TopMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMenu(titles: ["hello","world"], selection: <#Binding<Int>#>)
//    }
//}
