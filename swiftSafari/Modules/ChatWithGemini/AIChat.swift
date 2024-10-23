//
//  AIChat.swift
//  swiftSafari
//
//  Created by Sachin Sharma on 28/06/24.
//

import SwiftUI
//import GoogleGenerativeAI
//
//struct AIChat: View {
//    
//    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
//    
//    @State var userPrompt = ""
//    @State var isLoading = false
//    @State var response: LocalizedStringKey = "How can I help you today?"
//
//    
//    var body: some View {
//        VStack {
//            Text("Welcome to Gemini AI")
//                .font(.largeTitle)
//                .foregroundStyle(.indigo)
//                .fontWeight(.bold)
//                .padding(.top, 40)
//            ZStack{
//                ScrollView{
//                    Text(response)
//                        .font(.title)
//                }
//                if isLoading {
//                    ProgressView()
//                        .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
//                        .scaleEffect(4)
//                }
//            }
//                    
//            HStack {
//                TextField("Ask anything...", text: $userPrompt, axis: .horizontal)
//                    .lineLimit(1)
//                    .font(.title3)
//                    .padding()
//                    .background(Color.indigo.opacity(0.2), in: Capsule())
//                    .disableAutocorrection(true)
//                
//                
//                Button {
//                    generateResponse()
//                } label: {
//                    Image(systemName: "paperplane.fill")
//                        .foregroundStyle(.white)
//                        .padding()
//                        .background(.blue, in: Capsule())
//                }
//                
//            }
//        }
//        .padding()
//    }
//    
//    func generateResponse(){
//        isLoading = true;
//        response = ""
//        
//        Task {
//            do {
//                let result = try await model.generateContent(userPrompt)
//                isLoading = false
//                response = LocalizedStringKey(result.text ?? "No response found")
//                userPrompt = ""
//            } catch {
//                response = "Something went wrong! \n\(error.localizedDescription)"
//            }
//        }
//    }
//    
//}
//
//enum APIKey {
//  // Fetch the API key from `GenerativeAI-Info.plist`
//  static var `default`: String {
//    guard let filePath = Bundle.main.path(forResource: "GeminiAPI", ofType: "plist")
//    else {
//      fatalError("Couldn't find file 'GenerativeAI-Info.plist'.")
//    }
//    let plist = NSDictionary(contentsOfFile: filePath)
//    guard let value = plist?.object(forKey: "API_KEY") as? String else {
//      fatalError("Couldn't find key 'API_KEY' in 'GenerativeAI-Info.plist'.")
//    }
//    if value.starts(with: "_") {
//      fatalError(
//        "Follow the instructions at https://ai.google.dev/tutorials/setup to get an API key."
//      )
//    }
//    return value
//  }
//}
//
//
//#Preview {
//    AIChat()
//}
