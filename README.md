# Badminton League Manager

A simple Ruby on Rails web application to manage a badminton league. Users can create players, record match results, and view rankings based on performance.

Repository: https://github.com/Kedar147/badminton-league/

---

## Features

### Player Management

* Add new players
* View all players
* Delete players (restricted if match history exists)

### Match Tracking

* Record match results between players
* Select winner first, then loser (guided UI flow)
* Prevent selecting the same player as both winner and loser

### Leaderboard

* Displays players ranked by number of wins
* Shows wins and losses for each player

---

## Design Decisions

* Counter Cache (`wins_count`, `losses_count`)
  Used to optimize leaderboard queries and avoid unnecessary database calls.

* Data Integrity
  Prevent deletion of players with existing matches using model-level validation.

* Validation Strategy
  Backend validation ensures correctness, while frontend validation improves user experience.

* UX Improvements
  Dynamic dropdowns prevent invalid selections and flash messages provide clear user feedback.

---

## Tech Stack

* Ruby 3.2
* Rails 7.1
* SQLite (development)
* Hotwire (Turbo)

---

## Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/Kedar147/badminton-league.git
cd badminton-league
```

### 2. Install dependencies

```bash
bundle install
```

### 3. Setup database

```bash
rails db:create
rails db:migrate
```

### 4. Run the server

```bash
rails s
```

Open in browser:
http://localhost:3000

---

## Running Tests

```bash
rails test
```

---

## Validations

* Player name must be present and unique
* Winner and loser cannot be the same
* Match must have both winner and loser

---

## Future Improvements

* Add authentication
* Add match history view
* Improve UI styling
* Add pagination
* Provide API endpoints

---

## Author

Kedar Dalvi

---

## License

This project is for assessment/demo purposes.
