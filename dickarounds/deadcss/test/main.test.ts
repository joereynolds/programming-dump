import { RipGrep } from "../src/grep-programs/ripgrep"
const child_process = require("child_process");

test("jest is running correctly", () => {
  expect(2).toBe(2);
});

test("our grep program returns an object of results", () => {
    const ripgrep = new RipGrep();
    expect(typeof ripgrep.run("test/fixtures/test.css")).toEqual("object");
});

test("it ignores pseudoselectors", () => {
    const expected = ["a-valid-id"];
    const ripgrep = new RipGrep();
    expect(ripgrep.run("test/fixtures/pseudoselector.css")).toEqual(expected);
});

test("it strips out `#` and `.` from selectors", () => {
    const expected = ["a-valid-id", "a-valid-class"];
    const ripgrep = new RipGrep();
    expect(ripgrep.run("test/fixtures/test.css")).toEqual(expected);
});

// test("it only gets ids and classes", () => {
//     const expected = ["#a-valid-id", ".a-valid-class"];
//     const call = child_process.spawnSync("rg", ["-i", "^[#\.]", "test/fixtures/test.css"]);
//     const ripgrep = new RipGrep();
//     expect(ripgrep.getSelectors(call.stdout.toString())).toEqual(expected);
// });
