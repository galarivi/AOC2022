
input = open("C:\\Users\\Gerald\\Documents\\Code\\AOC2022\\Day 5\\input.txt","r");
lines = readlines(input);

ns = 0
# Get Stack size
for line in lines
    if ! contains(line,"[") 
        global ns = length(split(strip(line),"   "))
        break
    end
end

#initialize stacks for part 1 and 2
stacks = Dict()
[stacks[b] = [] for b in 1:ns]
stacks2 = Dict()
[stacks2[b] = [] for b in 1:ns]
ops = []

#Populate stacks and ops
for (fp, line) in enumerate(lines)
    if contains(line,"[")
        for i in 1:ns
            j = (i-1)*4
            if Int(line[2+j]) >= Int('A') &&   Int(line[2+j]) <= Int('Z')
                push!(stacks[i], line[2+j])
                push!(stacks2[i], line[2+j])
            end
        end
    elseif  line == "" 
        global ops = lines[fp+1:end]
        break 
    end
end

#Part 1
function parse_op(stacks, op)
    tmp = copy(stacks)
    vals = split(op," ")
    count = parse(Int,vals[2])
    s = parse(Int,vals[4])
    e = parse(Int,vals[6])

    q = [];
    for a in 1:count
        push!(q,popfirst!(tmp[s]))
    end
    for a in 1:count
        pushfirst!(tmp[e], popfirst!(q))
    end
    return tmp
end

#Part 2
function parse_op2(sts, op)
    tmp = copy(sts)
    vals = split(op," ")
    count = parse(Int,vals[2])
    s = parse(Int,vals[4])
    e = parse(Int,vals[6])
    q = tmp[s][1:count];
    tmp[s] = tmp[s][count+1:end]

    for a in 1:count
        pushfirst!(tmp[e], pop!(q))
    end
    return tmp
end

[global stacks = parse_op(stacks,op) for op in ops]
[global stacks2 = parse_op2(stacks2,op) for op in ops]
str1 = ""
str2 = ""
for i in 1:ns
    global str1 = str1 * string(stacks[i][1])
    global str2 = str2 * string(stacks2[i][1])
end

@show str1
@show str2