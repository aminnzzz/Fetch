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

func listBuilderIngredients (meal: MealDetails?) -> [String] {
    guard let meal = meal else {
        return []
    }
    var ingredientsText = [String]()
    ingredientsText.append(meal.strIngredient1 ?? "")
    ingredientsText.append(meal.strIngredient2 ?? "")
    ingredientsText.append(meal.strIngredient3 ?? "")
    ingredientsText.append(meal.strIngredient4 ?? "")
    ingredientsText.append(meal.strIngredient5 ?? "")
    ingredientsText.append(meal.strIngredient6 ?? "")
    ingredientsText.append(meal.strIngredient7 ?? "")
    ingredientsText.append(meal.strIngredient8 ?? "")
    ingredientsText.append(meal.strIngredient9 ?? "")
    ingredientsText.append(meal.strIngredient10 ?? "")
    ingredientsText.append(meal.strIngredient11 ?? "")
    ingredientsText.append(meal.strIngredient12 ?? "")
    ingredientsText.append(meal.strIngredient13 ?? "")
    ingredientsText.append(meal.strIngredient14 ?? "")
    ingredientsText.append(meal.strIngredient15 ?? "")
    ingredientsText.append(meal.strIngredient16 ?? "")
    ingredientsText.append(meal.strIngredient17 ?? "")
    ingredientsText.append(meal.strIngredient18 ?? "")
    ingredientsText.append(meal.strIngredient19 ?? "")
    ingredientsText.append(meal.strIngredient20 ?? "")

    return ingredientsText
}

func listBuildermeasures (meal: MealDetails?) -> [String] {
    guard let meal = meal else {
        return []
    }
    var ingredientsText = [String]()
    ingredientsText.append(meal.strMeasure1 ?? "")
    ingredientsText.append(meal.strMeasure2 ?? "")
    ingredientsText.append(meal.strMeasure3 ?? "")
    ingredientsText.append(meal.strMeasure4 ?? "")
    ingredientsText.append(meal.strMeasure5 ?? "")
    ingredientsText.append(meal.strMeasure6 ?? "")
    ingredientsText.append(meal.strMeasure7 ?? "")
    ingredientsText.append(meal.strMeasure8 ?? "")
    ingredientsText.append(meal.strMeasure9 ?? "")
    ingredientsText.append(meal.strMeasure10 ?? "")
    ingredientsText.append(meal.strMeasure11 ?? "")
    ingredientsText.append(meal.strMeasure12 ?? "")
    ingredientsText.append(meal.strMeasure13 ?? "")
    ingredientsText.append(meal.strMeasure14 ?? "")
    ingredientsText.append(meal.strMeasure15 ?? "")
    ingredientsText.append(meal.strMeasure16 ?? "")
    ingredientsText.append(meal.strMeasure17 ?? "")
    ingredientsText.append(meal.strMeasure18 ?? "")
    ingredientsText.append(meal.strMeasure19 ?? "")
    ingredientsText.append(meal.strMeasure20 ?? "")
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

