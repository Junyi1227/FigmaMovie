//
//  SearchView.swift
//  FigmaMovie
//
//  Created by Junyi Wang on 2020/11/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    var body: some View {
        HStack {
            HStack {
                Image("location")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)

                // TODO: SwiftUI textfield not support placeholder color
                // It must custom.
                TextField("Search ...", text: $text)
                    .background(Color.clear)
                    .onTapGesture {
                        self.isEditing = true
                    }
                if isEditing {
                    Button(action: {
                        self.text = ""
                        UIApplication.shared.sendAction(
                            #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil
                        )
                    }, label: {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                    })
                }
            }
            .padding(8)
            .padding(.horizontal, 16)
            .cornerRadius(8)

            Image("search")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("aaaa"))
    }
}
