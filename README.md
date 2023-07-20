# README

Welcome to the BookClub API

To get started, run "bundle install"
There is seed data in the seeds file ready to go. 
ADMIN: The seed data includes one admin user, any other users created will not be admin. 

What are the API endpoints?

///// GETTING INFO /////

GET "/bookclubs" - Will list all bookclubs currently listed in the database, along with a description of the club and their current monthly book pick.

GET "/bookclubs/:id" - Will list a specific bookclubs information including: name, description, current book, previous books, and this months discussion questions"

GET "/bookclubs/:id/memberships" - Lists the chosen bookclub's current members, starting with the host

GET 'bookclubs/:id/discussion_questions" - Lists all of the discussion questions currently assigned to the bookclub and any comments left on those questions with the associated User info.

GET "/genres" - Will list all genres
GET "/genres/:id" - Will list any bookclubs associated with that genre 

GET "/books" - Will list all books
GET "/books/:id - Will list any bookclubs associated with that book

///// CREATING A BOOKCLUB /////

POST "/bookclubs" - Will create a bookclub with the current user as the host
    expecting: {
        "name": "name of bookclub",
        "description: "description of bookclub"
    }

DELETE 'bookclubs/:id' - Deletes a bookclub IF the current user is the host.

POST "bookclubs/:id/bookclub_books" - Assigns a book to a bookclub IF current user is the host
    expecting: {
        "book_id" : Integer,
        "month" : Full name of month
    }

POST 'bookclubs/:id/discussion_questions" - Creates a discussion question for the chosen bookclub IF current user is the host.
    expecting: {
        "body" : "Write your question here."
    }

DELETE 'bookclubs/:bookclub_id/discussion_questions/:id" - Deletes the chosen discussion question IF the current user is the host. 

///// JOINING A BOOKCLUB /////

POST "/bookclubs/:id/memberships" - Creates a membership between the current user and the chosen bookclub if such a membership is not already established
    expecting: nothing

POST 'bookclubs/:bookclub_id/discussion_questions/:id/comments" - Leaves a comment on chosen discussion question IF the current user has a membership with the chosen bookclub.
    expecting: {
        "body" : "Write your comment here."
    }

DELETE 'bookclubs/:bookclub_id/discussion_questions/:discussion_question_id/comments/:id' - deletes a comment IF the comment was created by the current user.

///// ADMIN CAPABILITIES /////

GET '/users' - Get full list of users with BookClub App accounts IF you are an admin

POST '/books' - Create a book to be added to the database IF you are an admin
    expecting: {
        "genre_id" : Integer,
        "title" : "Title of book",
        "author" : "Author name"
    }

DELETE '/books' - Delete a book from database IF you are an admin

