local function roman_lt(numerals, other_numerals)
    local numeral_map = {
        ['I'] = 1,
        ['V'] = 5,
        ['X'] = 10,
        ['L'] = 50,
        ['C'] = 100,
        ['D'] = 500,
        ['M'] = 1000,
    }

    local int_value = 0
    local other_int_value = 0

    for i = 1, #numerals do
        int_value = int_value + numeral_map[numerals:sub(i, i)]
    end

    for i = 1, #other_numerals do
        other_int_value = other_int_value + numeral_map[other_numerals:sub(i, i)]
    end

    return int_value < other_int_value
end

assert(roman_lt('I', 'I') == false)
assert(roman_lt('I', 'II') == true)
assert(roman_lt('II', 'I') == false)
assert(roman_lt('V', 'IIII') == false)
assert(roman_lt('MDCLXV', 'MDCLXVI') == true)
assert(roman_lt('MM', 'MDCCCCLXXXXVIIII') == false)
