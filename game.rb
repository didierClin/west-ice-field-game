# By Dhana, John, Timmy and Didier
###################################
#  Prepare the game

#game board - master piece of program (for me ;) )
areas = { ice_field: ["rabbit", "auk", "fox",  "bear"] , bridge: [] , snow_house: [] }
# areas = { ice_field: ["rabbit", "auk",  "bear"] , bridge: ["fox"] , snow_house: [] }

# create dice
dice  = ["bridge","ice_cube","snow_house","bridge","ice_cube","snow_house"]

# Initialize bridge with 6 pillar
bridge = 6

def check_area(areas_to_check, area)
  area = area.to_sym
  ###################################
  # care area is now a masqued symbol
  size = areas_to_check[area].count if areas_to_check[area]
  # check if there is a animals on area
  if areas_to_check[area].count == 0
    puts " #{area} : nobody's here !"
    puts "Hit a key!"
    gets
    return 999 #return a number outside of range
  end

  puts "\n it remains #{areas_to_check[area].size} animals : #{(0..size-1).map  {|i| areas_to_check[area][i]}}"
  puts "   witch animal(s) do you want to move ? n   please give it's place"
  (gets.to_i) - 1
end

# not sure of the utility but make it dry as much as possible
def move(areas_to_check, area_from, area_to, which_mover)
  area_from = area_from.to_sym
  if  areas_to_check[area_from].include? areas_to_check[area_from][which_mover]
    puts "-------- #{areas_to_check[area_from][which_mover]} move to the Snow House"
    areas_to_check[area_to.to_sym] << areas_to_check[area_from].delete_at(which_mover)
  end
end

# many players but one team
puts "How many players in the team : ?"
team = []
(1..gets.to_i).each do |p|
  puts "What's your name player #{p}"
  team << gets.chomp.capitalize
end

###################################
#Ready to play?
puts "Let's start \n"
# Game ends when bridge has no pillar or when all pawns are safe on snow-house land
win = false
player = 0
while ( bridge != 0 && !win ) do
  # clear the screen and display infos
  puts `clear` ; puts areas
  puts "\n\n The bridge has #{bridge} pillar(s)."
  puts "\n\nIt's your turn #{team[player]} - Please roll the dice ?"
  gets
  # we calculate result of a dice(6) throw modulo 3 as symbols on dice repeat twice
  throw = (rand(6)) % 3
  if throw == 0
    puts ">> #{dice[throw]}  case 0 or 3 : bridge"
    # ask player which animal he want move to the bridge if someone is always in fishing place
    # ask method with ice_field symbol cast to string
    mover = check_area(areas, :ice_field.to_s)
    move(areas, :ice_field.to_s, :bridge.to_s , mover)
  elsif throw == 1
    puts ">> #{dice[throw]}  case 1 or 4 : break a pillar"

    puts "\n ==> Oup's it remains only #{bridge -= 1} pillar(s) to maintain the bridge!\n"
    if bridge != 0
      puts "Hit a key!"
      gets
    end
  else
    puts ">> #{dice[throw]}  case 2 or 5 : snow-house"
    mover = check_area(areas, :bridge.to_s)
    move(areas, :bridge.to_s, :snow_house.to_s , mover)
  end
  win = true if areas[:snow_house].size == 4
  player = (player + 1) % team.size
  puts
end

puts win == true ? "Yeah great job of your Team. You do the job and save our friends !!" : "Oh no! our friends are not saved !! maybe the next time."
