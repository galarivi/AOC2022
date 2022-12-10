using Base.Cartesian

input = open("Day 8\\input.txt","r");
F = reduce(vcat,[[parse(Int,c) for c in l] for l in readlines(input)]')

function visible(F,i_1,i_2)
    cur = F[i_1,i_2]
    L = F[i_1,1:i_2-1]
    R = F[i_1,i_2 + 1:end] 
    U = F[1:i_1-1,i_2] 
    D = F[i_1+1:end,i_2] 

    Ls = sum(t->t>=cur,L, init=0)
    Rs = sum(t->t>=cur,R, init=0)
    Us = sum(t->t>=cur,U, init=0)
    Ds = sum(t->t>=cur,D, init=0)

    return min(Ls,Rs,Us,Ds) == 0 ? 1 : 0
end

function view(F,i_1,i_2)
    
    cur = F[i_1,i_2]
    L, R, U, D = (0,0,0,0)
    
    for i in i_1-1:-1:1
        U += 1
        if F[i,i_2] >= cur break end
    end
    for i in i_1+1:size(F,1)
        D += 1
        if F[i,i_2] >= cur break end
    end
    for j in i_2-1:-1:1
        L += 1
        if F[i_1,j] >= cur break end
    end
    for j in i_2+1:size(F,2)
        R += 1
        if F[i_1,j] >= cur break end
    end

    #@show (i_1,i_2), cur, (L,R,U,D), L*R*U*D
    return L*R*U*D
end

s = 0
@nloops 2 i F begin global s += visible(F,i_1,i_2) end

m = 0
@nloops 2 i F begin  global m = view(F,i_1,i_2) > m ? view(F,i_1,i_2) : m end

@show s;
@show m;

