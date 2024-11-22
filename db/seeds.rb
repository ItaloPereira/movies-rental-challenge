3.times do |i|
  User.create!(name: "User#{i+1}")
end
  
movies = [
  { title: "The Shawshank Redemption", genre: "Drama" },
  { title: "The Godfather", genre: "Crime" },
  { title: "Pulp Fiction", genre: "Crime" },
  { title: "The Dark Knight", genre: "Action" },
  { title: "Fight Club", genre: "Drama" },
  { title: "Forrest Gump", genre: "Drama" },
  { title: "Inception", genre: "Sci-Fi" },
  { title: "The Matrix", genre: "Sci-Fi" },
  { title: "The Lord of the Rings: The Fellowship of the Ring", genre: "Adventure" },
  { title: "Star Wars: Episode V - The Empire Strikes Back", genre: "Action" },
  { title: "The Lion King", genre: "Animation" },
  { title: "Interstellar", genre: "Sci-Fi" },
  { title: "Back to the Future", genre: "Adventure" },
  { title: "Toy Story", genre: "Animation" },
  { title: "The Big Lebowski", genre: "Comedy" },
  { title: "The Princess Bride", genre: "Adventure" },
  { title: "The Exorcist", genre: "Horror" },
  { title: "Get Out", genre: "Horror" },
  { title: "The Shining", genre: "Horror" },
  { title: "The Silence of the Lambs", genre: "Crime" },
  { title: "Casablanca", genre: "Drama" },
  { title: "The Godfather: Part II", genre: "Crime" },
  { title: "Schindler's List", genre: "Biography" },
  { title: "Avengers: Endgame", genre: "Action" },
  { title: "Spirited Away", genre: "Animation" },
  { title: "Parasite", genre: "Drama" },
  { title: "Jurassic Park", genre: "Adventure" },
  { title: "Jaws", genre: "Adventure" },
  { title: "Die Hard", genre: "Action" },
  { title: "Mad Max: Fury Road", genre: "Action" }
]
  
movies.each do |movie|
  Movie.create!(
    title: movie[:title], 
    genre: movie[:genre], 
    rating: rand(1.0..10.0).round(2), 
    available_copies: rand(1..10)
  )
end
  
User.all.each do |user|
  movies = Movie.order(Arel.sql('RANDOM()')).limit(rand(1..5))
  user.favorites << movies
end