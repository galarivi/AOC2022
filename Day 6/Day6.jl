input = open("C:\\Users\\Gerald\\Documents\\Code\\AOC2022\\Day 6\\input.txt","r");
lines = readlines(input)[1]

#part 1
id = 4
for i in 4:length(lines)
    t =  lines[i-3:i]
    found = true
    for c in t
        if count(j->(j==c), t) > 1
            found = false
            break
        end
    end
    if found
        @show lines[i-3:i]
        global id = i
        break
    end
end
@show id


#part 2
id = 14
for i in 14:length(lines)
    t =  lines[i-13:i]
    found = true
    for c in t
        if count(j->(j==c), t) > 1
            found = false
            break
        end
    end
    if found
        global id = i
        break
    end
end
@show id