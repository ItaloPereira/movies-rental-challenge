# Movie Rental API - Technical Challenge

## Overview

Welcome to the Movie Rental API technical challenge! This is a Ruby on Rails project that has been set up with basic models for `User` and `Movie`, and a `MoviesController` with some defined endpoints.

This application simulates part of a movie rental system, where users can rent movies, have favorite movies, and get recommendations based on their favorites.

Your task is to review the existing code, open Pull Requests to suggest any improvements, enhancements, or bug fixes, and reevaluate the existing business logic to propose your own improvements. While the application is functional as it stands, there is always room for improvement!

This project is configured for [Github Codespaces](https://github.com/codespaces), which allows you to work on the project in a fully configured, remote development environment. Feel free to use this feature and create a new Codespace for your repository to make the task execution easier.

The project also includes a seed file that pre-populates the database with users and movies, making it easier for you to test your changes.

## Existing Endpoints

### 1. `GET /movies`

This endpoint retrieves all the movies in the database and returns them in JSON format. Each movie object includes its `id`, `title`, `genre`, `rating`, and the number of `available_copies`.

### 2. `GET /movies/recommendations?user_id=<user_id>`

This endpoint generates a list of movie recommendations for a given user. It uses a basic recommendation engine that takes the user's favorite movies as input and generates recommendations based on those favorites. The response is a JSON array of recommended movie objects.

### 3. `GET /movies/user_rented_movies?user_id=<user_id>`

This endpoint retrieves all the movies that a user has currently rented. The user is identified by the `user_id` parameter in the URL. The response is a JSON array of movie objects that the user has rented.

### 4. `GET /movies/<movie_id>/rent?user_id=<user_id>`

This endpoint allows a user to rent a movie. The user is identified by the `user_id` parameter and the movie by the `id` parameter in the URL. 

If successful, it reduces the number of `available_copies` of the movie by 1 and adds the movie to the user's `rented` movies. The response is a JSON object of the rented movie.

## Your Task

1. **Cloning the repository**: Start by [cloning](https://docs.github.com/en/repositories/creating-and-managing-repositories/duplicating-a-repository) this repository to your local machine, then push it to your own GitHub account. Please, do not fork the repository, otherwise, other candidates will be able to see your solution.
2. **Suggesting changes**: Review the existing code and create Pull Requests (PR) with your proposed changes and explanations, based on the following aspects:
   - **Bad functioning**: Identify any issues (bugs, inefficiencies, etc.).
   - **Refactoring**: If necessary, refactor parts of the code to improve its quality and maintainability. Be sure to explain your reasoning in your PR.
   - **Rethinking the Business Logic**: Feel free to reevaluate the current business logic and assumptions that were previously made. If you have an alternative solution that makes more sense, or would improve the application, please propose it.

### Important Note

Remember, the main goal of this challenge is not to write a fully-functional application, but rather to demonstrate your coding, problem-solving, and communication skills. We value clean and efficient code, and we appreciate creative and thoughtful solutions to problems.

The code has dozens of potential improvements, and we don't expect you to work on all of them. Feel free to prioritize the ones you consider most important to address in **about 3 hours of work**.

_**Happy Coding!**_
