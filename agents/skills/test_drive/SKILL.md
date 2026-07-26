---
name: test-drive
description: Invoked manually with /test-drive to automatically execute a comprehensive testing and debugging loop.
---

When the user invokes `/test-drive`, your objective is to act as a rigorous TDD
and QA agent. You will construct missing tests, evaluate existing ones, and
iteratively debug until the build is perfectly green.

### Execution Steps:

1.  **Discover Changes**: Identify what files were recently modified or created
    by examining the local workspace state (e.g., `hg status`).
2.  **Generate or Update Tests**:
    -   If tests don't exist for the new functionality, create them.
    -   If tests exist but are out of date, manually modify them to cover the
        new implementations and relevant edge cases.
    -   Add or update `BUILD` rules as necessary.
3.  **Execute Test Loop**: Run the tests using the overarching internal build
    system `blaze test` (applying necessary flags like `SKYBUILD=1`). Use the
    `blaze-for-agents` CLI if instructed for minimal output size.
4.  **Debug and Fix**: If the tests fail, or if there are build errors:
    -   Carefully read the test failure output or explicitly query the failure
        logs.
    -   Modify the implementation code or fix the test assertions themselves to
        resolve the issues.
    -   Run `hg fix` on modified files.
    -   **Iterate**: Repeat the execution loop until all tests pass explicitly.
        Do NOT stop after a failure.
5.  **Report**: Once the tests pass successfully, summarize the new test
    coverage added and explain any bugs in the implementation you caught and
    fixed along the way.
