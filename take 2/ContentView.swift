////
////  ContentView.swift
////  take 2
////
////  Created by kashik on 01/05/24.
////
//
//import SwiftUI
//
//
//struct ContentView: View {
//    @State private var selectedLink: String? = "Top links"
//
//
//
//    init() {
//        // Set up navigation bar appearance
//        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = UIColor.systemBlue
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//
//        // Apply appearance settings
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().compactAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//    }
//
//    var body: some View {
//        TabView{
//        NavigationView {
//
//            Dashboard()
//                .navigationBarItems(
//                    leading: VStack{
//                        Spacer()
//                        Text("Dashboard")
//
//                            .font(.system(size: 40 , weight: .bold, design: .rounded) )
//                            .foregroundColor(Color.white)
//                    },
//                    trailing: VStack {
//
//                        Spacer()
//                        Button(action: {
//                            print("Button tapped")
//                        }) {
//                            Image(systemName: "gearshape")
//                                .foregroundColor(.white)
//
//                        }
//                    })
//        }//nav section ends
//        .tabItem {
//                        Label("Dashboard", systemImage: "house")
//                    }
//
//                    SettingsView()
//                        .tabItem {
//                            Label("Settings", systemImage: "gear")
//                        }
//            uploadView()
//            .tabItem {
//                Image(systemName: "plus.circle.fill")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 60, height: 60)
//                                    .foregroundColor(.blue)
//                                    .background(Color.blue)
//                                    .clipShape(Circle())
//                                    .shadow(radius: 5)
//
//            }
//                    ProfileView()
//                        .tabItem {
//                            Label("Profile", systemImage: "person.crop.circle")
//                        }
//                uploadView()
//                .tabItem {
//                    Label("upload", systemImage: "person.crop.circle")
//                }
//    }
//
//        }
//    }
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}





import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Set"
   
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView (selection: $selectedTab){
                
                Dashboard()
                .tabItem {
                    Label("links", image: "links")
                        
                }.background(Color.gray)
                ProfileView()
                    .tabItem {
                        Label("Courses", image: "files")
                    }
                    .tag("Profile")
                NavigationView {
                    Dashboard()
                        .navigationBarItems(
                            leading: Text("Dashboard")
                                .font(.system(size: 40, weight: .bold, design: .rounded))
                                .foregroundColor(.white),
                            trailing: Button(action: {
                                print("Settings tapped")
                            }) {
                                Image("wrench")
                                    .frame(width:40,height:40)
                                    .background(.white.opacity(0.12))
                                    .cornerRadius(8)
                                    .padding(.bottom,3)
                            }
                        )
                }
                    .tabItem {
                        
                    }
                    .tag("Set")
                ProfileView()
                    .tabItem {
                        Label("Campaigns", image : "speaker")
                    }
                    .tag("Campaigns")

                    
                   

                ProfileView()
                    .tabItem {
                        Label("Profile", image: "contact")
                    }
                    .tag("Profile")
            }
            
            
            Button(action: {
                selectedTab = "Upload"
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 65)
                    .background(Color.white)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    
            }
            .offset(y: -10)  // Adjusts the button to float above the tab bar
            .zIndex(12)
            
            // Special Upload Button
            Button(action: {
                selectedTab = "Upload"
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    
            }
            .offset(y: -10)  // Adjusts the button to float above the tab bar
            .zIndex(12)  // Ensures the button stays on top of other content
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
