# Read Game

games = Game.find(:all, :include => { :odds => :bet })
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
  
  ActiveRecord::Base.logger.info("LOS GEHTS")
   
=begin
 puts "--Odd--"
odds_by_betid = {};
game.odds.find(:all, :include => :bet).each do |odd|
  if (odds_by_betid.has_key? odd.bet.id)
    odds_by_betid[odd.bet.id][:odds].push odd
  else
    odds_by_betid[odd.bet.id] = { :bet => odd.bet, :odds => [odd] }
  end
end

odds_by_betid.each_pair { |betid,betinfo|
  puts "Bet: #{betinfo[:bet].name}:"
  betinfo[:odds].each {
    |odd|
    puts "  #{odd.odd1} - #{odd.odd2}"
  }
}
=end

puts "--Odd--"
game.odds_by_bet.each_pair { |betid,betinfo|
  puts "Bet: #{betinfo[:bet].name}:"
  betinfo[:odds].each {
    |odd|
    puts "  #{odd[:bookmaker].name}: #{odd[:odd].odd1} - #{odd[:odd].odd2}"
  }
}

puts "+++++++"

ActiveRecord::Base.logger.info("ENDE")

end

# list unmapped teamnames
Teamname.unmapped.each do |u|
  puts "#{u.bookmaker.name}: #{u.name}"
end