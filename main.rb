
# create Bookmaker
bookie = Bookmaker.find_or_create_by_name("Pinnacle")
bookie2 = Bookmaker.find_or_create_by_name("Bet365")

# create bookiegame
bookie1game1 = BookieGame.find_or_initialize_by_team1_and_team2("LA Lakers", "Pittsburgh") do |g|
  g.sport = "Football"
  g.league = "NFL"
end

bookie2game1 = BookieGame.find_or_initialize_by_team1_and_team2("Lakers", "Pittsburgh Pirates") do |g|
  g.sport = "American F"
  g.league = "nfl"
end

bookie1game2 = BookieGame.find_or_initialize_by_team1_and_team2("Chicago Bears", "New York Yankees") do |g|
  g.sport = "Football"
  g.league = "NFL"
end

bookie2game2 = BookieGame.find_or_initialize_by_team1_and_team2("CH Bears", "NY Yankees") do |g|
  g.sport = "American F"
  g.league = "nfl"
end

# connect bookie with games
bookie.bookie_games.push(bookie1game1, bookie1game2)
bookie2.bookie_games.push(bookie2game1, bookie2game2)

# Bookie: Pinnacle
# Game: LA Lakers vs Pittsburgh
# Bet: over/under 2.5
odd11 = Odd.find_or_create_by_bookie_game_id_and_betname(bookie1game1.id, "over/under 2.5") do |o|
  o.odd1 = 1.7
  o.odd2 = 2.5
end
# Bookie: Pinnacle
# Game: LA Lakers vs Pittsburgh
# Bet: moneyline
odd12 = Odd.find_or_create_by_bookie_game_id_and_betname(bookie1game1.id, "moneyline") do |o|
  o.odd1 = 2.1
  o.odd2 = 1.9
end
# Bookie: Pinnacle
# Game: LA Lakers vs Pittsburgh
# Bet: handicap -1.5
odd13 = Odd.find_or_create_by_bookie_game_id_and_betname(bookie1game1.id, "handicap -1.5") do |o|
  o.odd1 = 1.8
  o.odd2 = 2.3
end

# Bookie: Pinnacle
# Game: Chicago Bears vs NY Yankees
# Bet: over/under 2.5
odd21 = Odd.find_or_create_by_bookie_game_id_and_betname(bookie1game2.id, "over/under 2.5") do |o|
  o.odd1 = 1.3
  o.odd2 = 3.9
end
# Bookie: Pinnacle
# Game: Chicago Bears vs NY Yankees
# Bet: moneyline
odd22 = Odd.find_or_create_by_bookie_game_id_and_betname(bookie1game2.id, "moneyline") do |o|
  o.odd1 = 1.8
  o.odd2 = 2.2
end
# Bookie: Pinnacle
# Game: Chicago Bears vs NY Yankees
# Bet: handicap -1.5
odd23 = Odd.find_or_create_by_bookie_game_id_and_betname(bookie1game2.id, "handicap -1.5") do |o|
  o.odd1 = 1.754
  o.odd2 = 3.15
end




# Bookie: Bet365
# Game: LA Lakers vs Pittsburgh
# Bet: Über/Unter 2,5
odd31 = Odd.find_or_create_by_bookie_game_id_and_betname(bookie2game1.id, "Über/Unter 2,5") do |o|
  o.odd1 = 1.65
  o.odd2 = 2.4
end
# Bookie: Bet365
# Game: LA Lakers vs Pittsburgh
# Bet: Sieg
odd32 = Odd.find_or_create_by_bookie_game_id_and_betname(bookie2game1.id, "Sieg") do |o|
  o.odd1 = 2.0
  o.odd2 = 1.75
end
# Bookie: Bet365
# Game: LA Lakers vs Pittsburgh
# Bet: Handi 1,5
odd33 = Odd.find_or_create_by_bookie_game_id_and_betname(bookie2game1.id, "Handi 1,5") do |o|
  o.odd1 = 1.7
  o.odd2 = 2.35
end

# Bookie: Bet365
# Game: Chicago Bears vs NY Yankees
# Bet: Über/Unter 2,5
odd41 = Odd.find_or_create_by_bookie_game_id_and_betname(bookie2game2.id, "Über/Unter 2,5") do |o|
  o.odd1 = 1.2
  o.odd2 = 3.5
end
# Bookie: Bet365
# Game: Chicago Bears vs NY Yankees
# Bet: Sieg
odd42 = Odd.find_or_create_by_bookie_game_id_and_betname(bookie2game2.id, "Sieg") do |o|
  o.odd1 = 1.7
  o.odd2 = 2.25
end
# Bookie: Bet365
# Game: Chicago Bears vs NY Yankees
# Bet: Handi 1,5
odd43 = Odd.find_or_create_by_bookie_game_id_and_betname(bookie2game2.id, "Handi 1,5") do |o|
  o.odd1 = 1.70
  o.odd2 = 3.25
end

# save odds
odd11.save
odd12.save
odd13.save
odd21.save
odd22.save
odd23.save
odd31.save
odd32.save
odd33.save
odd41.save
odd42.save
odd43.save


# save bookiegames
bookie1game1.save!
bookie1game2.save!

bookie2game1.save!
bookie2game2.save!



# Read Game

games = Game.find(:all)
games.each do |game|
  puts "+++++++++++++++"
  puts "#{Teamname.find(game.team1_id).name} vs. #{Teamname.find(game.team2_id).name}" unless game.team1_id.nil? or game.team2_id.nil? 
  game.bookie_games
  puts "#{game.bookie_games.size} BookieGames mapped"
  game.bookie_games.each do |bookiegame|
    puts "\t#{bookiegame.bookmaker.name}: #{bookiegame.team1} vs. #{bookiegame.team2} playing #{bookiegame.sport} in #{bookiegame.league}"
    bookiegame.odds.each do |odd|
      puts "\t\t#{odd.bet.bet.name} => #{odd.odd1} - #{odd.odd2}"
    end
  end
   
  puts "--------------"
end

# list unmapped teamnames
Teamname.unmapped.each do |u|
  puts "#{u.bookmaker.name}: #{u.name}"
end


