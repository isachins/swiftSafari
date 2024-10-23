//
//  VerifyProfile.swift
//  SwiftUIPlayground
//
//  Created by Sachin Sharma on 09/05/24.
//

import SwiftUI

struct VerifyProfile: View {
    @State private var isPresentingDetailView = false
    var body: some View {
        ZStack {
                    VStack {
                        Text("Main Content")
                            .padding()
                        Button("Show Detail View") {
                            isPresentingDetailView.toggle()
                        }
                        Spacer()
                    }.background(.gray.opacity(0.3))
                    
                    if isPresentingDetailView {
                        withAnimation(.bouncy) {
                            ExtractedView()
                                .transition(.move(edge: .bottom))
                                .zIndex(1) // Ensure the detail view is above other content
                                .onTapGesture {
                                    isPresentingDetailView.toggle()
                                }
                        }
                        
                        
                    }
                }
//        VStack {
//            ExtractedView()
//        }
    }
}

#Preview {
    VerifyProfile()
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail View")
                .padding()
            Spacer()
        }
        .background(Color.blue)
        .cornerRadius(10)
        .padding()
    }
}

struct ProfileVerificationView: View {
    var body: some View {
        VStack {
            Image("imgVerifyProfile")
                .resizable()
                .frame(width: 150, height: 150)
            
            Text("Verify Your Profile")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Please Verify Your Profile to Keep Finding Rides in your convience")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Verify Profile Now")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            })
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Accept")
                    .foregroundStyle(.orange)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            })
            
        }.padding()
    }
}

struct ExtractedView: View {
    var body: some View {
        VStack {
            
            Spacer()
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .tint(.gray)
                })
            }.padding(.horizontal)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .ignoresSafeArea()
                .frame(height: UIScreen.main.bounds.height / 2)
                .overlay {
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black)
                            .frame(width: 60, height: 7)
                            .padding()
                        Spacer()
                        
                        ProfileVerificationView()
                    }
                }
            
            
            
        }.background(.clear)
    }
}
