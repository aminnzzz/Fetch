//
//  Networking.swift
//  FetchInterview
//
//  Created by amin nazemzadeh on 4/15/23.
//

import Foundation

struct MealListResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

func fetchDessertMeals(completion: @escaping ([Meal]?) -> Void) {
    
    if let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
              let decoder = JSONDecoder()
              do {
                  let response = try decoder.decode(MealListResponse.self, from: data)
                  completion(response.meals)
              } catch {
                  print("Error decoding JSON: \(error)")
                  completion(nil)
              }
              
           }
       }.resume()
    }
}

func fetchMealDetails(mealId: String, completion: @escaping ([MealDetails]?) -> Void) {
    if let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(MealDetailsResponse.self, from: data)
                    completion(response.meals)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil)
                }
            }
        }.resume()
    }
}

func listBuilderIngredients (meal: MealDetails?) -> String {
    guard let meal = meal else {
        return ""
    }
    var ingredientsText = ""
    ingredientsText += meal.strIngredient1 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient2 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient3 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient4 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient5 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient6 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient7 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient8 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient9 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient10 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient11 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient12 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient13 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient14 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient15 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient16 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient17 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient18 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient19 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strIngredient20 ?? ""
    ingredientsText += " "
    return ingredientsText
}

func listBuildermeasures (meal: MealDetails?) -> String {
    guard let meal = meal else {
        return ""
    }
    var ingredientsText = ""
    ingredientsText += meal.strMeasure1 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure2 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure3 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure4 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure5 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure6 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure7 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure8 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure9 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure10 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure11 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure12 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure13 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure14 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure15 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure16 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure17 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure18 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure19 ?? ""
    ingredientsText += " "
    ingredientsText += meal.strMeasure20 ?? ""
    ingredientsText += " "
    return ingredientsText
}

struct MealDetailsResponse: Codable {
    let meals: [MealDetails]
}

struct MealDetails: Codable {
    let idMeal: String?
    let strMeal: String?
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
}

