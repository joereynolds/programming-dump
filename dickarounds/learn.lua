-- #1 - A basic function with an assert
local function list_index(list, index)
    return (list[index])
end

local my_list = {5, 6, 7, 8}

assert(list_index(my_list, 1) == 5, "Number does not match first value of array 5")

-- #2 - Printing a flat table with `pairs`
local my_table_to_print = {name = "Joe Reynolds", age = "27"}
local my_list_to_print = {2, 4, 6, 8, 10}

local function print_table(a_table)
    for key, value in pairs(a_table) do
        print("Key = " .. key)
        print("Value = " .. value)
        print()
    end
end

local function print_list(my_list_to_print)
    for i, v in ipairs(my_list_to_print) do
        print('Index = ' .. i)
        print('Value = ' .. v)
    end
end

print_table(my_table_to_print)
print_list(my_list_to_print)

-- #3 Writing a string to a file
local file = io.open('my-written-file-from-lua.txt', 'w')

for i = 1, 5 do
    file:write(i .. " ")
end

file:close()

-- #4 Reading from a file (depends on #3 to work)
local file_to_read = io.open('my-written-file-from-lua.txt', 'r')
local file_content = file_to_read:read('*all')

assert(file_content == "1 2 3 4 5 ")

file_to_read:close()

-- #5 Iterate over a list
local a_list = {3,7,3,9}

for i = 1, #a_list do
    print(a_list[i])
end

-- #6 Print directory contents

local function scan_directory(directory)
    local files = io.popen('ls ' .. directory)

    local contents = {}

    for filename in files:lines() do
        table.insert(contents, filename)
    end

    return contents
end

scan_directory('/home/joe/programs')

-- #7 Basic object

local Dog = {name = "Rufus"}

function Dog:announce()
    print (self.name)
end

local k = Dog
k:announce()

-- Misc helpers

local function has_value(table, value)
    for i, v in ipairs(table) do
        if v == value then return true end
    end
    return false
end

assert(has_value({1,2,3,4}, 3) == true)

-- A stack









-- #6 Variable number of arguments in function

-- local function as_many_as_you_want(...)
--     local my_table = {}

--     for i, v in ipairs{...} do
--         table.insert(my_table, v)
--     end

--     return my_table
-- end

-- assert(as_many_as_you_want(1,2,3,4,5) == {1,2,3,4,5})
-- # Linked list (WIP)

-- local linked = {};

-- local function head(linked_list)
--     -- Indices start at 1 in lua
--     return linked_list[1]
-- end

-- local function tail(linked_list)
--     return linked_list[#linked_list]
-- end

-- assert(head{3,6,83,6} == 3)
-- assert(tail{3,6,83,6} == 6)

-- TODO - find out these things
