require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

#get ("/") do
  "<h1>Dice Roll</h1>

  <ul>
    <li><a href = https://studious-guide-97jj9w9vvwwj2pr4w-4567.app.github.dev/dice/2/6>Roll two 6-sided dice</a></li>

    <li><a href = https://studious-guide-97jj9w9vvwwj2pr4w-4567.app.github.dev/dice/2/10>Roll two 10-sided dice</a></li>

    <li><a href = https://studious-guide-97jj9w9vvwwj2pr4w-4567.app.github.dev/dice/1/20>Roll one 20-sided die</a></li>

    <li><a href = https://studious-guide-97jj9w9vvwwj2pr4w-4567.app.github.dev/dice/5/4>Roll five 4-sided die</a></li>
  </ul>" 
#end

get ("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "We will not have to restart the server anymore."
end

get('/dice/2/6') do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"
  
  "<h1>2d6</h1>
    <p>#{outcome}</p>"
end

get('/dice/2/10') do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"

   "<h1>2d10</h1>
    <p>#{outcome}</p>"
end

get('/dice/1/20') do
  first_die = rand(1..20)
  sum = first_die

  outcome = "You rolled a #{first_die} for a total of #{sum}"

  "<h1>1d20</h1>
    <p>#{outcome}</p>"
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
  
  outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, and #{fifth_die} for a total of #{sum}" 
  
  "<h1>5d4</h1>
    <p>#{outcome}</p>"
end
