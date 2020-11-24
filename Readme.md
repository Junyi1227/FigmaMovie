![Xcode build](https://github.com/Dimillian/MovieSwiftUI/workflows/Xcode%20build/badge.svg?branch=master)

# Important

MovieSwiftUI have been upgraded to the latest SwiftUI features, so you'll need a beta version of Xcode 12 in order to build & run it. 

# MovieSwiftUI

MovieSwiftUI is an application that uses the MovieDB API and is built with SwiftUI. 
It demos some SwiftUI (& Combine) concepts. The goal is to make a real world application using SwiftUI only. It'll be updated with new features as they come to the SwiftUI framework. 

這是我用來練習的APP
主要分為幾個階段
### Part1.以呈現UI為主
### Part2.串接API 將各個畫面連接起來
### Part3.添加動畫
### Part4.優化程式碼

![App Image](images/MovieSwiftUI_promo_new.png?)

## Architecture

MVVM


## 踩到的坑
ScrollView 裡添加 GeometryReader ScrollViewReader 會導致scrollview無法滾動
目前猜測事GeometryReader造成ScrollView無法正常計算ContentView

withAnimation連續呼叫會造成動畫重複
```
ScrollView(.horizontal){
    GeometryReader(){ geometry in
        ScrollViewReader(content: { proxy in
            HStack{
                ForEach(0..<5) {i  in
                    Text("\(i)")
                        .frame(width: 320,height:400)
                        .id(i)
                        .foregroundColor(.white)
                }
            }.onChange(of: menuIndex) { target in
                print(menuIndex)
                withAnimation {
                    proxy.scrollTo(menuIndex)
                }
            }
        })
    }
}

```


## 不太懂的地方
ScrollView  GeometryReader ScrollViewReader 還不太熟
Grid item的部分

## 待辦事項
TopMenu 可再優化
