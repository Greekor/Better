bookie = Bookmaker.find_by_name("Pinnacle")

puts "Pinnacle's teamnames"
puts "--------------------"
Teamname.find_all_by_bookmaker_id(bookie.id).each do |teamname|
  puts "#{teamname.bookmaker}: (#{teamname.id}) #{teamname}"
end
puts "++++++++++++++++++++"

Teamname.unmapped.each do |teamname|
  puts "----------"
  puts "Map #{teamname.bookmaker}: (#{teamname.id}) #{teamname} to?: "
  id = STDIN.readline.to_i
  teamname.map_to id
  teamname.save
  puts ""
  puts "#{teamname.bookmaker}: (#{teamname.id}) #{teamname} mapped to #{teamname.team.bookmaker}: (#{teamname.team.id}) #{teamname.team}"
  puts "++++++++++"
end

