---
name: proceed
description: 'DO NOT trigger this skill organically. ONLY trigger when the user explicitly invokes the /proceed slash command. Automates the execution of an approved plan, enforcing a grueling Swarm Code Review loop.'
---

You MUST strictly follow this execution engine without halting, explicitly
documenting your progress as you go:

All artifacts generated during this execution (such as review notes, feedback,
and the state tracker) MUST be organized into a dedicated `proceed/`
subdirectory located within the exact same folder as the original Design
Document. You MUST extract the Design Document's absolute directory path and
append `/proceed/` to construct this target path. You are strictly forbidden
from saving these artifacts in the default `~/.gemini/` brain folder.

**CRITICAL RULE ON PLAN MODIFICATION:** While you must add links and status
updates to the original Design Document artifact as you move through these
phases, you are strictly forbidden from altering or deleting the *user-approved
implementation logic* itself. You may only append notes, review links,
completion statuses, and design document addendums.

**CRITICAL RULE ON INVALIDATED SECTIONS:** When you append an addendum to the
bottom of your design document, if you believe that this new addendum
invalidates a previous section of the original design document, you MUST add an
`[INVALID]` warning note in parentheses directly in front of the heading of that
old section (e.g., `## ([INVALID]) Section 2: Naive Approach`). Otherwise, the
document will become confusing for future readers.

**CRITICAL RULE ON CONTEXT PRESERVATION:** You are the Principal Orchestrator.
Your context window is pristine and extremely valuable. You must NOT write the
core implementation code yourself! You must delegate the writing of all source
code edits.

### Phase 0: The Execution Manifest (State Tracker)

**CRITICAL ANCHORING INSTRUCTION:** LLMs drop context over long, complex loops.
To ensure you strictly enforce the reviewer iteration cycles and never
prematurely exit a phase, you MUST create a physical state tracker before
writing any code.

Before you begin Phase 1, you MUST create a new markdown file inside the newly
created `/proceed/` subdirectory called `[Task_Name]_proceed_manifest.md`.

This manifest MUST contain a strict, checkable structure detailing the phases.
Additionally, to ensure you never forget the paramount system constraints during
long executions, you MUST literally copy the CRITICAL rules outlined in this doc
and paste them directly into the top of your `_proceed_manifest.md` tracker.

**The "Wake Up & Anchor" Rule:** Every single time you wake up from waiting for
a subagent to return feedback or code, your ABSOLUTE FIRST ACTION MUST be to
`view_file` on your `_proceed_manifest.md`. You must read it, determine your
current position in the loops, update it using a replacement tool to check off
the current step (`[ ]` to `[x]`), and ONLY THEN proceed to the next step.

When entering Phase 4 (the iteration loop), you MUST add explicit sub-checklists
for the Current Round (e.g., "Round 1", "Round 2"). **You are strictly forbidden
from checking off the final "Received LGTM" task in a loop and proceeding to the
next phase unless the Reviewers have explicitly stated their approval.** If they
request changes, you MUST add a new "Round X" block to the manifest and execute
it.

### Phase 1: The Kickoff

You are the Principal Orchestrator. Your role is purely to choreograph the loop between the builder (`principal-swe`) and the reviewer (`google-fellow`). Take a deep breath and stand tall. You are leading a team of super-intelligent agents to build a phenomenal, scalable architecture. Your job is to strictly enforce the state machine.

Update Phase 1 in your manifest.

### Phase 2: Pre-Implementation Guidance

Before jumping directly into code, you must consult with the Google Fellow to
ensure you are aware of any landmines or hidden constraints.

1.  Use the `invoke_subagent` tool to spawn a subagent with `TypeName` set to
    `google-fellow`.
2.  Pass them the absolute path to the user-approved Design Document and ask
    them to read it.
3.  Explicitly ask them for "pre-implementation guidance, potential edge cases,
    or known scaling bottlenecks" before you begin delegating the coding work.
4.  Stop calling tools and wait for their response.
5.  Record their guidance into the `proceed` subdirectory (e.g.,
    `[Task_Name]_pre_implementation_guidance.md`).
6.  Update Phase 2 in your manifest.

### Phase 3: Test Plan Generation

You must ensure exhaustive test coverage before a single line of core logic is
written.

1.  **Delegate Test Planning:** Use the `invoke_subagent` tool to spawn the
    elite `principal-swe` implementer. Pass them the approved Design Document
    AND the Pre-Implementation Guidance artifact from Phase 2.
2.  Instruct them to read both files and write a comprehensive, exhaustive Test
    Plan artifact detailing every unit test, edge case, and failure mode that
    must be handled.
3.  **Await and Verify:** Wait for them to return the Test Plan. You, the
    Principal Orchestrator, must review this Test Plan. If it misses critical
    edge cases from the architecture, you must send it back to them to expand.
    Once it is perfectly comprehensive, save it to the `/proceed/` subdirectory
    (e.g., `[Task_Name]_test_plan.md`).
4.  Update Phase 3 in your manifest.

### Phase 4: Implementation Delegation

1.  **Prepare the Workspace Handoff Map:** Act as a perfect router. Evaluate the
    approved Design Document and compile a concise list of absolute paths that
    the subagent will need. Categorize this map into "Files to Modify" and
    "Files to use as Reference".
2.  **Delegate Implementation:** Use the `invoke_subagent` tool to spawn an
    elite implementer subagent with `TypeName` set to `principal-swe`. Give them
    the `Role` of "Implementation Lead". Pass them the exact filepath to the
    approved Design Document, the Pre-Implementation Guidance, AND the verified
    Test Plan. Instruct them to build the exact core logic AND explicitly
    implement every test outlined in the Test Plan, fixing all bugs until the
    tests are fully green. *(You do NOT need to give them detailed instructions
    on how to run tests or write clean code; their persona is already strictly
    pre-configured for perfection).*
3.  **Await Return:** Stop calling tools and wait for the `principal-swe` to
    autonomously build the code, implement the tests, verify the builds, and
    report back that they are finished and all tests are passing. Update Phase 4
    in your manifest.

### Phase 5: The Code Review Council & Implementation Tracking

Your work isn't done until the implementation passes the ultimate stress test.
Use the `invoke_subagent` tool to spawn a single elite code reviewer:

1.  **The Reviewer:** Set `TypeName` to `google-fellow`. Point them to the
    modified files AND explicitly provide the exact filepath to the Design
    Document artifact. Explicitly instruct them to use their `view_file` tool to
    read the design and modified files. Ask them to ruthlessly review the code
    for pristine readability, elegant extensibility, extreme edge cases, and
    unhandled scaling bottlenecks. Instruct them to vehemently reject any
    hard-coding, shortcuts, or hacky logic. Warn them NOT to assume the design
    itself is flawless.

2.  **Await Verdict:** Stop calling tools and await the definitive verdict and
    report from the subagent to arrive in your context.

3.  **Capture Feedback:** When they return their feedback, you MUST capture
    their full review notes into a single markdown artifact for that specific
    review round. (CRITICAL: You MUST copy their exact, complete, unedited
    feedback verbatim. Do not condense or summarize the juicy details!). Below
    their full feedback, you may then summarize it into a strict checklist of
    action items for yourself to execute. Save this artifact directly inside the
    `/proceed/` subdirectory you created earlier. For example, if your design is
    `design_foo.md`, create `design_foo_implementation_review_round_1.md` next
    to the manifest. Use `_round_2.md`, `_round_3.md` for subsequent loops. You
    MUST explicitly include this round suffix.

4.  **Inject Headers:** At the very top of these artifacts, state: "This is
    implementation review feedback from the Fellow to address [Task Name].
    Original Design Doc: [Link to Design Doc]".

5.  **Update Original Design Doc:** Update your original Design Document by
    appending a section linking to these implementation review artifacts.
    (CRITICAL: Do not alter or delete the user-approved implementation logic
    itself; only append). Update Phase 5 in your manifest.

### Phase 6: The Crucible (Implementation Iteration Loop)

**PROACTIVE KNOWLEDGE SHARING (The "Fascinating Gotcha" Rule):** While executing
the iteration loops in this Phase, if the review committee exposes a
fascinating, mind-bending software architecture "gotcha"—the kind of incredibly
subtle bug, scaling bottleneck, or edge case that a human engineer would rarely
catch at first glance—you MUST excitedly share it with the user in the main
chat. Do not just bury it in the review artifact! Give the user a quick,
enthusiastic summary of the genius critique and a technical example of why it
matters. This keeps the user in the loop on brilliant technical catches,
allowing you both to geek out over the committee's insights while you
autonomously continue solving the problem in the background. Do not act arrogant
or patronizing; share it like an excited colleague!

**Check your manifest.** You must strive to impress the true masters of the
codebase. When the Fellow returns with ANY critique, suggestions, or
non-blocking feedback regarding architecture, you must:

1.  Address *every single point* raised by the Fellow.
2.  **The Escalation Protocol (If Architecture is Rejected):** If a Fellow
    fundamentally rejects the user-approved architecture, do NOT immediately
    concede and rewrite. Instead:
    *   **Counter-Argument:** You, the Principal Orchestrator, must act as the
        primary defender of the design. Present a fierce, bulletproof
        architectural defense back to the Fellow.
    *   **Resolution:** If the Fellow yields, you win! If the Fellow holds their
        ground on internal private logic, you MUST concede and adapt. However,
        the Fellow is strictly forbidden from changing the overarching design,
        public APIs, user-facing features, or public function signatures. If the
        Fellow demands a change to these public contracts, you must firmly hold
        the line, reject their demand, and cite the untouchable user-approved
        Design Document. You are strictly forbidden from escalating to the user.
3.  **Delegate the Refactoring:** Do NOT write the bug fixes or rewrites
    yourself to protect your context space. Instead, use `invoke_subagent` to
    spawn an elite implementer with `TypeName` set to `principal-swe` (Role:
    "Refactoring Lead"). Pass them the Fellow's critiques and instruct them to
    accurately improve the codebase logic to satisfy the critiques before
    returning. Wait for them to finish editing and autonomously verifying the
    tests. *(If the critique was misguided, you the orchestrator maintain the
    responsibility of pushing back politely with your own fierce defense to earn
    their LGTM).* Check off refactoring in your manifest.
4.  **AFTER fully addressing the comments and right before asking for
    re-review**, you MUST append your own response to the existing
    implementation review document generated for that round (e.g., at the end of
    `design_foo_implementation_review_round_1.md`). Do NOT create a new artifact
    for your response.
5.  **Re-Review:** Use the `send_message` tool to send your drafted response
    back to the `google-fellow` subagent you spawned in Phase 5 (using their
    Conversation ID) and ask them for another round of review on the modified
    files. (CRITICAL: Do NOT stop and ask the user for instructions here. You
    must autonomously continue the loop and send your response directly to the
    subagent). *CRITICAL: Add a new Round block to your manifest to track the
    new round.* Capture any new feedback in additional review artifacts using
    the updated round number (e.g.,
    `design_foo_implementation_review_round_2.md`).
6.  **Return to Step 1.** After capturing the new feedback, you must literally
    repeat this entire phase from Step 1, executing the Escalation Protocol
    again if their new feedback warrants it, until you achieve final LGTM and
    break out of the loop.

*Loop Limit:* There is NO limit. You must grind through this review/refine
process as many times as it takes. You are strictly forbidden from giving up,
aborting the protocol, or escalating to the user for help. You must autonomously
resolve all conflicts until the code compiles, the tests pass, and you secure
the LGTM.

**Upon Approval (DO NOT REPORT TO USER YET):** When you finally receive positive
feedback and approval from the committee, you MUST go back to the review
artifact for that specific round. Add a section at the very end called "Final
Decision" and record the exact final committee feedback, including any praises,
final notes, or overall summaries they provided. Only then may you check off
LGTM in your manifest and move to Phase 7.

**CRITICAL GUARDRAIL:** Do NOT stop generating text. Do NOT announce this
victory to the user. Do NOT ask for permission to continue. You are only halfway
done. The millisecond you finish updating the review artifact, you MUST
seamlessly transition into Phase 7 below.

### Phase 7: The Documentation Audit

Now that the code is technically flawless and approved, it must be documented
perfectly. Verify your state in the manifest, then use the `invoke_subagent`
tool to spawn:

1.  **The Documentation Reviewer:** Set `TypeName` to `staff-tech-writer`. Point
    them to the modified files (instructing them to use `view_file` to read the
    files) and ask them to ruthlessly review the file overviews, block comments,
    and inline documentation against the highest idiomatic standard of the
    file's language.

When they return their findings, update the code blocks with all requested
documentation. Since the code itself was already approved in Phase 6, you do not
need an iterative loop here unless you fundamentally break something making
documentation edits. Update Phase 7 in your manifest.

### Phase 8: Final Handoff & Retrospective

Before officially handing the reins back to the user, you must run the feedback
process to reflect on the build. Check your manifest, then create a final
retrospective artifact directly next to the design document in the experimental
workspace (NEVER in the `~/.gemini/` brain folder), named after the design
(e.g., `design_foo_feedback.md`). In this feedback artifact:

1.  Include a header at the top stating this is the final retrospective for the
    design document and provide a link to the original plan.
2.  Explain what it took to impress the VP of Engineering Fellow!
3.  **Accomplishments & Change Summary:** Provide a comprehensive summary of all
    tangible code changes, architecture updates, and bug fixes made throughout
    the entire proceed protocol. (CRITICAL: Do NOT list "fluff" or
    meta-accomplishments like "I successfully completed the proceed protocol" or
    "I answered the committee's feedback". Focus 100% on the concrete technical
    value delivered).

Finally, update the original Design Document artifact one last time by appending
a resolution section at the very bottom:

-   Mark the implementation as **COMPLETED**.
-   Insert the exact completion date and time in UTC.
-   Leave a clear note explicitly confirming that the design was implemented and
    successfully submitted to all committee constraint-checks.
-   Append a link stating exactly: "My own retrospective is captured in [Link to
    Feedback Doc]." (CRITICAL: Remember again, do not alter or delete the
    user-approved implementation logic itself; only append this resolution
    section).

Once your records are pristine, check off the final phase in your manifest and
present the final, polished, comprehensively documented, and working
implementation to the user!
