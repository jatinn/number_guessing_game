defmodule Game do
	defp play(secret_number) do
		input = IO.gets "Please input your guess (1-100): "
		input = 
			try do
				input |> String.rstrip |> String.to_integer
			rescue
				ArgumentError -> -1
			end
		end

		case input do
			_ when input < 0 ->
				IO.puts "Please input a number!"
				play(secret_number)
			_ when input < secret_number ->
				IO.puts "Too small!"
				play(secret_number)
			_ when input > secret_number ->
				IO.puts "Too big!"
				play(secret_number)
			_ ->
				IO.puts "You Win!"
		end
	end

	def main do
		:random.seed(:erlang.now)
		IO.puts "Guess the number!"
		secret_number = :random.uniform(100)
		play(secret_number)
	end
end