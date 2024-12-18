//
//  AddBookView.swift
//  Bookworm
//
//  Created by Constantin Lisnic on 10/12/2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var review = ""
    @State private var genre = "Fantasy"
    
    var isValidForm: Bool {
        if isValidField(title) && isValidField(author) && isValidField(review) {
            return true
        }
        
        return false
    }

    let genres = [
        "Fantasy", "Kids", "Poetry", "Horror", "Mystery", "Romance", "Thriller",
    ]

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of the book", text: $title)

                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)

                    RatingView(rating: $rating)
                }

                Section {
                    Button("Save") {
                        let newBook = Book(
                            title: title, genre: genre, author: author,
                            review: review, rating: rating)
                        modelContext.insert(newBook)

                        dismiss()
                    }
                    .disabled(!isValidForm)
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
    func isValidField(_ string: String) -> Bool{
        if string.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }
        
        return true
    }
}

#Preview {
    AddBookView()
}
