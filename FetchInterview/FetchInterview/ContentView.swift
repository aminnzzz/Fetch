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
        VStack(spacing: 20) {
            Button(action: {
                fetchDessertMeals { meals in
                    if let meals = meals {
                        self.meals = meals
                    } else {
                        print("could not get the desserts")
                    }
                }
                self.showDessert = true
            }) {
                Text("Show Desserts")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            .sheet(isPresented: $showDessert) {
                NavigationView{
                    List(meals, id: \.idMeal) { meal in
                        NavigationLink(destination: MealDetailView(mealId: meal.idMeal)){
                            VStack {
                                HStack(alignment: .center){
                                    VStack(alignment: .leading, spacing: 10){
                                        Text(meal.strMeal)
                                            .foregroundColor(.black)
                                        Text(meal.idMeal)
                                            .foregroundColor(.black)
                                    }
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
                                    .cornerRadius(10)
                                }
                            }
                            .border(Color.orange)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Home"))
        }
        .padding()
    }
}

struct MealDetailView: View {
    let mealId: String
    @State private var mealDetails: [MealDetails]? = nil
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Button(action: {
                fetchMealDetails(mealId: self.mealId) {
                    mealDetails in
                    if let mealDetails = mealDetails {
                        self.mealDetails = mealDetails
                    } else {
                        print("could not get the desserts")
                    }
                }
            }) {
                Text("Show Details")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            if let mealDetails = self.mealDetails {
                let meal = mealDetails.first
                ScrollView {
                    VStack(alignment: .center, spacing: 20) {
                        HStack(spacing: 15){
                            VStack(alignment: .center) {
                                Text("meal ID:")
                                Text(meal?.idMeal ?? "no id")
                            }
                            VStack(alignment: .center) {
                                Text("meal:")
                                Text(meal?.strMeal ?? "no name")
                            }
                            VStack(alignment: .center) {
                                Text("drink alterative:")
                                Text(meal?.strDrinkAlternate ?? "no drink alternative")
                            }
                        }
                        HStack(spacing: 15) {
                            VStack(alignment: .center) {
                                Text("category:")
                                Text(meal?.strCategory ?? "no category")
                            }
                            VStack(alignment: .center) {
                                Text("area:")
                                Text(meal?.strArea ?? "no area")
                            }
                        }
                    }
                    Spacer()
                    VStack {
                        Text("instructions:")
                        Text(meal?.strInstructions ?? "no instructions")
                    }
                    AsyncImage(
                        url: URL(string: meal?.strMealThumb ?? "no image"),
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
                    .cornerRadius(10)
                    VStack(spacing:20) {
                        VStack {
                            Text("tags:")
                            Text(meal?.strTags ?? "no tags")
                        }
                        VStack {
                            Text("youtube link:")
                            Text(meal?.strYoutube ?? "no youtube link")
                        }
                    }
                    Spacer()
                    Spacer()
                    HStack {
                        VStack{
                            let str = listBuilderIngredients(meal: meal)
                            Text("ingredients:")
                            Text(str)
                        }
                        VStack{
                            let str = listBuildermeasures(meal: meal)
                            Text("measures:")
                            Text(str)
                        }
                    }
                    VStack {
                        VStack {
                            Text("source:")
                            Text(meal?.strSource ?? "no source")
                        }
                        VStack {
                            Text("image source:")
                            Text(meal?.strImageSource ?? "no image source")
                        }
                        VStack {
                            Text("creative comms confirmed:")
                            Text(meal?.strCreativeCommonsConfirmed ?? "no creative comms confirmed")
                        }
                        VStack {
                            Text("date modified:")
                            Text(meal?.dateModified ?? "date modified")
                        }
                    }
                }
                .frame(maxWidth: .infinity)
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
