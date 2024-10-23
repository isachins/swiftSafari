//
//  ExpandableSearchHomeView.swift
//  swiftSafari
//
//  Created by Sachin Sharma on 15/08/24.
//

import SwiftUI
import Combine

struct ExpandableSearchHomeView: View {
    ///View Properties
    @State private var searchText: String = ""
    @State private var progress: CGFloat = 0
    @FocusState private var isFocused: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 15) {
                ForEach(sampleItems) { item in
                    CardView(item)
                }
            }
            .padding(16)
            .offset(y: isFocused ? 0 : progress * 76)
            .padding(.bottom, 76)
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .onChange(of: geometry.frame(in: .global).minY) { oldValue, newValue in
                            progress = max(min(-newValue / 76, 1), 0)///76-> height of name bar: 60 + bottom padding: 16
                        }
                }
            )
            .safeAreaInset(edge: .top) {
                ResizableHeader()
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(CustomScrollTarget())
        .animation(.snappy(duration: 0.3, extraBounce: 0), value: isFocused)
        .scrollIndicators(.hidden)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    /// Custom Header View
    @ViewBuilder
    func ResizableHeader() -> some View {
        
        let progress = isFocused ? 1 : progress
        
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Welcome Back!")
                            .font(.callout)
                            .foregroundStyle(.gray)
                    })
                    
                    Text("Sachin")
                        .font(.title.bold())
                }
                
                Spacer(minLength: 0)
                
                /// Profile Button
                Button(action: {
                    
                }, label: {
                    Image("Pic 1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                })
                
            }
            .frame(height: 60 - (60 * progress), alignment: .bottom)
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 15 - (15 * progress))
            .opacity(1 - progress)
            .offset(y: -10 * progress)
            
            // MARK: Floating Search Bar
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                
                TextField("Search Photos", text: $searchText)
                    .focused($isFocused)
                
                ///Microphone Button
                Button(action: {
                    
                }, label: {
                    Image(systemName: "mic.fill")
                        .foregroundStyle(Color.red)
                })
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background {
                RoundedRectangle(cornerRadius: isFocused ? 0 : 30)
                    .fill(
                        .background
                            .shadow(.drop(color: .primary.opacity(0.08), radius: 5, x: 5, y: 5))
                            .shadow(.drop(color: .primary.opacity(0.05), radius: 5, x: -5, y: -5))
                    )
                    .padding(.top, isFocused ? -100 : 0)
            }
            .padding(.horizontal, isFocused ? 0 : 16)
            .padding(.bottom, 10)
            .padding(.top, 5)
            
        }
        .background {
            ProgressiveBlurView()
                .blur(radius: isFocused ? 0 : 10)
                .padding(.horizontal, -16)
                .padding(.bottom, -10)
                .padding(.top, -100)
        }
        .visualEffect { content, geometryProxy in
            content
                .offset(y: offsetY(geometryProxy))
        }
    }
    
    nonisolated private
    func offsetY(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        return minY > 0 ? (isFocused ? -minY : 0) : -minY
    }
    
    
    
    ///Card View
    @ViewBuilder
    func CardView(_ item: Item) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            GeometryReader {
                let size = $0.size
                if let image = item.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipShape(.rect(cornerRadius: 20, style: .continuous))
                }
            }
            .frame(height: 220)
            
            Text("By: \(item.title)")
                .font(.callout)
                .foregroundStyle(.primary.secondary)
        }
    }
}

struct CustomScrollTarget: ScrollTargetBehavior {
    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        let endPoint = target.rect.minY
        
        if endPoint < 76 {
            if endPoint > 40 {
                target.rect.origin = .init(x: 0, y: 76)
            } else {
                target.rect.origin = .zero
            }
        }
    }
}

#Preview {
    ExpandableSearchHomeView()
}
