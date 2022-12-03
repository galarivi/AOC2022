input = open("C:\\Users\\Gerald\\Documents\\Code\\AOC2022\\Day 3\\input.txt","r");
lines = readlines(input);

compartments = [(SubString(l,1,Int(length(l)/2
)), SubString(l,Int(length(l)/2+1),length(l))) for l in lines]

function priority(c) 
    if Int(c) >= 65 && Int(c) <= 90
        return Int(c) - 65 + 27
    else
        return Int(c) - 96
    end
end

m = []
for pair in compartments
    for c in pair[1]
        if findfirst(c,pair[2]) !== nothing
            push!(m,c)
            break
        end
    end
end

#Part 1 answer
sum([priority(c) for c in m])

b = []
for i in 1:3:length(lines)
    e1 = lines[i]
    e2 = lines[i+1]
    e3 = lines[i+2]
    
    for c in e1
        if findfirst(c,e2) !== nothing && findfirst(c,e3) !== nothing
            push!(b,c)
            break
        end
    end
end

sum([priority(c) for c in b])