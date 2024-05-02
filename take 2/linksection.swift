//
//  linksection.swift
//  take 2
//
//  Created by kashik on 02/05/24.
//

import Foundation
import SwiftUI


func parseISODate(_ dateString: String) -> Date? {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds] // Adjust depending on the precision
    return formatter.date(from: dateString)
}

// Function to format the date as "Month day, year"
func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM, yyyy" // Sets the output format to "Mar 15, 2023"
    formatter.locale = Locale(identifier: "en_US") // Ensure the month is in English
    return formatter.string(from: date)
}





struct links:View{
    @State private var selectedLink: String? = "Top links"
    @EnvironmentObject var viewModel: DashboardViewModel
    var body:some View{
        VStack{
            HStack {
                        // Button for "Top links"
                        Button(action: {
                            // Toggle selected link
                            self.selectedLink = "Top links"
                        }) {
                            Text("Top Links")
                                .fontWeight(.semibold)
                                .foregroundColor(selectedLink == "Top links" ? .white : Color.customGray)
                                .frame(width: 101, height: 36)
                                .background(selectedLink == "Top links" ? Color.blue : Color.clear)
                                .cornerRadius(18)
                        }

                        // Button for "Recent Links"
                        Button(action: {
                            // Toggle selected link
                            self.selectedLink = "Recent Links"
                        }) {
                            Text("Recent Links")
                                .fontWeight(.semibold)
                                .foregroundColor(selectedLink == "Recent Links" ? .white : Color.customGray)
                                .frame(width: 101, height: 36)
                                .background(selectedLink == "Recent Links" ? Color.blue : Color.clear)
                                .cornerRadius(18)
                                
                        }

                        Spacer()

                        // Image acting like a button
                        Button(action: {
                            // Action for the image
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 16))
                                .foregroundColor(Color.customGray)
                                .frame(width: 36, height: 36)
                                .border(Color.customGray, width: 1)
                                .cornerRadius(8)
                        }
                    }
                    .font(.system(size: 16))
                    .frame(width: 328)
            
        }.padding(.top)
        
        //links
        VStack{
            if(self.selectedLink == "Top links" ){
                ForEach(viewModel.schema?.data.top_links ?? [] , id: \.self){link in
                        VStack{
                            HStack{
                                AsyncImageView(urlString: link.original_image)
                                    .frame(width: 48, height: 48)
                                    .border(Color.customGray2,width:1)
                                    .cornerRadius(8)
                                VStack(alignment: .leading){
                                    Text(link.title)
                                        .foregroundColor(Color.black)
                                        .font(.system(size:14))
                                    if let date = parseISODate(link.created_at) {
                                        let readableDate = formatDate(date)
                                        Text(readableDate)
                                            .foregroundColor(Color.customGray)
                                            .font(.system(size:12))
                                      // Outputs "Mar 15, 2023"
                                    } else {
                                        Text("23 mar 2024")
                                            .foregroundColor(Color.customGray)
                                            .font(.system(size:12))
                                       
                                    }
                                    
                                    
                                }
                                Spacer()
                                VStack(alignment: .leading){
                                    Text("\(link.total_clicks )")
                                        .foregroundColor(Color.black)
                                        .font(.system(size:14))
                                    
                                    Text("clicks")
                                        .foregroundColor(Color.customGray)
                                        .font(.system(size:12))
                                    
                                }
                            }.padding(.top)
                                .padding(.leading)
                                .padding(.trailing)
                            Spacer()
                            HStack{
                                Text(link.web_link )
                                    .foregroundColor(Color.customblue)
                                    .font(.system(size: 14))
                                    .padding(.leading)
                                Spacer()
                                Image(systemName: "doc.on.doc")
                                    .foregroundColor(Color.customblue)
                                    .font(.system(size: 14))
                                    .padding(.trailing)
                            }.frame(width:328, height: 40)
                                .background(Color.backblue)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .strokeBorder(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, dash: [5, 3]))
                                        .foregroundColor(Color.borblue)
                                )
                            
                        }.frame(width:328 , height :116)
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.bottom,5)
                        //end box1
                    }
                
                
            }
            //one box
            
            else{
                ForEach(viewModel.schema?.data.recent_links ?? [] , id: \.self){link in
                        VStack{
                            HStack{
//                                Image(link.original_image )
                                AsyncImageView(urlString: link.original_image)
                                    .frame(width: 48, height: 48)
                                    .border(Color.customGray2,width:1)
                                    .cornerRadius(8)
                                VStack(alignment: .leading){
                                    Text(link.title)
                                        .foregroundColor(Color.black)
                                        .font(.system(size:14))
                                    if let date = parseISODate(link.created_at) {
                                        let readableDate = formatDate(date)
                                        Text(readableDate)
                                            .foregroundColor(Color.customGray)
                                            .font(.system(size:12))
                                      // Outputs "Mar 15, 2023"
                                    } else {
                                        Text("23 mar 2024")
                                            .foregroundColor(Color.customGray)
                                            .font(.system(size:12))
                                       
                                    }
                                    
                                    
                                }
                                Spacer()
                                VStack(alignment: .leading){
                                    Text("\(link.total_clicks )")
                                        .foregroundColor(Color.black)
                                        .font(.system(size:14))
                                    
                                    Text("clicks")
                                        .foregroundColor(Color.customGray)
                                        .font(.system(size:12))
                                    
                                }
                            }.padding(.top)
                                .padding(.leading)
                                .padding(.trailing)
                            Spacer()
                            HStack{
                                Text(link.web_link )
                                    .foregroundColor(Color.customblue)
                                    .font(.system(size: 14))
                                    .padding(.leading)
                                Spacer()
                                Image(systemName: "doc.on.doc")
                                    .foregroundColor(Color.customblue)
                                    .font(.system(size: 14))
                                    .padding(.trailing)
                            }.frame(width:328, height: 40)
                                .background(Color.backblue)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .strokeBorder(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, dash: [5, 3]))
                                        .foregroundColor(Color.borblue)
                                )
                            
                        }.frame(width:328 , height :116)
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.bottom,5)
                        //end box1
                    }
            }
            //one box
            
            HStack(alignment: .center){
                Image( "links")
                    .font(.system(size: 16)) // Set the image size to 32 points
                    .foregroundColor(Color.black)
                Text("View All Links").foregroundColor(Color.black)
                    .font(.system(size: 16))
                    
            }.frame(width:328 ,height:48)
                .border(Color(red: 216 / 255, green: 216 / 255, blue: 216 / 255), width: 1)
                .cornerRadius(2)
            
        }.padding(.top)
            .padding(.bottom)
    }
}


struct dash: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

