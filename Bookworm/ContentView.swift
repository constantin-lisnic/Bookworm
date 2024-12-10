//
//  ContentView.swift
//  Bookworm
//
//  Created by Constantin Lisnic on 10/12/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Book.date, order: .reverse) var books: [Book]

    @State private var showingAddScreen = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)

                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)

                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .foregroundStyle(book.rating == 1 ? Color.red : Color.primary)
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookwrom")
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }

    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]

            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
