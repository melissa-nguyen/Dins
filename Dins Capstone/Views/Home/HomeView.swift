//
//  HomeView.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/9/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            // Navigation View
            NavigationView {
                // Determine if we should show list or map
                if !isMapShowing {
                    // Show list
                    
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName: "location")
                            Text("San Francisco")
                            Spacer()
                            Button("Switch to Map View") {
                                self.isMapShowing = true
                            }

                        }
                        Divider()
                        
                        BusinessList()
                        
                    }.padding([.horizontal, .top])
                    .navigationBarHidden(true)
                    
                    
                } else {
                    //Show map
                    BusinessMap()
                        .ignoresSafeArea()
                }
            }
            
        } else {
            // Still waiting for data -> show spinner
            ProgressView()
        }

        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
