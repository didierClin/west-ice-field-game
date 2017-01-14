###################################
#  Prepare the game

# John
#create 4 pawns in the shape of animals
pawns =["rabbit", "auk", "fox" , "bear"]

# Thommy
#game board - master piece of program (for me ;) )
#change vars depart, pont and arriver (ee) to hash of areas
# areas = { ice_field: [pawns[0],pawns[1],pawns[2],pawns[3]] , bridge: [] , snow_house: [] }
areas = { ice_field: [pawns[0],pawns[1],pawns[3]] , bridge: [pawns[2]] , snow_house: [] }
# areas = { ice_field: [] , bridge: [] , snow_house: [pawns[0],pawns[1],pawns[2],pawns[3]] }

# Dana
# create dice
dice  = ["bridge","ice_cube","snow_house","bridge","ice_cube","snow_house"]

# Didier
# Create bridge with 6 pillar
bridge = 6

def check_area(areas_to_check, area)
  area = area.to_sym
  area.inspect
  ###################################
  # care area is now a masqued symbol
  size = areas_to_check[area].count if areas_to_check[area]
  if areas_to_check[area]
    puts "\n it remains #{areas_to_check[area].size} animals : #{(0..size-1).map  {|i| areas_to_check[area][i]}}"
    puts "   witch animal(s) do you want to move ? "
    puts "   please give it's place"
    (gets.to_i) - 1
  else
    puts "nobody's here !"
  end
end

# many players but one team
puts "How many players in the team : ?"
team = []
(1..gets.to_i).each do |p|
  puts "What's your name player #{p}"
  team << gets.chomp
end

###################################
#Ready to play?
puts "Let's start \n"
# Game ends when bridge has no pillar or when all pawns are safe on snow-house land
win = false
player = 0
while ( bridge != 0 && !win ) do
  puts "It's your turn #{team[0]} - roll the dice ?"
  gets
  # we calculate result of a dice(6) throw modulo 3
  throw = (rand(6)) % 3
  if throw == 0
    puts ">> #{dice[throw]}  case 0 or 3 : bridge"
    # ask player which animal he want move to the bridge if someone is always in fishing place
    # ask method with ice_field symbol cast to string
    mover = check_area(areas, :ice_field.to_s)
    if mover.respond_to? :/
      puts mover
      puts "#{mover} #{pawns[mover]} move to the Bridge"

    end
  elsif throw == 1
    puts ">> #{dice[throw]}  case 1 or 4 : break a pillar"
    bridge -= 1
    puts "==> Oup's it remains only #{bridge} pillar(s) to maintain the bridge!"
  else
    puts ">> #{dice[throw]}  case 2 or 5 : snow-house"
    win = true if areas[:snow_house].size == 4
    check_area(areas, :bridge.to_s)
  end
  player = (player + 1) % team.size
end

puts win == true ? "Yeah great job of your Team. You do the job and save our friends !!" : "Oh no! our friends are not saved !! maybe the next time."
