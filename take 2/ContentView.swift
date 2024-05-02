
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
