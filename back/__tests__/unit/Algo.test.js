const Algo = require('../../src/utils/Algo');

// ZOMBIES Principle
describe('Testing the algorithms', () => {
  // sum
  describe('In sum function', () => {
    // Zero
    it('should return 0 for 0 + 0', () => {
      expect(Algo.sum(0, 0)).toBe(0);
    });
  });
});
