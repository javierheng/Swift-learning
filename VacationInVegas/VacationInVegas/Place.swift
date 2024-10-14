//
//  Place.swift
//  VacationInVegas
//
//  Created by javier on 2024/10/14.
//

//这一部分是学习如何创建"预览"

import SwiftData
import SwiftUI
import MapKit

@Model
class Place {
    //先创建预览界面需要用到的属性
    #Unique<Place>([\.name, \.latitude, \.longitude])       //第一种让某数据值唯一的方式，这三个数据的组合唯一
    
    @Attribute(.unique) var name: String                    //第二种让某数据值唯一的方式
    var latitude: Double
    var longitude: Double
    var interested: Bool
    
    //MapKit中的东西
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var image: Image {                                      //通过name属性定义image
        Image(name)
    }
    
    //初始化
    init(name: String, latitude: Double, longitude: Double, interested: Bool) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.interested = interested
    }
    
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Place.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        for place in previewPlaces {
            container.mainContext.insert(place)
        }
        
        return container
    }
    
    
    static var previewPlaces: [Place] {
        [
            Place(name: "WechatIMG212", latitude: 20.027212, longitude: 110.210957, interested: false),
            Place(name: "WechatIMG213", latitude: 20.046661, longitude: 110.316404, interested: true),
            Place(name: "WechatIMG214", latitude: 20.027212, longitude: 110.210957, interested: true),
            Place(name: "WechatIMG215", latitude: 20.027212, longitude: 110.210957, interested: true)
        ]
    }
}



