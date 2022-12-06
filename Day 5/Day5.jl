
input = open("C:\\Users\\Gerald\\Documents\\Code\\AOC2022\\Day 5\\input.txt","r");
lines = readlines(input)

# Get num stacks
ns = 0
for line in lines
    if !occursin("[",line)
        global ns = length(split(strip(line),"   "))
        break
    end
end 
stacks = Dict()
[stacks[b] = [] for b in range(1,ns)]

# Populate Stacks
for line in lines
    if line == "" break end
    sn = 1
    for i = 2:4:length(line)-1
        if Int(line[i]) >= Int('A') && Int(line[i]) <= Int('Z') 
            push!(stacks[sn],line[i])
        end
        sn += 1
    end
end

@show stacks
#pairs = [[[parse(Int,val) for val in split(r,"-")] for r in split(pair,",")] for pair in lines]

# 