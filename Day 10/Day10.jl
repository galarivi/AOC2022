input = open("Day 10\\input.txt","r");
lines = readlines(input)

x = [1]
q = []
ptr = 1
for op in lines
    # Start
    push!(q,0)
    if op[1] == 'a' push!(q,parse(Int, split(op, " ")[2])) end
end

for i in 1:length(q)
    push!(x,x[i] + q[i])
end

@show sum([i*x[i] for i in [20,60,100,140,180,220]])


crt = [repeat([repeat(".",38)],6);]

for (i, v) in enumerate(x)
    # + 1 to offset for julias 1 indexing
    row = div((i-1),40) + 1
    pos = mod(i-1,40) + 1
    v = v + 1

    if abs(pos-v) <= 1
        #@show i, v, row, pos
        crt[row] = crt[row][1:pos-2] * "#" * crt[row][pos:end]
    end
end

crt