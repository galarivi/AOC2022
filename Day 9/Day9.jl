input = open("Day 9\\input.txt","r");
lines = readlines(input)
visited = Set((0,0))
H = (0,0)
T = (0,0)

function follow(H,T)
    diff = (H .- T)
    diff = (diff[1] == 0 ? 0 : diff[1] / abs(diff[1]), diff[2] == 0 ? 0 : diff[2] / abs(diff[2]))
    return Int.(T .+ diff)
end

function move_rope(op, r)
    dirs = Dict("U"=>(0,-1),"D"=>(0,1),"L"=>(-1,0),"R"=>(1,0))
    d, v = split(op, " ")
    v = parse(Int, v)
    vis1 = []
    vis9 = []
    for i in 1:v
        r[1] = r[1] .+ dirs[d]
        for j in eachindex(r[2:end]) .+ 1
            if sum(abs.(r[j-1] .- r[j]) .> (1, 1)) >= 1
                r[j] = follow(r[j-1],r[j])
            end
        end
        push!(vis1,r[2])
        push!(vis9,r[end])
    end
    
    return r, vis1, vis9
end

rope = [(0,0), (0,0), (0,0), (0,0), (0,0), (0,0), (0,0), (0,0), (0,0), (0,0)]
v1 = Set([(0,0)])
v9 = Set([(0,0)])
for op in lines
    global rope, vis1, vis9 = move_rope(op, rope)
    global v1 = union(v1, vis1) 
    global v9 = union(v9, vis9) 
end

# Part 1, Part2
@show length(v1), length(v9);
