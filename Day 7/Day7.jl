input = open("Day 7\\input.txt","r");
lines = readlines(input)

function ls(i, lines, dir, t)
    i = i+1
    while i <= length(lines) && split(lines[i], " ")[1] != "\$"  
        l = split(lines[i], " ")
        if l[1] == "dir"
            push!(t[dir][1], dir*"/"*l[2]) 
            if !haskey(t, l[2])  t[dir * "/" *l[2]] = ([],[], 0) end
        else
            s = parse(Int, l[1])
            n = l[2]
            push!(t[dir][2], (s, n))
        end 
        i += 1
    end
    return i, t
end

function get_parent(dir, t)
    for (k, v) in t
        if length(findall(x->x==dir, v[1])) >= 1 return k end
    end
end

function parse_cmd(i, lines, dir, t)
    cmd = split(lines[i], " ")
    if cmd[1] == "\$"
        if cmd[2] == "cd"
            if cmd[3] == ".."
                dir = join(split(dir,"/")[1:end-1], "/")
            elseif  cmd[3] == "/"
                dir = "/"
            else
                dir = dir *"/"*cmd[3]
            end 
            i += 1
        elseif cmd[2] == "ls"
            i, t = ls(i, lines, dir, t)
        end 
    end

    return i, dir, t
end   

t = Dict()
t["/"] = ([],[], 0)
dir = "/"
i = 1
while i <= length(lines)
    global i, dir, t = parse_cmd(i, lines, dir, t)
end

function tot_size(dir, t)
    size = length(t[dir][2]) > 0 ? sum(f[1] for f in t[dir][2]) : 0
    
    for k in t[dir][1]
        if t[k][3] != 0
            size += t[k][3]
        else
            ts, t = tot_size(k, t)
            t[k] = (t[k][1], t[k][2], ts)
            size +=ts 
        end
    end
    return size, t
end
s = 0
for (k, v) in t
    global ts, t = tot_size(k, t) 
    if ts <= 100000  global s += ts end
end
 
s

t_index = []

for (k, v) in t
    push!(t_index, (k, v[3]))
end

space_needed = 30000000 - (70000000 - tot_size("/",t)[1])
sort!(t_index, by= x-> x[2])

for i in 1:length(t_index)
    if t_index[i][2] > space_needed
        @show t_index[i]
        break
    end
end
