//
//  widgit1.swift
//  take 2
//
//  Created by kashik on 01/05/24.
//

import Foundation
import SwiftUI

extension Color{
    
    static var customGray2 = Color(red: 216 / 255, green: 216 / 255, blue: 216 / 255)
    static var customGray = Color(red: 153/255, green: 156/255, blue: 160/255)
    static var customblue = Color(red: 14/255, green: 111/255, blue: 255/255)
    static var borblue = Color(red: 166/255, green: 199/255, blue: 255/255)
    static var backblue = Color(red: 232/255, green: 241/255, blue: 255/255)
    static var wpbag = Color(red: 0.37, green: 0.82, blue: 0.12, opacity: 0.29)
}
struct widget1:View
{   @EnvironmentObject var viewModel: DashboardViewModel
    
    
    var body: some View{
        
        HStack{
            VStack(alignment: .leading){
                Image("avtar1")
                    .resizable() // Allow the image to be resized
                    .aspectRatio(contentMode: .fit) // Maintain the aspect ratio while fitting within the given dimensions
                    .frame(width: 32, height: 32) // Set the frame size
                    .foregroundColor(.purple)
                    .padding(.bottom,10)
                
                
                Text("\(viewModel.schema?.today_clicks ?? 0)")
                    .font(.system(size:14))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding(.bottom,-3)
                Text("Today's Clicks")
                    .font(.system(size:14))
                    .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                
            }
            .frame(width: 120, height:120)
            
            .background(Color.white)
            .cornerRadius(8) // Apply cornerRadius after background
//            .padding(10)
            VStack(alignment: .leading){
                Image("avtar2")
                    .resizable() // Allow the image to be resized
                    .aspectRatio(contentMode: .fit) // Maintain the aspect ratio while fitting within the given dimensions
                    .frame(width: 32, height: 32) // Set the frame size
                    .foregroundColor(.purple)
                    .padding(.bottom,10)
                
                Text(viewModel.schema?.top_location ?? "Default message")
                    .font(.system(size:14))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding(.bottom,-3)
                Text("Top Location")
                    .font(.system(size:14))
                    .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                // Set the color of the clock image
                
                
            }
            .frame(width: 120, height:120)
            
            .background(Color.white)
            .cornerRadius(8) // Apply cornerRadius after background
            .padding(10)
            VStack(alignment: .leading){
                Image("avtar3")
                    .resizable() // Allow the image to be resized
                    .aspectRatio(contentMode: .fit) // Maintain the aspect ratio while fitting within the given dimensions
                    .frame(width: 32, height: 32) // Set the frame size
                    .foregroundColor(.purple)
                    .padding(.bottom,10)
                
                Text(viewModel.schema?.top_source ?? "Default message")
                    .font(.system(size:14))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding(.bottom,-3)
                Text("Top Source ")
                    .font(.system(size:14))
                    .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                
            }
            .frame(width: 120, height:120)
            
            .background(Color.white)
            .cornerRadius(8) // Apply cornerRadius after background
            .padding(10)
            
            VStack(alignment: .leading){
                Image("avtar1")
                    .resizable() // Allow the image to be resized
                    .aspectRatio(contentMode: .fit) // Maintain the aspect ratio while fitting within the given dimensions
                    .frame(width: 32, height: 32) // Set the frame size
                    .foregroundColor(.purple)
                    .padding(.bottom,10)
                
                Text("\(viewModel.schema?.total_clicks ?? 0)")
                    .font(.system(size:14))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding(.bottom,-3)
                Text("Total Clicks")
                    .font(.system(size:14))
                    .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                
            }
            .frame(width: 120, height:120)
            
            .background(Color.white)
            .cornerRadius(8) // Apply cornerRadius after background
            .padding(10)
            
        }
    }
}
