////
////  BusinessList.swift
////  Dins Capstone
////
////  Created by Melissa Nguyen on 8/9/21.
////
//
//import SwiftUI
//
//// MARK: - Code from Medium M.Kawwa Blog Post
//
//
//struct cardBusiness: Codable, Hashable {
//    var id: Int?
//    let imageName: String?
//    let name: String?
//    let address: String?
//    let info: String?
//}
//
//struct BusinessList: View {
//
//    // MARK: - Code from Medium M.Kawwa Blog Post
//
////    private var businesses: [cardBusiness] = [
////        cardBusiness(id: 0, imageName: "bagelboy", name: "Bagel Boy", address: "8002 3rd Ave, Brooklyn, NY 11209", info: "Deli & bakery offering bagels, wraps, panini & sub sandwiches, plus soups & salads."),
////        cardBusiness(id: 1, imageName: "foundryBurger", name: "South Brooklyn Foundry", address: "6909 3rd Ave, Brooklyn, NY 1120", info: "American, Breakfast and Brunch, Burgers."),
////        cardBusiness(id: 2, imageName: "omonia", name: "Omonia Cafe", address: "7612-14 3rd Ave, Brooklyn, NY 11209", info: "Local Greek chain with a late-night scene doling out traditional sweets & savory dishes since 1977."),
////        cardBusiness(id: 2, imageName: "omonia", name: "Omonia Cafe", address: "7612-14 3rd Ave, Brooklyn, NY 11209", info: "Local Greek chain with a late-night scene doling out traditional sweets & savory dishes since 1977."),
////        cardBusiness(id: 0, imageName: "bagelboy", name: "Bagel Boy", address: "8002 3rd Ave, Brooklyn, NY 11209", info: "Deli & bakery offering bagels, wraps, panini & sub sandwiches, plus soups & salads.")
////    ]
////
////    // Returrn the CardViews width for the given offset in the arrray
////    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
////
////        let offset: CGFloat = CGFloat(businesses.count - 1 - id) * 10
////        return geometry.size.width - offset
////
////    }
////
////    // Return the CardViews frame offset for the given offset in the array
////    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
////
////        return CGFloat(businesses.count - 1 - id) * 10
////
////    }
//
//    // MARK: - END of Code from Medium M.Kawwa Blog Post
//
//
//    @EnvironmentObject var model: ContentModel
//    var businesses: [Business]
//
//    // MARK: - functions to return the CardVieews width for the given offset in the array
//
////    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
////        let offset: CGFloat = CGFloat(businesses.count - 1 - id) * 10
////        return geometry.size.width - offset
////    }
////
////    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
////        return CGFloat(businesses.count - 1 - id) * 10
////    }
//
//    var body: some View {
//
//        // MARK: - Code from Medium M.Kawwa Blog Post
//
////        VStack {
////
////            GeometryReader { geometry in
////
////                VStack {
////
////                    ZStack {
////
////                        ForEach(self.businesses, id: \.self) { business in
////
////                            BusinessDetail()
////
////                                .frame(width: self.getCardWidth(geometry, id: businesses.id), height: 400)
////                                .offset(x: 0, y: self.getCardOffset(geometry, id: businesses.id))
////                        }
////
////                    }
////                    Spacer()
////                }
////
////            }
////
////        }.padding()
////
//
//        // MARK: - Business List View from CWC Video
//        ScrollView (showsIndicators: false) {
//            LazyVStack (alignment: .leading, pinnedViews:[.sectionHeaders]) {
//
//                BusinessSection(title: "Restaurants", businesses: model.restaurants)
//
//                BusinessSection(title: "Sights", businesses: model.sights)
//
//            }
////        }
//    }
//
//
//}
//
////struct BusinessList_Previews: PreviewProvider {
////    static var previews: some View {
////        BusinessList()
////    }
////}
