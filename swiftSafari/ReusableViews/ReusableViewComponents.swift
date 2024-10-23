//
//  ReusableViewComponents.swift
//  SwiftUIPlayground
//
//  Created by Sachin Sharma on 29/08/24.
//

import SwiftUI

@ViewBuilder
func addressView(title: String, address: String, titleColor: Color, addressColor: Color) -> some View {
    HStack {
        (Text("\(title) :-")
            .foregroundStyle(titleColor)
            .font(.subheadline)
            .fontWeight(.semibold)
        +
        Text(" \(address)")
            .foregroundStyle(addressColor)
            .font(.subheadline)
            .fontWeight(.regular)
        )
    }
    .lineLimit(2)
    .truncationMode(.tail)
}


func frontLocationMarker() -> some View {
    VStack {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 10, height: 10)
            .foregroundStyle(.accent)
        
        VStack {
            Image(systemName: "ellipsis")
                .resizable()
                .frame(width: 30, height: 6)
                .foregroundStyle(.lightGray)
        }.padding(.vertical)
        .rotationEffect(.degrees(90))
        
        
        Image(systemName: "drop.halffull")
            .resizable()
            .frame(width: 12, height: 15)
            .rotationEffect(.degrees(180))
            .foregroundStyle(.accent)
        
    }
}

func imageView(url: String) -> some View {
    let url = URL(string: url)
    return AsyncImage(url: url) { image in
            //.frame(.infinity)
    } placeholder: {
        Image("img_female_placeholder")
            .resizable()
            .frame(width: 60, height: 60)
            .background(.secondary.tertiary)
            .clipShape(Circle())
            
    }
}

func addressView(pickup: String, drop: String) -> some View {
    HStack {
        frontLocationMarker()
        
        VStack(alignment: .leading) {
            addressView(title: "Meetup Point", address: pickup, titleColor: .medGreen, addressColor: .lightGray)
            
            addressView(title: "Drop Point", address: drop, titleColor: .red, addressColor: .lightGray)
        }
        
        
    }
}

func walkView(vehicleType: Int, pickupDistance: Int, dropDistance: Int) -> some View {
    HStack(alignment: .center, spacing: 5) {
        Spacer()
        Image(systemName: "figure.walk")
            .foregroundStyle(.darkBlue)
        
        let pickUp = Double(pickupDistance)
        let dropDist = Double(dropDistance)
        
        if pickUp >= 1000{
            Text("\(String(format:"%.1f", pickUp / 1000).trimmingCharacters(in: CharacterSet(charactersIn: ".0")))km")
                .foregroundStyle(.medGreen)
        }else{
            Text("\(String(format:"%.1f", pickUp).trimmingCharacters(in: CharacterSet(charactersIn: ".0")))m")
                .foregroundStyle(.black)
        }
        
        Image(systemName: "chevron.right")
            .foregroundStyle(.lightGray)
         
        Image(systemName: vehicleType == 2 ? "car" : "bicycle")
            .foregroundStyle(.accent)
        
        Image(systemName: "chevron.right")
            .foregroundStyle(.lightGray)
        
        Image(systemName: "figure.walk")
            .foregroundStyle(.darkBlue)
        
        if dropDist >= 1000{
            Text("\(String(format:"%.1f", dropDist / 1000).trimmingCharacters(in: CharacterSet(charactersIn: ".0")))km")
                .foregroundStyle(.medGreen)
        }else{
            Text("\(String(format:"%.1f", dropDist).trimmingCharacters(in: CharacterSet(charactersIn: ".0")))m")
                .foregroundStyle(.black)
        }
        
        Image(systemName: "drop.halffull")
            .resizable()
            .frame(width: 12, height: 15)
            .rotationEffect(.degrees(180))
            .foregroundStyle(.accent)
    }
    .font(.headline)
}

func seatsView(totalSeats: Int, availableSeats: Int) -> some View {
    HStack(spacing: 5) {
        ForEach(0..<totalSeats, id: \.self) { index in
            Image(systemName: "figure.seated.seatbelt")
                .foregroundColor(index < (totalSeats - availableSeats) ? .orange : .gray)
                .minimumScaleFactor(0.8)
        }
    }
}
