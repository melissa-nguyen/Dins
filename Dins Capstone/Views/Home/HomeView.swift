////
////  HomeView.swift
////  Dins Capstone
////
////  Created by Melissa Nguyen on 8/9/21.
////
//
//import SwiftUI
//
//struct HomeView: View {
//
//    @EnvironmentObject var model: ContentModel
//    @State var isMapShowing = false
//    @State var selectedBusiness: Business?
//
//    var body: some View {
//
//        if model.restaurants.count != 0 || model.sights.count != 0 {
//            // Navigation View
//            NavigationView {
//
//
//                // Determine if we should show list or map
//
//                if !isMapShowing {
//                    // Show list
//                    VStack (alignment: .leading) {
//                        HStack {
//                            Image(systemName: "location")
//                            Text(model.placemark?.locality ?? "")
//                            Spacer()
//                            Button("Switch to Map View") {
//                                self.isMapShowing = true
//                            }
//                        }
//                        Divider()
//                        BusinessList()
//                    }.padding([.horizontal, .top])
//                    .navigationBarHidden(true)
//                } else {
//                    ZStack (alignment: .top) {
//
//                        // Show map
//                        BusinessMap(selectedBusiness: $selectedBusiness)
//                            .ignoresSafeArea()
//                            .sheet(item: $selectedBusiness) { business in
//
//                                // Create a business detail view instance
//                                // Pass in the selected business
//                                BusinessDetail(business: business)
//                            }
//                        // Rectangle overlay
//                        ZStack {
//                            Rectangle()
//                                .foregroundColor(.white)
//                                .cornerRadius(5)
//                                .frame(height: 48)
//
//                            HStack {
//                                Image(systemName: "location")
//                                Text(model.placemark?.locality ?? "")
//                                Spacer()
//                                Button("Switch to List View") {
//                                    self.isMapShowing = false
//                                }
//                            }
//                            .padding()
//                        }
//                        .padding()
//                    }
//                }
//
//            }
//        }
//        else {
//            // Still waiting for data -> show spinner
//            ProgressView()
//        }
//    }
//}
//
////struct HomeView_Previews: PreviewProvider {
////    static var previews: some View {
////        HomeView()
////    }
////}
