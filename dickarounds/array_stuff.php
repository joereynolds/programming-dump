<?php

//Not sure what to call it, do is taken :(
function perform($times, callable $function, array $arguments = [])
{
    foreach (range(0, $times) as $_) {
       call_user_func_array($function, $arguments);
    }
}

function print_stuff()
{
    echo 'hello';
}

perform(12, 'print_stuff', []);

perform(5, function() {
    echo 'test';
});
