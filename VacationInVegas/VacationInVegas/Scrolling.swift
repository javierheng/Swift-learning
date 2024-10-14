//
//  ScrollImage.swift
//  VacationInVegas
//
//  Created by javier on 2024/10/14.
//

import SwiftUI

struct Scrolling: View {
    var body: some View {
        ScrollView {
            VStack {
                ScrollImage(image: .wechatIMG212)
                
                ScrollImage(image: .wechatIMG214)
                
                ScrollImage(image: .wechatIMG215)
                
                ScrollImage(image: .wechatIMG213)
            }
            .padding()
        }
    }
}

#Preview {
    Scrolling()
}
