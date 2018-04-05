import { RipGrep } from "../src/grep-programs/ripgrep"

test("Test jest is running correctly", () => {
  expect(2).toBe(2);
});

test("Test our grep program only returns ids and classes", () => {
    const expected = ["#a-valid-id", ".a-valid-class"];
    const ripgrep = new RipGrep();
    expect(ripgrep.run("test/fixtures/test.css")).toEqual(expected);
});

// test("Test we ignore pseudoselectors", () => {
//   expect(3).toBe(2);
// });
