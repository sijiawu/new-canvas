# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Book.delete_all
Author.delete_all
User.delete_all
Review.delete_all

authors = ["Antoine de Saint-Exupery", "Agatha Christie", "Darren Hardy", "Harper Lee"]

authors.each do |author|
  Author.create name: author
end

author_data = {"The Little Prince" => "Antoine de Saint-Exupery",
"And Then There Were None" => "Agatha Christie",
"Compound Effect" => "Darren Hardy",
"To Kill a Mockingbird" => "Harper Lee",
"Murder on the Orient Express" => "Agatha Christie",
"The Murder of Roger Ackroyd" => "Agatha Christie"}

books = [
  {
    "title" => 'The Little Prince',
    "cover_url" => 'https://images-na.ssl-images-amazon.com/images/I/416G7rmennL._SX311_BO1,204,203,200_.jpg',
    "summary" => 'The little prince wants to return home to his tiny planet and his beloved flower. The way this is done, apparently, is to get bitten by a poisonous desert snake. This method sounds dubious to the narrator (and to Shmoop), but the prince is all about it. The snake bites the prince, who then collapses and disappears.'
  },
  {
    "title" => 'And Then There Were None',
    "cover_url" => 'http://s3.amazonaws.com/agatha-christie-cms-production/hcus-paperback/And-Then-There-Were-None-HarperCollins-US.png',
    "summary" => "The novel opens with all of the main characters traveling by train or car to a ferry that will take them to a mysterious island named Indian Island. Each guest has received an invitation from a Mr. or Mrs. U.N. Owen, or a Mrs. Constance Culmington, to come to the island."
  },
  {
    "title" => 'Compound Effect',
    "cover_url" => 'https://images-na.ssl-images-amazon.com/images/I/51WrGFiSruL.jpg',
    "summary" => "The compound effect is the strategy of reaping huge rewards from small, seemingly insignificant actions. You cannot improve something until you measure it. Always take 100 percent responsibility for everything that happens to you."
  },
  {
    "title" => 'To Kill a Mockingbird',
    "cover_url" => 'https://images-na.ssl-images-amazon.com/images/I/511VJ1l8eaL._SX308_BO1,204,203,200_.jpg',
    "summary" => "To Kill a Mockingbird takes place in Alabama during the Depression, and is narrated by the main character, a little girl named Jean Louise \"Scout\" Finch. Her father, Atticus Finch, is a lawyer with high moral standards."
  },
  {
    "title" => 'Murder on the Orient Express',
    "cover_url" => "https://images-na.ssl-images-amazon.com/images/I/51%2B2QZIRWfL._SX308_BO1,204,203,200_.jpg",
    "summary" => "A lavish trip through Europe quickly unfolds into a race against time to solve a murder aboard a train. When an avalanche stops the Orient Express dead in its tracks, the world's greatest detective -- Hercule Poirot -- arrives to interrogate all passengers and search for clues before the killer can strike again."
  },
  {
    "title" => "The Murder of Roger Ackroyd",
    "cover_url" => "http://deliberatereader.com/wp-content/uploads/2015/02/The-Murder-of-Roger-Ackroyd.jpg",
    "summary" => "Roger Ackroyd was a man who knew too much. He knew the woman he loved had poisoned her first husband. He knew someone was blackmailing her – and no."
  }
]


books.each do |book_data|
  b = Book.new
  b.title = book_data["title"]
  b.summary = book_data["summary"]
  b.cover_url = book_data["cover_url"]
  b.author = Author.find_by(name: author_data[b.title])
  if b.author == nil
    b.author = Author.first
  end
  b.save
end

reviews = [
  {
    "content" => "Fascinating story!!! Would've never guessed the end, but it makes so much sense",
    "creator" => "user1",
    "book" => "Murder on the Orient Express"
  },
  {
    "content" => "Another great book by Agatha Christie",
    "creator" => "user1",
    "book" => "The Murder of Roger Ackroyd"
  },
  {
    "content" => "Wanted to see the movie after reading this book!",
    "creator" => "user2",
    "book" => "Murder on the Orient Express"
  },  
  {
    "content" => "The saddest story in human history",
    "creator" => "user2",
    "book" => "The Little Prince"
  },
  {
    "content" => "Just beautiful sadness",
    "creator" => "user3",
    "book" => "The Little Prince"
  },
  {
    "content" => "SAD, SAD, SAD!",
    "creator" => "user1",
    "book" => "The Little Prince"
  }
]

reviews.each do |review|
  c = Review.new
  c.content = review["content"]
  c.creator = review["creator"]
  c.book = Book.find_by(title: review["book"])
  c.save
end

User.delete_all
User.create username: 'user1', email: 'user1@example.org', password: 'user1pw'
User.create username: 'user2', email: 'user2@example.org', password: 'user2pw'
User.create username: 'user3', email: 'user3@example.org', password: 'user3pw'
User.create username: 'admin', email: 'admin@example.org', password: 'admin'

print "There are now #{User.count} users in the database.\n"
print "There are now #{Book.count} books in the database.\n"
print "There are now #{Author.count} authors in the database.\n"
print "There are now #{Review.count} reviews in the database.\n"

