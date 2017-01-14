# John
#create 4 pawns in the shape of animals
pawns =["rabbit", "auk", "fox" , "bear"]

# Thommy
#game board - master piece of program (for me ;) )
#change vars depart, pont and arriver (ee) to hash of zones
zones = { ice_field: [pawns[0],pawns[1],pawns[2],pawns[3]] , bridge: [] , snow_house: [] }

# Dana
# create dice
dice  = ["bridge","ice_cube","snow_house","bridge","ice_cube","snow_house"]

# Didier
# Create bridge with 6 pillar
bridge = 6

# many players but one team
puts "How many players in the team : ?"
team = []
(1..gets.to_i).each do |p|
  puts "What's your name player #{p}"
  team << gets.chomp
end

#Ready to play?
puts "Let's start \n"
# Game ends when bridge has no pillar or when all pawns are safe on snow-house land
win = false
while ( bridge != 0 || win == true ) do
  # we calculate result of a dice(6) throw modulo 3
  throw = (rand(6)) % 3
  if throw == 0
    puts "#{dice[throw]} case 0 or 3 : bridge"
  elsif throw == 1
    puts "#{dice[throw]} case 1 or 4 : break a pillar"
    bridge -= 1
    puts "==> Oup's it remains only #{bridge} pillar(s) to maintain the bridge!"
  else
    puts "#{dice[throw]} case 2 or 5 : snow-house"
  end
end


=begin
def dice_roll
    face= dice.sample

    if face=="bridge"
    puts "You just drew a #{face}! You can move forward"
    elsif face=="snow_house"
    puts "You just drew a #{face}! You're on the safe side!"
    elsif face=="ice_cube"
    puts " Outch!! You just drew an #{face}! You're sinking'"
    end

end




# Thommy
# End of game
def end_of_game bridge
    if bridge != 0
        puts "replay"
    else
        puts "game over"
    end
end

puts end_of_game 0

=end
