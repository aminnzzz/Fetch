//
//  ContentView.swift
//  FetchInterview
//
//  Created by amin nazemzadeh on 4/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showDessert = false
    @State private var showID = false
    @State private var meals: [Meal] = []
    var body: some View {
        NavigationView{
            List(meals, id: \.idMeal) { meal in
                NavigationLink(destination: MealDetailView(mealId: meal.idMeal)){
                    VStack(alignment: .leading, spacing: 10){
                        Text(meal.strMeal)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    AsyncImage(
                        url: URL(string: meal.strMealThumb),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 300, maxHeight: 100)
                        },
                        placeholder: {
                            Image(systemName: "globe")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 300, maxHeight: 100)
                        }
                        
                    )
                    .cornerRadius(25)
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 3)
                )
            }
            .navigationBarTitle("List of Desserts", displayMode: .automatic)
        }
        
        .onAppear{
            fetchDessertMeals { meals in
                if let meals = meals {
                    self.meals = meals
                } else {
                    print("could not get the desserts")
                }
            }
        }
        .padding()
    }
}

struct MealDetailView: View {
    let mealId: String
    @State private var mealDetails: [MealDetails]? = nil
    
    var body: some View {
        VStack {
            if let meal = mealDetails?.first{
                ScrollView {
                    Text(meal.strMeal ?? "no name")
                        .font(.title2)
                    
                    Spacer()
                    Divider()
                    VStack(spacing: 10) {
                        Text("Instructions:")
                            .font(.title2)
                        Text(meal.strInstructions ?? "no instructions")
                    }
                    Spacer()
                    Divider()
                    HStack(alignment: .top) {
                        VStack{
                            let ingredients = listBuilderIngredients(meal: meal)
                            Text("Ingredients:")
                                .font(.title2)
                            Divider()
                            ForEach(0..<ingredients.count, id: \.self) { ingredient in
                                if (ingredients[ingredient] != "") {
                                    Text(ingredients[ingredient])
                                }
                            }
                        }
                        Spacer()
                        VStack{
                            let measures = listBuildermeasures(meal: meal)
                            Text("Measures:")
                                .font(.title2)
                            Divider()
                            ForEach(0..<measures.count, id: \.self) { measure in
                                if (measures[measure] != "") {
                                    Text(measures[measure])
                                }
                            }
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear {
            fetchMealDetails(mealId: self.mealId) {
                mealDetails in
                if let mealDetails = mealDetails {
                    self.mealDetails = mealDetails
                } else {
                    print("could not get the desserts")
                }
            }
        }
        .padding()
        .navigationBarTitle(Text("Meal Details"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
