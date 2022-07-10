function letter_to_char_code(letter)
    letter = string.lower(letter)
    return string.byte(letter) - 96
end

function lettersum(word)
    local sum = 0

    for i = 1, #word do
        sum = sum + letter_to_char_code(word:sub(i, i))
    end

    return sum
end

assert(lettersum("") == 0)
assert(lettersum("a") == 1)
assert(lettersum("z") == 26)
assert(lettersum("cab") == 6)
assert(lettersum("excellent") == 100)
assert(lettersum("microspectrophotometries") == 317)
