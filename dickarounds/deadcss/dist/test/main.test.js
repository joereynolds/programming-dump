"use strict";
exports.__esModule = true;
var ripgrep_1 = require("../src/grep-programs/ripgrep");
var child_process = require("child_process");
test("jest is running correctly", function () {
    expect(2).toBe(2);
});
test("our grep program returns an object of results", function () {
    var ripgrep = new ripgrep_1.RipGrep();
    expect(typeof ripgrep.run("test/fixtures/test.css")).toEqual("object");
});
test("it ignores pseudoselectors", function () {
    var expected = ["a-valid-id"];
    var ripgrep = new ripgrep_1.RipGrep();
    expect(ripgrep.run("test/fixtures/pseudoselector.css")).toEqual(expected);
});
test("it strips out `#` and `.` from selectors", function () {
    var expected = ["a-valid-id", "a-valid-class"];
    var ripgrep = new ripgrep_1.RipGrep();
    expect(ripgrep.run("test/fixtures/test.css")).toEqual(expected);
});
// test("it only gets ids and classes", () => {
//     const expected = ["#a-valid-id", ".a-valid-class"];
//     const call = child_process.spawnSync("rg", ["-i", "^[#\.]", "test/fixtures/test.css"]);
//     const ripgrep = new RipGrep();
//     expect(ripgrep.getSelectors(call.stdout.toString())).toEqual(expected);
// });
//# sourceMappingURL=main.test.js.map