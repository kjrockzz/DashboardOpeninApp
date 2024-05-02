//
//  Dashboard.swift
//  take 2
//
//  Created by kashik on 02/05/24.
//

import Foundation
import SwiftUI

struct Dashboard: View {
    @StateObject  var viewModel = DashboardViewModel()
    

    var body: some View {
        ZStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .foregroundColor(Color.black)
                } else if let schema = viewModel.schema {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("Good Morning").font(.system(size: 18))
                                    .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                                    .multilineTextAlignment(.leading)
                                    .padding(.top)
                                Text("Kashik Janbandhu")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.black)
                            }
                            .padding(.leading)

                            VStack {
                                HStack {
                                    Text("overview").font(.system(size: 18))
                                        .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                                    Spacer()
                                    HStack {
                                        Text("23 Aug - 24 Sept")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color.black)
                                        Image(systemName: "clock")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                                    }
                                    .frame(width: 123, height: 28)
                                    .border(Color(red: 0.9216, green: 0.9216, blue: 0.9216), width: 1)
                                    .cornerRadius(6)
                                }
                                .padding(10)
                                convi()
                            }
                            .frame(width: 328, height: 230)
                            .background(Color.white)
                            .cornerRadius(8)

                            ScrollView(.horizontal, showsIndicators: false) {

                                widget1()
                            }
                            .padding(.bottom, 10)

                            HStack(alignment: .center) {
                                Image("aero")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color.black)
                                Text("View Analytics").foregroundColor(Color.black)
                                    .font(.system(size: 16))
                            }
                            .frame(width: 328, height: 48)
                            .border(Color(red: 216 / 255, green: 216 / 255, blue: 216 / 255), width: 1)
                            .cornerRadius(2)

                            Spacer()
                            links()
                            
                            VStack {
                                HStack {
                                    Image( "whats")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color.green)
                                        .padding(.leading)
                                    Text("Talk with Us").foregroundColor(Color.black)
                                        .font(.system(size: 16))
                                    Spacer()
                                }
                                .frame(width: 328, height: 64)
                                .background(Color.wpbag)
                                .border(Color.green)
                                .cornerRadius(2)
                                Spacer()
                                HStack {
                                    Image("info")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color.customblue)
                                        .padding(.leading)
                                    Text("Frequently asked Questions").foregroundColor(Color.black)
                                        .font(.system(size: 16))
                                    Spacer()
                                }
                                .frame(width: 328, height: 65)
                                .background(Color.backblue)
                                .border(Color.borblue)
                                .cornerRadius(2)
                            }
                            .frame(width: 328, height: 145)
                        }
                        Spacer()
                    }
                    .font(.title)
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    Text("No data")
                }
            }

            
        }
        .padding(.leading, 20)
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)))
        .cornerRadius(20)
        .foregroundColor(.white)
        .onAppear {
            viewModel.loadSchemaData()
        }.environmentObject(viewModel)
    }
}


struct Cse: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
