import Foundation

struct Schema: Decodable {
    let status: Bool
    let statusCode: Int
    let message, support_whatsapp_number: String
    let extra_income: Double
    let total_links, total_clicks, today_clicks: Int
    let top_source, top_location, startTime: String
    let links_created_today, applied_campaign: Int
    let data: DataClass
}

struct DataClass: Decodable,Hashable {
    let recent_links, top_links: [Link]
    let favourite_links: [Link?] // Assuming `favouriteLinks` should contain links or be null
    let overall_url_chart: [String: Int]?
}


struct Link: Decodable, Hashable {
    let url_id: Int
    let web_link: String
    let smart_link, title: String
    let total_clicks: Int
    let original_image: String
    let thumbnail: String? // Assuming it should be a string or nil
    let times_ago: String
    let created_at: String
    let domain_id: String
    let url_prefix: String?
    let url_suffix, app: String
    let is_favourite: Bool
}

enum DomainID: String, Decodable {
    case inopenappCOM = "in.openapp.com"
    case unknown // A generic case to handle unexpected values

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self = DomainID(rawValue: value) ?? .unknown
    }
}

enum TimesAgo: String, Decodable {
    case the1YrAgo = "1 yr ago"
    case the2YrAgo = "2 yrs ago"
}


//
//func fetchdata()async throws -> Schema{
//    let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew")!
//    let (data, _)     = try await URLSession.shared.data(from: url)
//    let decoded =     try JSONDecoder().decode(Schema.self, from: data)
//    return decoded
//}



//func fetchData() async throws -> Schema {
//    // URL of the API
//    guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else {
//        throw URLError(.badURL)
//    }
//
//    // Create the URLRequest object
//    var request = URLRequest(url: url)
//
//    // Set the HTTP method to GET (or POST, PUT, DELETE, etc., depending on your requirements)
//    request.httpMethod = "GET"
//
//
//    request.addValue("Bearer "+token, forHTTPHeaderField: "Authorization")
//
//    // Make the API call
//    let (data, response) = try await URLSession.shared.data(for: request)
//
//    // Check the response (assuming a typical HTTP response)
//    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//        // If the status code is not in the 200 range, throw an error
//        throw URLError(.badServerResponse)
//    }
//
//    // Decode the JSON data to the `Schema` model
//    let decoded = try JSONDecoder().decode(Schema.self, from: data)
//    return decoded
//}
//


import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var schema: Schema?
    @Published var isLoading = false
    @Published var errorMessage: String?

    var token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"// Ideally, this should be securely fetched from somewhere

    func loadSchemaData() {
        isLoading = true
        errorMessage = nil

        Task {
            do {
                schema = try await fetchData()
                isLoading = false
            } catch {
                print("Error occurred: \(error)")
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }

    func fetchData() async throws -> Schema {
        guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Schema.self, from: data)
    }
}

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let schema = viewModel.schema {
                    // Display your schema data here
                    Text("Status Code: \(schema.statusCode)")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    Text("No data")
                }
            }
            .navigationTitle("Dashboard")
            .onAppear {
                viewModel.loadSchemaData()
            }
        }
    }
}
struct api: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}



struct AsyncImageView: View {
    let urlString: String
    @State private var imageData: Data?

    var body: some View {
        VStack {
            if let imageData = imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("Loading...")
                    .onAppear {
                        loadImageFromURL()
                    }
            }
        }
    }

    func loadImageFromURL() {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error downloading the image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            DispatchQueue.main.async {
                self.imageData = data
            }
        }
        
        task.resume()
    }
}
