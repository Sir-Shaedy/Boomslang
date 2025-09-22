# 🐍 Testing Vyper Contracts with Foundry (`t.sol`)

This repo demonstrates a streamlined workflow for **testing Vyper smart contracts** using Foundry’s Solidity test framework (`t.sol`).  
By combining **Moccasin** for Vyper scaffolding and **Foundry** for testing, you get the best of both worlds — clean Vyper code with powerful, fast Solidity-based tests.

---

## Why This Matters
Testing Vyper contracts directly in Foundry:
- ✅ Avoids writing separate Python test suites.
- ✅ Lets you use Foundry’s cheatcodes (`deployCode`, `prank`, `deal`, etc.).
- ✅ Integrates seamlessly with Solidity tooling, coverage, and CI pipelines.
- ✅ Speeds up iteration — deploy and test in-memory without spinning up external chains.

---

## 🛠 Process Overview

1. **Initialize a Moccasin template**
   ```bash
   moccasin init my-project
   ```

2. **Force initialize a Foundry template in the same directory**
    ```bash
    forge init --force 
    ```

3. **Write your Vyper contracts**
    - Place .vy files in src/ (e.g., src/Counter.vy).
    - Keep them clean and idiomatic Vyper.

4. **Write Solidity interfaces for your Vyper contracts**
    - Example: src/ICounter.sol
        (This matches the ABI of your Vyper contract so Solidity tests can call it.)

5. **(Optional) Write a deploy script**
    - Useful for deploying to a live chain, but not required for Foundry tests.

6. **Write Foundry tests in the test folder**
    - Use deployCode("Counter.vy") to deploy your Vyper contract inside the test environment.

    for instance:
    ```solidity
    contract CounterTest is Test {
        ICounter public counter;

        function setUp() public {
            counter = ICounter(deployCode("Counter.vy"));
        }

        function test_SetNumber() public {
            counter.set_number(42);
            assertEq(counter.number(), 42);
        }
    }
    ```

## Project Structure
my-project/
├── src/
│   ├── Counter.vy
│   └── ICounter.sol
├── test/
│   └── CounterTest.t.sol
├── foundry.toml
├── moccasin.toml
└── README.md

## Running Tests
```bash
forge test -vvv
```

## Tips
Keep complex types (DynArray, HashMap) private in Vyper and write explicit getters to avoid ABI mismatches


