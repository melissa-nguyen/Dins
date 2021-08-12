//
//  BusinessDetail.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/9/21.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    @State private var showDirections = false
    
    let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        
        // MARK: - TINDER CARD STACK
        GeometryReader { geometry in
            
            VStack (alignment: .leading) {
  
                // Image
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height  * 0.65) // 3
                    .clipped()
                
                // HStack with Business Name, Address, Reviews & Phone
//                HStack {
//                    VStack (alignment: .leading, spacing: 6) {
//                        // Name, Address & Rating
//                        Text(business.name ?? "")
//                            .font(.title)
//                            .bold()
//                        Text(business.location?.address1 ?? "")
//                            .font(.subheadline)
//                            .bold()
//                        VStack (alignment: .leading) {
//                            Image("regular_\(business.rating ?? 0)")
//                            Text("\(business.reviewCount ?? 0) Reviews")
//                                .font(.caption)
//                        }
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(business.name ?? "")
                            .font(.title)
                            .bold()
                        Text(business.location?.address1 ?? "")
                            .font(.subheadline)
                            .bold()
                        Image("regular_\(business.rating ?? 0)")
//                        Text("\(business.reviewCount ?? 0) Reviews")
//                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    Image(systemName: "info.circle")
                        .foregroundColor(.gray)
                }.padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        
        }
        .frame(height: 500)
        .padding()
        
        
        
        
       // MARK: - WORKING BUSINESS DETAIL VIEW
        
//        VStack (alignment: .leading) {
//
//            VStack (alignment: .leading, spacing: 0) {
//                GeometryReader() { geometry in
//                    // Business image
//                    let uiImage = UIImage(data: business.imageData ?? Data())
//                    Image(uiImage: uiImage ?? UIImage())
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: geometry.size.width, height: geometry.size.height)
//                        .clipped()
//                }
//                .ignoresSafeArea(.all, edges: .top)
//
//                // Business Open/Closed Indicator
//                ZStack (alignment: .leading) {
//                    Rectangle()
//                        .frame(height: 36)
//                        // foreground color is dependent on whether the biz is open or closed
//                        .foregroundColor(business.isClosed! ? .gray : .blue)
//
//                    Text(!business.isClosed! ? "Closed" : "Open")
//                        .foregroundColor(.white)
//                        .bold()
//                        .padding(.leading)
//                }
//            }
//
//
//            Group {
//
//                BusinessTitle(business: business)
//                    .padding()
//
//                Divider()
//
//                // Phone
//                HStack {
//                    Text("Phone:")
//                        .bold()
//                    Text(business.displayPhone ?? "")
//                    Spacer()
//                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
//
//                }
//                .padding()
//
//                Divider()
//
//                // Reviews
//                HStack {
//                    Text("Reviews:")
//                        .bold()
//                    Text(String(business.reviewCount ?? 0))
//                    Spacer()
//                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
//
//                }
//                .padding()
//
//                Divider()
//
//                // Website
//                HStack {
//                    Text("Website:")
//                        .bold()
//                    Text(business.url ?? "")
//                        .lineLimit(1)
//                    Spacer()
//                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
//
//                }
//                .padding()
//
//                Divider()
//
//            }
//
//            // Get directions button
//            Button {
//                // TODO: Show directions
//                showDirections = true
//
//            } label: {
//                ZStack {
//
//                    Rectangle()
//                        .frame(height: 48)
//                        .foregroundColor(.blue)
//                        .cornerRadius(10)
//
//                    Text("Get Directions")
//                        .foregroundColor(.white)
//                        .bold()
//                }
//            }
//            .padding()
//            .sheet(isPresented: $showDirections) {
//                DirectionsView(business: business)
//            }
//        }
        
    }
}




