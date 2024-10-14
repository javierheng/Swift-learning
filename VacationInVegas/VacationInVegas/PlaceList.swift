//
//  ContentView.swift
//  VacationInVegas
//
//  Created by javier on 2024/10/13.
//

import SwiftUI
import SwiftData
import MapKit

struct PlaceList: View {
    //按名字排序
    @Query(sort: \Place.name) private var places: [Place]
    
    //用于判断是否点击了按钮
    @State private var showImages = false
    @State private var searchText = ""
    @State private var filterByInterested = false
    
    private var predicate: Predicate<Place> {
        #Predicate<Place> {
            if !searchText.isEmpty && filterByInterested {
                $0.name.localizedStandardContains(searchText) && $0.interested
            } else if !searchText.isEmpty {
                $0.name.localizedStandardContains(searchText)
            } else if filterByInterested {
                $0.interested
            } else {
                true
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List((try? places.filter(predicate)) ?? places) { place in
                NavigationLink(value: place) {
                    HStack{
                        place.image
                            .resizable()        //调整大小
                            .scaledToFit()      //匹配尺寸
                            .clipShape(.rect(cornerRadius: 7))
                            .frame(width: 100, height: 100)
                        
                        Text(place.name)
                        
                        Spacer()
                        
                        if place.interested{
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                                .padding()
                        }
                    }
                }
            }
            //标题
            .navigationTitle("Places")
            //搜索栏
            .searchable(text: $searchText, prompt: "search")
            //做搜索后的弹出动画
            .animation(.default, value: searchText)
            .navigationDestination(for: Place.self) {place in
                MapView(place: place, position: .camera(MapCamera(
                    centerCoordinate: place.location, distance: 1000,
                    heading: 250,
                    pitch: 80
                )))
            }
            //添加工具栏
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Show Images", systemImage: "photo") {
                        showImages.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Filter", systemImage: filterByInterested ? "star.fill" : "star") {
                        //加动画
                        withAnimation {
                            filterByInterested.toggle()
                        }
                    }
                    .tint(filterByInterested ? .yellow : .blue)
                }
            }
            .sheet(isPresented: $showImages) {
                Scrolling()
            }
        }
    }
}

#Preview {
    PlaceList()
        .modelContainer(Place.preview)
}
