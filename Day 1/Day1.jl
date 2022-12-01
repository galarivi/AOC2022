### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ 81bd05f1-7a21-4f8b-85d6-c88a3b2cbed5
input = open("C:\\Users\\Gerald\\Documents\\Code\\AOC2022\\Day 1\\input.txt","r");

# ╔═╡ e4fbb151-ff44-4d05-b9f1-9622ce96cddb
dd = readlines(input);

# ╔═╡ efc24bfd-470d-477f-954c-077167c80e41
begin 
elf_dict = Dict()
cals = [];
for cal in dd
	if cal == ""
		elf_dict[sum(cals)] = cals;
		cals = [];
	else
		push!(cals,parse(Int,cal))
	end
end
sorted = sort!(collect(keys(elf_dict)), rev=true)
end

# ╔═╡ 45037272-7316-430e-b633-6e089535cae7
@show sorted[1]

# ╔═╡ b2f60a88-5606-416f-8560-5b364e1c0273
@show sum(sorted[1:3])

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.0"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╠═81bd05f1-7a21-4f8b-85d6-c88a3b2cbed5
# ╠═e4fbb151-ff44-4d05-b9f1-9622ce96cddb
# ╠═efc24bfd-470d-477f-954c-077167c80e41
# ╠═45037272-7316-430e-b633-6e089535cae7
# ╠═b2f60a88-5606-416f-8560-5b364e1c0273
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
