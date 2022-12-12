using Base.Iterators
input = open("Day 11\\input.txt","r");Int
lines = readlines(input)
m = []
m2 = []
for chunk in partition(lines, 7)
    items = parse.(Int, split(split(chunk[2], ": ")[2], ","))
    op = split(chunk[3], " ")[end-1:end]
    div = parse(Int	, split(chunk[4], " ")[end])
    test_t = parse(Int	, split(chunk[5], " ")[end]) + 1 # Julia 1 indexing
    test_f = parse(Int	, split(chunk[6], " ")[end]) + 1
    push!(m,[items, op, div, test_t, test_f, 0])
end
m2 = deepcopy(m)
M = lcm(reduce(vcat,[monk[3]  for monk in m]))

function apply(op, item)
    v = 0
    if op[2] == "old"
        v = item
    else
        v = parse(Int,op[2])
    end

    if op[1] == "+"
        return item + v
    else
        return item * v
    end
end

function round(monkeys, P2)
    for m in monkeys
        while length(m[1]) > 0
            i = popfirst!(m[1])
            v = mod(apply(m[2],i),M)
            if !P2 v = div(v,3) end
            t_id = div(v,m[3]) == v/m[3] ? m[4] : m[5]
            push!(monkeys[t_id][1], v)
            m[6] += 1
        end
    end
end

#P1
for i in 1:20
    round(m, false)
end
@show reduce(*,sort([v[6] for v in m], rev=true)[1:2])

#P2
for i in 1:10000
    round(m2, true)
end
@show reduce(*,sort([v[6] for v in m2], rev=true)[1:2])