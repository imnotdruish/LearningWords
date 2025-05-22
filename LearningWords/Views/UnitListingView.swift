//
//  UnitListingView.swift
//  LearningWords
//
//  Created by Dan June on 5/18/25.
//

import SwiftData
import SwiftUI

struct UnitListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Unit.createdAt), SortDescriptor(\Unit.createdAt, order: .reverse), SortDescriptor(\Unit.title)]) var units: [Unit]
    @State private var buttonPressed: Bool = false

    let columns = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.gradient)
                .ignoresSafeArea(.all)
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(units) { unit in
                        NavigationLink(value: unit) {
                            ZStack(alignment: .topTrailing) {
                                UnitCardView(unit: unit)
                                    .foregroundColor(.white)
                                    .frame(width: 150,
                                           height: 150
                                    )
                                    .background(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(red: 0/255, green: 178/255, blue: 139/255),
                                                Color(red: 6/255, green: 132/255, blue: 105/255)
                                        ]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                        )
                                        .opacity(0.6)
                                        .ignoresSafeArea(.all)
                                    )
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(.white, lineWidth: 2)
                                    )
                                    .shadow(color: .black, radius: 5, x: 2, y: 5)
                                    .padding()
                                    .onLongPressGesture {
                                        buttonPressed.toggle()
                                    }
                                
                                if buttonPressed {
                                    Button(action: {
                                        deleteUnit(unit)
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .foregroundStyle(.red)
                                            .background(.white)
                                            .clipShape(Circle())
                                    }
                                    .padding(5)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
        
    init(sort: SortDescriptor<Unit>, searchString: String) {
        _units = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.title.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }

    func deleteUnit(_ unit: Unit) {
        modelContext.delete(unit)
        buttonPressed = false
    }
}

#Preview {
    UnitListingView(
        sort: SortDescriptor(\Unit.title),
        searchString: "",
    )
}
