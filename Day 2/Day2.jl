### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ f4f28600-71fe-11ed-2eaa-f1ce0516837a
input = open("C:\\Users\\Gerald\\Documents\\Code\\AOC2022\\Day 2\\input.txt","r")

# ╔═╡ b8dc7548-cf68-4ac8-974c-af464aef8ef5
d = readlines(input)

# ╔═╡ 5ae6e7ad-b198-44dc-b130-6b086de719c3
shape_score = Dict('X'=>1, 'Y'=>2, 'Z'=>3)

# ╔═╡ 7c5665f7-f826-444b-b209-5fbb493c04ec
choice_map = Dict('A'=>'X','B'=>'Y','C'=>'Z')

# ╔═╡ e98ffa9a-cda0-4e71-9150-850a17d2bfc5
win_map = Dict('A'=>'Y','B'=>'Z','C'=>'X')

# ╔═╡ a7e30e59-23cb-405f-aecc-1ea4e798e051
begin
	score = 0;
	for game in d
		P1 = game[1]
		P2 = game[3]
		if choice_map[P1] == P2
			score += 3
		elseif win_map[P1] == P2
			score += 6
		end
		score += shape_score[P2]
	end
	@show score
end

# ╔═╡ 4161b57b-c822-4f35-9132-15a1167df3d5
# Part 2
begin
	lose_map = Dict('A'=>'Z','B'=>'X','C'=>'Y')
	score2 = 0
	for game in d
		P1 = game[1]
		s = game[3]
		
		if s == 'X'
			P2 = lose_map[P1]
		elseif s == 'Y'
			P2 = choice_map[P1]
		else
			P2 = win_map[P1]
		end

		if choice_map[P1] == P2
			score2 += 3
		elseif win_map[P1] == P2
			score2 += 6
		end
		score2 += shape_score[P2]
	end
	@show score2
end

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
# ╠═f4f28600-71fe-11ed-2eaa-f1ce0516837a
# ╠═b8dc7548-cf68-4ac8-974c-af464aef8ef5
# ╠═5ae6e7ad-b198-44dc-b130-6b086de719c3
# ╠═7c5665f7-f826-444b-b209-5fbb493c04ec
# ╠═e98ffa9a-cda0-4e71-9150-850a17d2bfc5
# ╠═a7e30e59-23cb-405f-aecc-1ea4e798e051
# ╠═4161b57b-c822-4f35-9132-15a1167df3d5
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
