input = open("C:\\Users\\Gerald\\Documents\\Code\\AOC2022\\Day 4\\input.txt","r");
lines = readlines(input);
pairs = [[[parse(Int,val) for val in split(r,"-")] for r in split(pair,",")] for pair in lines]

# Part 1

function overlap_completely(pair)
    e1 = pair[1]
    e2 = pair[2]

    if e1[1] <= e2[1] && e1[2] >= e2[2] 
        return true 
    end
    if e1[1] >= e2[1] && e1[2] <= e2[2] 
        return true 
    end
    return false
end

function overlap_part(pair)
    e1 = pair[1]
    e2 = pair[2]

    if e1[1] <= e2[1] <= e1[2]  || e1[1] <= e2[2] <= e1[2]
        return true 
    end
    if e2[1] <= e1[1] <= e2[2]  || e2[1] <= e1[2] <= e2[2]
        return true 
    end
    return false
end

count = 0
for pair in pairs
    if overlap_completely(pair) global count +=1 end
end
@show count
count = 0
for pair in pairs
    if overlap_part(pair) global count +=1 end
end
@show count
;