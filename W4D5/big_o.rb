def sluggish_octopus(fishes)
    biggest_fish = nil
    fishes.each do |fish1|
        biggest = true
        fishes.each do |fish2|
            if fish1 < fish2
                biggest = false
                break
            end 
        end
        biggest_fish = fish1 if biggest = true
    end
    biggest_fish
end


def dominant_octopus(fishes)
    fishes.sort_by(&:length)[-1]
end


def clever_octopus(fishes)
    raise "No fishes for octopus to catch" if fishes.nil? || fishes.empty?

    biggest_fish = fishes[0]
    fishes[1..1].each { |fish| biggest_fish = fish if biggest_fish.length < fish.length }
end

# Examples
fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish_octopus(fishes)
p dominant_octopus(fishes)
p clever_octopus(fishes)

# ==================================================================================================

def slow_dance(tile, tiles_array)
    tiles_array.each_with_index { |direction, i| return i if direction == tile }
end

# Examples
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)


def fast_dance(tile, tiles_hash)
    tiles_hash[tile]
end

# Examples
tiles_hash = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6,  "left-up"=>7}
p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)