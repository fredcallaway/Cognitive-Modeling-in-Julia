
# ---------- simple non-standard syntax ---------- #

# string concatenation

@assert "foo" * "bar" == "foobar"
@assert "foo" ^ 3 == "foofoofoo"

# vector concatenation

a = [1,2]
b = [3,4]
c = 5
@assert [a; b; c] == [1,2,3,4,5]

# one-indexing... sorry

x = [1,2,3]
@assert x[1] == 1

# matrix notation

x = [
    1 3
    2 4
]

@assert x[1] == 1
@assert x[2] == 2  # column-major!
@assert x[:, 1] == [1,2]
@assert x[1, :] == [1, 3]

# functions return the last statement

function add(x, y)
    x + y
end
@assert add(1, 2) == 3

# short definition for one-line functions

subtract(x, y) = x - y
@assert subtract(3, 1) == 2

# auto-return works with if-else

function if_else(cond, if_true, if_false)
    if cond
        if_true
    else
        if_false
    end
end

@assert if_else(false, 1, 2) == 2

# broadcasting with .

@assert [1,2,3] .* 2 == [2,4,6]
@assert add.([1,2,3], [4,5,6]) == [5,7,9]

# string interpolation
x = 1
y = 2

@assert "x = $(c); 2y = $(2*y)" == "x = 5; 2y = 4"

# named tuples

nt = (x = 1, y = 2)
@assert nt.x == 1
@assert nt.y == 2

# namedtuples automatically takes variable names )

x = 1; y = 2
@assert (;x, y) == nt

# this works for keword arguments too, anything that follows a semi colon (;)

foo(x; y) = x, y
@assert foo(x; y) == (1, 2)

# ternary operator

if_else2(cond, a, b) = cond ? a : b
@assert if_else2(false, 1, 2) == if_else(false, 1, 2) == 2
# in python: a if cond else b

# short cirtcuit
x = true && error("won't run")

function less_than_8(x)
    x < 8 && return true
    return false
end

for i in 1:8
    i == 4 && continue
    i == 4 && error("won't run")
    i == 5 && break
    i == 6 && error("won't run")
end

# ---------- do blocks ---------- #

result = map([1,2,3]) do x
    if iseven(x)
        x
    else
        x * 2
    end
end
@assert result == [2,2,6]

new_result = filter(result) do x
    x > 2
end
@assert new_result == [2]

@assert sum([1,2,3]) do x
    x ^ 2
end == 1 + 4 + 9

using Optim
res = optimize(0, 5) do x
    (x - 3) ^ 2
end
@assert res.minimizer == 3


# ---------- multiple dispatch ---------- #

likelihood(x::Bool; p) = x ? p : (1-p)

likelihood(xs::Vector{Bool}; p) = prod(xs) do x
    likelihood(x; p)
end

@assert likelihood(false; p=.2) == .8
@assert likelihood([true, true, false]; p=.3) == .3 * .3 * .7


# ---------- custom types (structs) ---------- #

struct Trial
    choice::Int
    rt::Float64
end

t = Trial(3, 3.2)
@assert t.choice == 3
@assert t.rt == 3.2

