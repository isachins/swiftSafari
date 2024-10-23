//
//  CardView.swift
//  SwiftUIPlayground
//
//  Created by Sachin Sharma on 28/08/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ScrollView {
            ForEach(0...5, id: \.self) { _ in
                Card().clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
        }.background(.secondary.opacity(0.5))
    }
}

struct Card: View {
    
    var body: some View {
        ZStack {
            VStack(spacing: 5) {
                topView()
                
                VStack(alignment: .leading, spacing: 5) {
                    meetupTimeView()
                    
                    addressView(pickup: "10, Poorvi Marg, DLF Phase 2, Sector 25, Sikanderpur ghosiiiiiiiiiiiiiiiiiiiiiiiiiiwsdcsdcsdcsddscsdcsdcsii", drop: "10, Poorvi Marg, DLF Phase 2, Sector 25, Sikanderpur ghosiiiiiiiiiiiiiiiiiiiiiiiiiiwsdcsdcsdcsddscsdcsdcsii")
                    
                    walkView(vehicleType: 2, pickupDistance: 1200, dropDistance: 700)

                    Divider()
                    
                    bottomView()
                    
                }
                .padding(.horizontal, 16)
                
            }
            
            .background(.white)
            
        }
    }
    
    
    @ViewBuilder
    
    func topView() -> some View {
        HStack(alignment: .center) {
            imageView(url: "")
                .minimumScaleFactor(0.8)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Sachin Sharma")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .minimumScaleFactor(0.8)
                        .padding(.top)
                    
                    verificationView()
                        .minimumScaleFactor(0.8)
                    ratingView()
                    
                }.layoutPriority(1)
                
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 5) {
                    Text("60%")
                        .foregroundStyle(.accent)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .lineLimit(1)
                    
                    Text("Route Match")
                        .foregroundStyle(.black.opacity(0.8))
                        .font(.subheadline)
                        .lineLimit(1)
                    
                    Text("100 Ride Completed")
                        .foregroundStyle(.white)
                        .font(.footnote)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 4)
                        .background(.darkGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .lineLimit(1)
                        .minimumScaleFactor(0.65)
                    
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 2))
            
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
    
    func verificationView() -> some View {
        HStack(alignment: .center) {
            Image("ic_govt")
                .resizable()
                .frame(width: 20, height: 20)
                .minimumScaleFactor(0.8)
            
            Text("Govt. Verified")
                .foregroundStyle(.medGreen)
                .font(.subheadline)
                .fontWeight(.semibold)
                .minimumScaleFactor(0.8)
            
            
        }
        .padding(.horizontal, 7)
        .padding(.vertical, 4)
        .background(.lightGreen)
        .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
        .minimumScaleFactor(0.8)
        
    }
    
    func ratingView() -> some View {
        HStack {
            RoundedStar(cornerRadius: 1.5)
                .frame(width: 20, height: 20)
                .foregroundStyle(.yellow)
            
            Text("4(10)")
                .fontWeight(.medium)
                .foregroundStyle(.gray)
        }
    }
    
    func meetupTimeView() -> some View {
        HStack(alignment: .center) {
            Image(systemName: "calendar.badge.clock")
                .foregroundStyle(.medGreen)
            
            Text("Meetup Time :- 1:37 AM, 29 Aug")
                .foregroundStyle(.gray)
                .font(.footnote)
            
            Spacer()
        }
    }
    
    func bottomView() -> some View {
        HStack(alignment: .center) {
            VStack(alignment: .center) {
                Text("₹50")
                    .foregroundStyle(.accent)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.8)
                
                
                Text("Online")
                    .foregroundStyle(.lightGray)
                    .font(.subheadline)
                    .minimumScaleFactor(0.8)
            }
            Spacer()
            
            HStack(spacing: 10) {
                seatsView(totalSeats: 5, availableSeats: 3)
                
                Button(action: {
                    
                }, label: {
                    Text("Join")
                        .frame(width: 100, height: 40)
                }).buttonStyle(.primary)
                
            }
        }
        .padding(.vertical, 9)
    }

}

#Preview {
    CardView()
}
