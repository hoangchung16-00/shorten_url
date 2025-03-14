# VERSION
- Ruby (3.3.6)
- Rails (8.0.2)
- SQLite3

# BUILT
1. With local environment
 - Install ruby, rails, sql with specific version
 - Clone repository
 - Run
    + `bundle install`
    + `bin/rails db:create`
    + `bin/rails db:migrate`
    + `rails s` to start server

2. With docker
 - Install docker (Docker version 28.0.1)
 - Clone repository
 - Run `docker compose up`

# API endpoint
 - POST `/encode?url={url}`
 - POST `/decode?short_url={short_url}`
# POTENTIAL ATTACK VECTOR
 - Distributed Denial of Service (DDoS): This prevents users from accessing services and can force site to crash.

# SCALE UP
 - Database Optimization
 - Load Balancing
