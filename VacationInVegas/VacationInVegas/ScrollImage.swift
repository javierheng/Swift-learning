//
//  ScrollImage.swift
//  VacationInVegas
//
//  Created by javier on 2024/10/14.
//

import SwiftUI

//这里学习如何做滚动图像
struct ScrollImage: View {
    let image: ImageResource
    
    var body: some View {
        Image(image)
            .resizable()                                //调整尺寸
            .scaledToFit()                              //匹配屏幕大小
            .clipShape(.rect(cornerRadius: 15))         //圆角
            .scrollTransition { content, phase in       //翻滚过渡（这里写了要做到的效果）
                content
                    .scaleEffect(phase.isIdentity ? 1 : 0.5)
                    .opacity(phase.isIdentity ? 1 : 0.5)
            }
    }
}

#Preview {
    ScrollImage(image: .wechatIMG212)                   //示例
}
