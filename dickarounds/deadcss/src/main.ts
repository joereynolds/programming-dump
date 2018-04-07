#!/usr/bin/env node

import { RipGrep } from "./grep-programs/ripgrep";

const program = require("commander");
const ripgrep = new RipGrep();

program.parse(process.argv);
console.log(ripgrep.run(program.args[0], program.args[1]));
