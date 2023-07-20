puts "Currently seeding..."

# User
User.create([
    {username: "Admin_Meg",
    first_name: "Admin",
    last_name: "User",
    password: "admin",
    password_confirmation: "admin",
    is_admin: true},
    {username: "MegDacus",
    first_name: "Megan",
    last_name: "Dacus",
    password: "password",
    password_confirmation: "password",
    is_admin: false},
    {username: "MegJustice",
    first_name: "Megan",
    last_name: "Justice",
    password: "1234",
    password_confirmation: "1234",
    is_admin: false}
])

# Bookclub
Bookclub.create([
    {name: "Fantasy Bookclub", description: "A place for fans of magic and new worlds!", host_user_id: 1},
    {name: "Romance Lovers", description: "We read books guaranteed to make us swoon and blush!", host_user_id: 3},
    {name: "Classics Club", description: "Making classic literature fun and accessible", host_user_id: 2}
])

# Memberships
Membership.create([
    {user_id: 1, bookclub_id: 1, is_host: true},  
    {user_id: 2, bookclub_id: 2, is_host: false},
    {user_id: 3, bookclub_id: 3, is_host: false},
    {user_id: 1, bookclub_id: 2, is_host: false},
    {user_id: 3, bookclub_id: 2, is_host: true},
    {user_id: 2, bookclub_id: 3, is_host: true}
])
    

# Genres
Genre.create([
    {name: "Fantasy"}, {name: "Romance"}, {name: "Classic"}, {name: "Mystery"},
    {name: "Science Fiction"}, {name: "Non-Fiction"}
])

# Books
Book.create([
    {genre_id: 1, title: "ACOTAR", author: "Sarah J Maas"}, 
    {genre_id: 2, title: "Beach Read", author: "Emily Henry"}, 
    {genre_id: 3, title: "Anna Karenina", author: "Leo Tolstoy"},
    {genre_id: 1, title: "Mistborn", author: "Brandon Sanderson"}, 
    {genre_id: 2, title: "It Ends With Us", author: "Colleen Hoover"}, 
    {genre_id: 3, title: "Alice In Wonderland", author: "Lewis Carroll"}
])

# BookclubBooks
BookclubBook.create([
    {bookclub_id: 1, book_id: 1, month: "July"},
    {bookclub_id: 2, book_id: 2, month: "May"},
    {bookclub_id: 3, book_id: 3, month: "February"},
    {bookclub_id: 1, book_id: 4, month: "June"},
    {bookclub_id: 2, book_id: 5, month: "July"},
    {bookclub_id: 3, book_id: 6, month: "July"}
])

# DiscussionQuestions
DiscussionQuestion.create([
    {bookclub_id: 1, body: "How do the masks of the High Fae affect the story?"},
    {bookclub_id: 1, body: "What do you think of Tamlin\’s participation in the High Rite?"},
    {bookclub_id: 1, body: "Discuss the theme of familial bonds in the novel. How does a person\’s family determine who he or she is?"},
    {bookclub_id: 2, body: "What traditional romance tropes do you see used in Beach Read? In what ways does the book deviate from or subvert romance tropes."},
    {bookclub_id: 2, body: "If you could visit one setting from the book, with one of its characters, whom and where would you choose? "},
    {bookclub_id: 2, body: "Did January’s father deserve her forgiveness? Has she truly forgiven him?"},
    {bookclub_id: 3, body: "Why does Anna refuse a divorce the first time it's offered, when Karenin forgives her over her supposed deathbed?"},
    {bookclub_id: 3, body: "How does Tolstoy use Anna Karenina as an argument for a particular kind of \'good life\'?"},
    {bookclub_id: 3, body: "What other ways could Tolstoy have represented an adulteress?"}
])


puts "Done seeding. 🌱 "