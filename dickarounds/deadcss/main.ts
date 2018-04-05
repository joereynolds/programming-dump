#!/usr/bin/env node


const program = require("commander");
const ripgrep = require("./src/grep-programs/ripgrep.ts")

program.parse(process.argv);
ripgrep.run(program.args[0]);
