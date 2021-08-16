//
//  ContentView.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/14/21.
//

import SwiftUI
import CoreLocation

struct User: Hashable, CustomStringConvertible {

    var id: Int
    let firstName: String
    let lastName: String
    let age: Int
    let mutualFriends: Int
    let imageName: String
    let occupation: String

    var description: String {
        return "\(firstName), id: \(id)"
    }
}

//struct Biz: Codable, Hashable {
//
//    var id: Int
//    let imageName: String?
//    let name: String?
//    let address: String?
//    let info: String?
////    let location: location?
//    let image_url: String?
//
//}

struct Biz: Codable, Hashable {
    
    var id: Int
    
    let imageName: String
    let name: String
    let address: String
    let phone: String
    let review: Double
    let reviewCount: Int
}

struct location: Codable, Hashable {
    
    let city: String?
    let country: String?
    let state: String?
    let address1: String?
    let zip_code: String?
    
}

struct ContentView: View {
    
//    @EnvironmentObject var model: ContentModel


//
//    @ObservedObject var locationViewModel = locationViewModel()

    
    // MARK: - USERS
//    @State var users: [User] = [
//
//        User(id: 0, firstName: "Cindy", lastName: "Jones", age: 23, mutualFriends: 4, imageName: "person_1", occupation: "Coach"),
//        User(id: 1, firstName: "Mark", lastName: "Bennett", age: 27, mutualFriends: 0, imageName: "person_2", occupation: "Insurance Agent"),
//        User(id: 2, firstName: "Clayton", lastName: "Delaney", age: 20, mutualFriends: 1, imageName: "person_3", occupation: "Food Scientist"),
//        User(id: 3, firstName: "Brittni", lastName: "Watson", age: 19, mutualFriends: 4, imageName: "person_4", occupation: "Historian"),
//        User(id: 4, firstName: "Archie", lastName: "Prater", age: 22, mutualFriends:18, imageName: "person_5", occupation: "Substance Abuse Counselor"),
//        User(id: 5, firstName: "James", lastName: "Braun", age: 24, mutualFriends: 3, imageName: "person_6", occupation: "Marketing Manager"),
//        User(id: 6, firstName: "Danny", lastName: "Savage", age: 25, mutualFriends: 16, imageName: "person_7", occupation: "Dentist"),
//        User(id: 7, firstName: "Chi", lastName: "Pollack", age: 29, mutualFriends: 9, imageName: "person_8", occupation: "Recreational Therapist"),
//        User(id: 8, firstName: "Josue", lastName: "Strange", age: 23, mutualFriends: 5, imageName: "person_9", occupation: "HR Specialist"),
//        User(id: 9, firstName: "Debra", lastName: "Weber", age: 28, mutualFriends: 13, imageName: "person_10", occupation: "Judge")
//    ]
//
//    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
//            let offset: CGFloat = CGFloat(users.count - 1 - id) * 10
//            return geometry.size.width - offset
//        }
//
//    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
//            return  CGFloat(users.count - 1 - id) * 10
//        }
//
//    private var maxID: Int {
//           return self.users.map { $0.id }.max() ?? 0
//       }
    
    // MARK: - BIZ
    
    @State var bizzes: [Biz] = [
        Biz(id: 0, imageName: "biz_1", name: "Molly Moon's Homemade Ice Cream", address: "321 W Galer St Seattle, WA 98119", phone: "(206) 457-8854", review: 4.5, reviewCount: 429),
        Biz(id: 1, imageName: "biz_2", name: "The Pink Door", address: "1919 Post Alley Seattle, WA 981019", phone: "(206) 443-3241", review: 4.5, reviewCount: 5431),
        Biz(id: 2, imageName: "biz_3", name: "Nue", address: "1519 14th Ave Seattle, WA 98122", phone: "(206) 257-0312", review: 4.0, reviewCount: 1052),
        Biz(id: 3, imageName: "biz_4", name: "Biscuit Bitch", address: "1909 1st Ave Seattle, WA 98101", phone: "(206) 441-7999", review: 4.0, reviewCount: 4028),
        Biz(id: 4, imageName: "biz_5", name: "Witness", address: "410 Broadway E Seattle, WA 98102", phone: "(206) 329-0248", review: 4.5, reviewCount: 843),
        Biz(id: 5, imageName: "biz_6", name: "Six Seven Restaurant", address: "2411 Alaskan Way Pier 67 Seattle, WA 98121", phone: "(206) 269-4575", review: 4.0, reviewCount: 1067),
        Biz(id: 6, imageName: "biz_7", name: "2120", address: "2120 6th Ave Seattle, WA 98121", phone: "(206) 792-5073", review: 4.0, reviewCount: 408),
        Biz(id: 7, imageName: "biz_8", name: "List", address: "2226 1st Ave Seattle, WA 98121", phone: "(206) 441-1000", review: 4.5, reviewCount: 1942),
        Biz(id: 8, imageName: "biz_9", name: "The Walrus and the Carpenter", address: "4743 Ballard Ave NW Seattle, WA 98107", phone: "(206) 395-9227", review: 4.5, reviewCount: 1672),
        Biz(id: 9, imageName: "biz_10", name: "Elliot's Oyster House", address: "1201 Alaskan Way Pier 56 Seattle, WA 98101", phone: "(206) 623-4340", review: 4.0, reviewCount: 3638),
        Biz(id: 10, imageName: "biz_11", name: "Shaker + Spear", address: "2000 2nd Ave Seattle, WA 98121", phone: "(206) 826-1700", review: 4.5, reviewCount: 835),
        Biz(id: 11, imageName: "biz_12", name: "Tilikum Place Cafe", address: "407 Cedar St Seattle, WA 98121", phone: "(206) 282-4830", review: 4.5, reviewCount: 2086),
        Biz(id: 12, imageName: "biz_13", name: "Toulouse Petit Kitchen & Lounge", address: "601 Queen Anne Ave N Seattle, WA 98109", phone: "(206) 432-9069", review: 4.0, reviewCount: 4218),
        Biz(id: 13, imageName: "biz_14", name: "Radiator Whiskey", address: "94 Pike St Ste 30 Seattle, WA 98101", phone: "(206) 467-4268", review: 4.5, reviewCount: 1268),
        Biz(id: 14, imageName: "biz_15", name: "Damn the Weather", address: "116 1st Ave S Seattle, WA 98104", phone: "(206) 946-1283", review: 4.0, reviewCount: 464),
        Biz(id: 15, imageName: "biz_16", name: "The White Swan Public House", address: "1001 Fairview Ave N Seattle, WA 98109", phone: "(206) 588-2680", review: 4.0, reviewCount: 281),
        Biz(id: 16, imageName: "biz_17", name: "Sawyer", address: "5309 22nd Ave NW Seattle, WA 98107", phone: "(206) 420-7225", review: 4.5, reviewCount: 394),
        Biz(id: 17, imageName: "biz_18", name: "Old Stove Brewing", address: "1901 Western Ave Ste A Seattle, WA 98101", phone: "(206) 602-6120", review: 4.5, reviewCount: 612),
        Biz(id: 18, imageName: "biz_19", name: "Some Random Bar", address: "2604 1st Ave Seattle, WA 98121", phone: "", review: 4.5, reviewCount: 997),
        Biz(id: 19, imageName: "biz_20", name: "LOCAL Public Eatery", address: "404 Terry Ave N Seattle, WA 98109", phone: "(206) 257-1888", review: 4.0, reviewCount: 408)
    ]
    
    
//    @State var bizzes: [Biz] = [
//        Biz(id: 0, imageName: "person_1", name: "Molly Mooon's Homemade Ice Cream ", address: "321 W Galer St Seattle, WA 98119", info: "Deli & Bakery offering bagels, wraps, and salads"),
//        Biz(id: 1, imageName: "person_2", name: "South Brooklyn Foundry", address: "8002 3rd Ave, Brooklyn, NY 11209", info: "Deli & Bakery offering bagels, wraps, and salads"),
//        Biz(id: 2, imageName: "person_3", name: "Bagel Boyss", address: "8 3rd Ave, Brooklyn, NY 11209", info: "Deli & Bakery offering bagels, wraps, and salads"),
//        Biz(id: 3, imageName: "person_4", name: "Bagel Girl", address: "2 33rd Ave, Brooklyn, NY 11209", info: "Deli & Bakery offering bagels, wraps, and salads"),
//        Biz(id: 4, imageName: "person_5", name: "Bagel Queen", address: "8002 3rd Ave, Brooklyn, NY 11209", info: "Deli & Bakery offering bagels, wraps, and salads")
//    ]

    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
            let offset: CGFloat = CGFloat(bizzes.count - 1 - id) * 10
            return geometry.size.width - offset
        }

    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
            return  CGFloat(bizzes.count - 1 - id) * 10
        }

    private var maxID: Int {
           return bizzes.map { $0.id }.max() ?? 0
       }


    var body: some View {
        
        // MARK: - USERS
        VStack {

            GeometryReader { geometry in

                VStack {
                    Spacer()
                    
                    ZStack {
                        ForEach(self.bizzes, id: \.self) { biz in

                            if (self.maxID - 3)...self.maxID ~= biz.id {
                                CardView(biz: biz, onRemove: { removedUser in
                                    self.bizzes.removeAll { $0.id == removedUser.id}
                                })
                                .animation(.spring())
                                .frame(width: self.getCardWidth(geometry, id: biz.id), height: 400)
                                .offset(x: 0, y: self.getCardOffset(geometry, id: biz.id))
                            }

                        }
                    }
                    Spacer()
                }
            }
        }.padding()

//        VStack {
//
//            GeometryReader { geometry in
//
//                VStack {
//                    Spacer()
//
//                    ZStack {
//                        ForEach(self.users, id: \.self) { user in
//
//                            if (self.maxID - 3)...self.maxID ~= user.id {
//                                CardView(user: user, onRemove: { removedUser in
//                                    self.users.removeAll { $0.id == removedUser.id}
//                                })
//                                .animation(.spring())
//                                .frame(width: self.getCardWidth(geometry, id: user.id), height: 400)
//                                .offset(x: 0, y: self.getCardOffset(geometry, id: user.id))
//                            }
//
//                        }
//                    }
//                    Spacer()
//                }
//            }
//        }.padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
