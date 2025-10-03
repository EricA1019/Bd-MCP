# Close-to-Shore MCP (System-Agnostic)

Short hops, loud logs, data-driven content, always-green tests, organized structure.

## 0) Core Principles
- **Short hops**: Tiny, runnable vertical slices (<500 lines per file, <750 total per hop)
- **Sub-hops when needed**: Split complex hops into X.Ya, X.Yb, X.Yc for CTS compliance
- **Signal-first architecture**: Define and document signals BEFORE implementing modules
- **Always green**: Tests pass and the program boots without errors after every hop
- **Performance targets upfront**: Define and validate performance budgets before implementation
- **Comprehensive testing**: 30+ tests per major feature covering all functionality
- **Data-driven first**: Content lives in data files (JSON/DB/resources); systems discover content
- **Avoid hard-coding**: Prefer tables/registries over branches
- **Auto-populated UI**: Containers spawn controls based on data/state
- **Traceable logs**: Tagged logs; never silently fail
- **Organized structure**: Every component has a designated place following project conventions
- **Signal Expert Integration**: Follow signal-first architecture with addon coordination through EventBus

## Signal Expert Coordination

### Signal-First Architecture (CRITICAL)
**Implementation Order**:
1. **Define Signals FIRST**: Add signal declarations to EventBus with full documentation
2. **Document Contracts**: Update SIGNAL_CONTRACTS.md with schemas and payloads
3. **Implement Modules**: Create classes that emit the pre-defined signals
4. **Test Signal Contracts**: Validate emission order and payload shapes

**Why Signal-First**:
- Prevents coupling between modules
- Enables signal contract testing before implementation
- Documents communication patterns upfront
- Allows parallel development of signal consumers

**Example Pattern** (from Hop 2.4b):
```gdscript
# Step 1: Add signals to EventBus (FIRST)
signal conflict_detected(conflict_data: Dictionary)
signal conflict_resolved(resolution_data: Dictionary)

# Step 2: Document in SIGNAL_CONTRACTS.md
# Step 3: Implement modules that emit these signals
# Step 4: Test signal emissions with GUT
```

### Addon Integration Principles
- **Addon Awareness**: Always consult `docs/Architecture/ADDON_INVENTORY.md` before implementing new functionality
- **Signal Coordination**: All addon interactions flow through central EventBus with documented contracts
- **Performance Coordination**: Monitor all addon performance for 2ms pipeline compliance
- **No Duplication**: Leverage existing addon capabilities rather than reimplementing

### Signal Architecture Requirements
- **EventBus Integration**: All signals coordinated through central hub with documented contracts
- **Signal Visualizer**: Real-time monitoring and debugging of all signal flows
- **Contract Validation**: Every signal emission validated against documented contracts through GUT framework
- **Performance Monitoring**: Signal emission rates tracked with automatic performance warnings
- **<500 Line Limit**: Each file must be <500 lines for maintainability
- **Performance Targets**: Define and test performance budgets upfront (e.g., <10ms validation)

### Testing Standards (Signal Expert)
- **GUT Framework Primary**: All system tests, signal validation, and performance benchmarks use GUT patterns
- **Comprehensive Coverage**: 30+ tests per major feature covering all functionality
- **Signal Contract Tests**: Every signal's order and payload shape validated
- **Performance Tests**: All performance targets validated with benchmarks
- **Deterministic Testing**: Fixed seeds for reproducible results, no time-based assertions
- **Addon Integration Tests**: Validate all addon interactions through comprehensive test suites

## Project Organization Standards

### Game Systems Structure
Each game system MUST follow this structure:
```
game_systems/system_name/
├── scenes/          # Godot scene files (.tscn)
├── scripts/         # GDScript files (.gd)
├── data/           # JSON/CSV/resource files
├── docs/           # System-specific documentation
├── tests/          # System-specific unit tests
└── README.md       # System overview and API
```

### Testing Architecture Structure
Unified testing system following CTS principles:
```
tests/
├── infrastructure/   # Permanent testing framework (NEVER DELETE)
│   ├── test_coordinator.gd    # Core test execution engine
│   ├── test_runner.tscn       # Universal test scene
│   ├── test_runner.gd         # Scene controller
│   ├── integration_base.gd    # Base class for all tests
│   ├── hop_test_template.gd   # Template for new hop tests
│   └── README.md              # Testing framework docs
├── signal_contracts/           # Signal validation (PERMANENT)
├── unit/                      # Hop-specific unit tests (purged after hop)
├── integration/               # Hop-specific integration tests (purged after hop)
├── game_flow/                 # Hop-specific game flow tests (purged after hop)
└── archive/                   # Completed hop tests (historical reference)
```

**Hop Test Lifecycle**:
1. **Create**: Copy `hop_test_template.gd` → `tests/unit/hop_X_Y_test.gd`
2. **Implement**: Write tests using GUT framework patterns
3. **Execute**: Run via `test_runner.tscn` during development
4. **Validate**: Ensure all tests pass before hop completion
5. **Archive**: Move to `tests/archive/hop_X_Y/` after hop complete
6. **Purge**: Remove from active test directories (unit/integration/game_flow)

**When to Archive vs Purge**:
- **Archive**: Major feature tests, regression tests, complex integration tests
- **Purge**: Simple unit tests, temporary validation tests, scaffolding tests
- **Keep Permanent**: Signal contract tests, infrastructure tests, core system tests

## When to Use Sub-Hops

### Decision Criteria
Split a hop into sub-hops (X.Ya, X.Yb, X.Yc) when ANY of these conditions are met:

**Scope Criteria**:
- **File Size**: Any single file would exceed 500 lines
- **Total Scope**: Total implementation would exceed 750 lines across all files
- **Multiple Systems**: Hop contains 2+ unrelated systems or major features
- **Complex Integration**: Multiple integration points with existing systems
- **Signal Overload**: Would require 5+ new signals (split into 2-3 per sub-hop)

**Real-World Examples**:

✅ **Good: Hop 2.4a (Template Composer Core)**
- Single focused system: Multi-template composition
- 348 lines in one file
- 2 signals: composition_started, composition_complete
- No sub-hops needed (under all thresholds)

❌ **Bad: Original Hop 2.4c (Before Refinement)**
- 3 unrelated systems: Conditionals + Macros + Batch Processing
- ~750 total lines across 3 files
- No signals defined (red flag)
- **Solution**: Split into 2.4c-i, 2.4c-ii, 2.4c-iii

✅ **Good: Hop 2.4b (Validation & Resolution)**
- 2 related systems: Validator + Resolver
- 337 + 367 = 704 lines (but closely related)
- 2 signals: conflict_detected, conflict_resolved
- Both systems work together on same data
- No sub-hops needed (cohesive, under file limit)

✅ **Good: Hop 1.1 (Split into Sub-Hops)**
- Original scope: Plugin + Config + Logging + Validation (~2000 lines)
- **Split**:
  - 1.1a: Plugin Bootstrap & EventBus (~350 lines, 3 signals)
  - 1.1b: Configuration & Logging (~650 lines, 3 signals)
  - 1.1c: Validation Engine & Tests (~700 lines, 3 signals)

### Sub-Hop Naming Convention

**Format**: `Phase X.Y[letter]`
- **X**: Phase number (1-5)
- **Y**: Major hop within phase (1-4)
- **[letter]**: Sub-hop for CTS compliance (a, b, c, d, etc.)

**Examples**:
```
Hop 1.1: Core Infrastructure
├── Hop 1.1a: Plugin Bootstrap & EventBus Core
├── Hop 1.1b: Configuration & Logging Foundation
└── Hop 1.1c: Validation Engine & Test Templates

Hop 2.4: Template Composition System
├── Hop 2.4a: Composition Core (no sub-hops, simple enough)
├── Hop 2.4b: Validation & Resolution (no sub-hops, cohesive)
└── Hop 2.4c: Advanced Features
    ├── Hop 2.4c-i: Conditional Rules Engine
    ├── Hop 2.4c-ii: Macro & Variable System
    └── Hop 2.4c-iii: Batch Generation Workflow
```

### Sub-Hop Structure Requirements

Each sub-hop document MUST include:

1. **Scope**: One-sentence clear objective
2. **Deliverables**: Specific, testable outputs (<500 lines per file)
3. **Signals**: 2-3 new signals with full contracts
4. **Performance Targets**: Explicit timing requirements
5. **Explicit Non-Goals**: What is deferred to later sub-hops
6. **Success Criteria**: Measurable validation requirements
7. **Regression Prevention**: Tests ensuring previous sub-hops still work
8. **Integration Points**: How this sub-hop extends (not modifies) previous work

**Example Sub-Hop Definition** (Hop 2.4c-i):
```markdown
## Hop 2.4c-i: Conditional Rules Engine

**Scope**: Context-aware template selection based on configurable rules

**Deliverables**:
- ConditionalRuleEngine class (~300 lines)
- Rule schema (JSON/YAML)
- 15+ tests (rule evaluation, context matching)

**Signals**:
- rule_evaluated(rule_id, context, result)
- context_selected(template_id, context_data)

**Performance Targets**:
- <5ms rule evaluation for 10 rules
- <100ms for 100 rules

**Non-Goals** (deferred to 2.4c-ii and 2.4c-iii):
- ❌ Macro expansion (2.4c-ii)
- ❌ Variable substitution (2.4c-ii)
- ❌ Batch processing (2.4c-iii)

**Success Criteria**:
- All 15+ tests passing
- Performance targets met
- Signal contracts documented
- No modifications to 2.4a or 2.4b code
- Hop 2.4a and 2.4b tests still pass
```

### Progressive Refinement Pattern

**When Planning a Hop**:

1. **Initial Scope Definition**: Define what the hop should accomplish
2. **Scope Analysis**:
   ```
   - Count estimated lines per file
   - Count number of major systems
   - Count number of new signals needed
   - Identify integration points
   ```
3. **Decision**: Apply decision criteria (see above)
4. **If Split Needed**: Create sub-hop definitions following structure requirements
5. **Validation**: Ensure each sub-hop is independently completable

**Signal Allocation Across Sub-Hops**:
- **Bad**: All signals in first sub-hop (front-loads complexity)
- **Good**: 2-3 signals per sub-hop, evenly distributed
- **Best**: Signals added as systems are implemented (signal-first per sub-hop)

**Example Signal Progression** (Hop 2.4c):
```
Hop 2.4c-i (Conditionals):
  - rule_evaluated
  - context_selected

Hop 2.4c-ii (Macros):
  - macro_expanded
  - variables_substituted

Hop 2.4c-iii (Batch):
  - batch_started
  - batch_progress
  - batch_complete
```

### Sub-Hop Completion Checklist

Before marking a sub-hop complete:

- [ ] **Scope Compliance**: <500 lines per file, <750 total
- [ ] **Signal-First**: All signals defined in EventBus BEFORE modules
- [ ] **Signal Contracts**: All signals documented in SIGNAL_CONTRACTS.md
- [ ] **Comprehensive Tests**: 15-30 tests depending on complexity
- [ ] **Performance Validated**: All performance targets met with benchmarks
- [ ] **Non-Breaking**: No modifications to previous sub-hop code
- [ ] **Regression Tests**: All previous sub-hop tests still pass
- [ ] **Documentation**: Sub-hop completion document created
- [ ] **Integration Validated**: Works with existing systems
- [ ] **0 Errors**: Compilation clean across all files



### Documentation Structure
```
docs/
├── Architecture/    # Technical design and system specs
├── Game_Design/     # Mechanics, narrative, UX design
├── Development/     # Workflows, style guides, standards
├── Plans/          # Current and completed project plans
├── API/            # HTTP endpoints, MCP specs, plugin APIs
├── Testing/        # Test policies, frameworks, benchmarks
└── README.md       # Documentation organization guide
```

### File Naming Conventions
- **Game Systems**: `SystemName_ComponentName.tscn/gd`
- **Documentation**: `SYSTEM_SPECIFICATION.md` (specs), `Development_Guide.md` (guides)
- **Data Files**: `system_data.json`, `system_config.yaml`
- **Tests**: `hop_[N]_[feature]_test.gd` (hop-specific), `test_[component]_[aspect].gd` (general)

## Definition of Done (per hop or sub-hop)
1) **Signal-First Architecture**: All signals defined in EventBus BEFORE module implementation
2) **Signal Contracts Documented**: All signals documented in SIGNAL_CONTRACTS.md with schemas
3) **Scope Compliance**: <500 lines per file, <750 total per (sub-)hop
4) **Performance Targets Met**: All performance budgets validated with benchmark tests
5) **Comprehensive Testing**: 15-30 tests (sub-hop) or 30+ tests (major hop) covering all functionality
6) **Unified Testing**: All tests run via `tests/infrastructure/test_runner.tscn` using GUT framework
7) **Test Lifecycle**: Hop-specific tests implemented using `hop_test_template.gd`
8) **Signal Validation**: All new signals validated through EventBus with contract tests
9) **Addon Integration**: Check `docs/Architecture/ADDON_INVENTORY.md` for existing functionality before implementation
10) **Performance Compliance**: All operations meet 2ms pipeline compliance with Signal Visualizer monitoring
11) **Narrative Integration**: Story elements validated for thematic consistency (if applicable)
12) **Data Schemas Validated**: JSON or DB migrations applied and tested
13) **App Boots**: Program boots and demonstrates the hop feature without errors
14) **Player Test**: Human validation completed and documented in DEV_LOG.md
15) **Logs Clean**: No unexpected warnings/errors in console
16) **No Hard-Wired Paths**: Safe fallbacks allowed, no brittle path dependencies
17) **Proper Organization**: Files placed in correct folders following project structure
18) **Documentation Updated**: System docs and project index reflect changes
19) **Test Archival**: Hop tests moved to archive after completion (if needed)
20) **Regression Validation**: All previous hop/sub-hop tests still pass
21) **Non-Breaking Changes**: No modifications to previous hop code (extension only)
22) **Commit + Tag**: Changes committed with proper version tag, docs updated

## Workflow (8 steps)

### Step 0: Scope Analysis & Sub-Hop Planning
**Before starting any hop**:
1. **Read hop definition** from planning document
2. **Analyze scope** using decision criteria:
   - Estimate lines per file (target: <500)
   - Count major systems (target: 1-2 related)
   - Count new signals needed (target: 2-3)
   - Identify integration points
3. **Determine if sub-hops needed**:
   - If >500 lines per file → Split
   - If >750 total lines → Split
   - If 2+ unrelated systems → Split
   - If 5+ signals → Split
4. **Create sub-hop definitions** if needed:
   - Define scope per sub-hop
   - Allocate signals (2-3 per sub-hop)
   - Define performance targets
   - Document non-goals (what's deferred)
5. **Ask for clarification** if scope violates CTS principles
6. **Document decision** in hop planning document

**Output**: Clear hop or sub-hop definition ready to implement

### Step 1: Signal-First Definition & Planning
**Critical: Signals BEFORE modules**:
1. **Define all signals** for this (sub-)hop in EventBus
2. **Document signal contracts** in SIGNAL_CONTRACTS.md:
   - Purpose and use case
   - Args with types and descriptions
   - Example payloads
   - Frequency classification
   - Performance expectations
3. **Create emit helper methods** in EventBus (optional)
4. **Read ROADMAP.md**: Verify alignment with project goals
5. **Set performance targets**: Define and document upfront
6. **Baseline tests**: Ensure existing tests pass
7. **Boot validation**: Verify project runs without errors
8. **Identify affected systems**: Map integration points

**Output**: EventBus with new signals, signal contracts documented

### Step 2: Test Creation (Test-First)
1. **Copy template**: `hop_test_template.gd` → `tests/unit/hop_X_Y_test.gd`
2. **Implement test cases** using GUT framework patterns:
   - Signal contract tests (emission order, payload shape)
   - Functionality tests (all public APIs)
   - Performance tests (benchmark against targets)
   - Integration tests (with existing systems)
   - Regression tests (previous hops still work)
3. **Author schemas**: Define data structures (JSON/YAML)
4. **Create system folders**: If needed for new game features
5. **Run tests**: Verify all fail initially (red state)

**Output**: Comprehensive failing test suite ready for implementation

### Step 3: Implementation (Iterate to Green)
1. **Implement modules** that emit pre-defined signals
2. **Follow signal-first pattern**: Use signals defined in Step 1
3. **Iterate via test_runner.tscn**: Run tests frequently
4. **Keep files small**: <500 lines per file
5. **Follow naming conventions**: Use project standards
6. **Organize files properly**: Place in correct folders
7. **Monitor performance**: Validate targets during development
8. **Commit frequently**: Small commits, always green

**Output**: Working implementation with all tests passing (green state)

### Step 4: Integration & Validation
1. **Full test suite**: Run all tests via unified testing system
2. **Schema validation**: Verify data structures
3. **Manual boot test**: Start project and test hop feature
4. **System integration check**: Verify works with existing systems
5. **Performance validation**: Run benchmarks against targets
6. **Signal contract validation**: Verify all emissions correct
7. **Regression check**: Ensure previous hops unaffected
8. **Error handling test**: Verify graceful failure handling

**Output**: Fully integrated and validated (sub-)hop

### Step 5: Player Validation
1. **Ask human to test**: Manual validation of feature
2. **Document feedback**: Record in `project/docs/DEV_LOG.md`
3. **Address issues**: Fix any player-reported problems
4. **Re-test**: Ensure fixes don't break tests
5. **Get approval**: Confirm feature meets requirements

**Output**: Player-validated feature ready for completion

### Step 6: Documentation & Completion
1. **Update system docs**: Document APIs, schemas, integration
2. **Update project index**: Add new files to PROJECT_INDEX.md
3. **Archive hop tests**: Move to `tests/archive/hop_X_Y/` if needed
4. **Create completion doc**: Document deliverables and outcomes
5. **Update planning docs**: Mark hop complete, update status
6. **Clean up logs**: Remove debug statements
7. **Final review**: Verify all Definition of Done items

**Output**: Complete documentation and clean codebase

### Step 7: Commit, Tag & Propose Improvements
1. **Commit changes**: With clear commit message
2. **Tag version**: Semantic versioning (e.g., v0.10.0-alpha)
3. **Update ROADMAP.md**: Mark hop complete
4. **Update HOP_SUMMARIES.md**: Brief summary of hop
5. **Propose improvements**: Suggest optimizations or enhancements
6. **Plan next hop**: Review upcoming hop scope

**Output**: Tagged release ready for next hop

## Documentation Requirements
Every project must have:
- **project/docs/ROADMAP.md**: high-level checklist of planned hops
- **project/docs/DEV_LOG.md**: chronological decisions and issues
- **project/docs/HOP_SUMMARIES.md**: brief summary of each completed hop
- **project/docs/README.md**: documentation organization and navigation
- **project/docs/PROJECT_INDEX.md**: living index of all systems, scenes, data, tests
- **project/game_systems/README.md**: game systems organization guide
- **Each system folder**: README.md with API, data schemas, and integration notes

## System Organization Requirements
When adding new game systems:
1) **Create standard folder structure** in `game_systems/system_name/`
2) **Copy template README** from `game_systems/_TEMPLATE_README.md`
3) **Document all data schemas** in system's `data/` folder
4) **Add integration tests** in system's `tests/` folder
5) **Update project index** to reference new system
6) **Follow naming conventions** for all files and components

## Agent Protocol

### Pre-Implementation Analysis
1. **Always check project/docs/** folder before starting any work
2. **Analyze hop scope** using sub-hop decision criteria (Step 0 in Workflow)
3. **Ask for clarification** if hop scope violates CTS principles:
   - >500 lines per file
   - >750 total lines
   - 2+ unrelated systems
   - 5+ signals
   - No performance targets defined
4. **Propose sub-hop refinement** if scope too broad
5. **Wait for user confirmation** before implementing broad scope

### Signal-First Implementation
1. **Define signals FIRST** in EventBus before any module code
2. **Document signal contracts** in SIGNAL_CONTRACTS.md
3. **Create failing tests** for signal emissions
4. **Implement modules** that emit pre-defined signals
5. **Validate signal contracts** with GUT tests

### File Organization
1. **Verify proper file organization** before making changes
2. **Create system folders** if working on new game features
3. **Follow naming conventions** for all files and components
4. **Keep files small**: <500 lines per file
5. **Organize by concern**: Separate data, logic, UI, tests

### Documentation & Tracking
1. **Document every hop** in project/docs/HOP_SUMMARIES.md
2. **Update DEV_LOG.md** with decisions and issues
3. **Maintain PROJECT_INDEX.md** with any new files or systems
4. **Create completion docs** for major hops
5. **Update planning docs** to track progress

### MCP Workflows
1. Follow MCP workflows and protocols unless ambiguous
2. Use TAVILY_PROTOCOL.md for clarification needs
3. Emit structured progress events
4. Provide clear error diagnostics

## Structured Decision Framework
When facing complex integration decisions:
1) **Number all questions** with clear options (A, B, C)
2) **Describe outcomes** for each option briefly  
3) **Request structured responses** (e.g., "1A, 2C, 3B...")
4) **Lock down architecture** before implementation
5) **Document decisions** in system README and DEV_LOG
6) **Create implementation todos** based on locked decisions
7) **Update project documentation** to reflect architectural choices

This ensures aligned understanding and prevents architectural drift during implementation.

## Quick Reference: CTS Compliance Checklist

### Before Starting Any Hop
- [ ] Read hop definition from planning document
- [ ] Analyze scope using sub-hop decision criteria
- [ ] If scope >500 lines per file OR >750 total OR 2+ systems → Propose sub-hops
- [ ] Ask for user clarification if scope violates CTS
- [ ] Wait for confirmation before implementing

### Signal-First Implementation (CRITICAL)
- [ ] Define all signals in EventBus FIRST (before any module code)
- [ ] Document signal contracts in SIGNAL_CONTRACTS.md
- [ ] Create signal contract tests (emission order, payload shape)
- [ ] Implement modules that emit pre-defined signals
- [ ] Validate signals with GUT tests

### Per (Sub-)Hop Requirements
- [ ] **Scope**: <500 lines per file, <750 total
- [ ] **Signals**: 2-3 new signals with full contracts
- [ ] **Performance**: Targets defined and validated upfront
- [ ] **Tests**: 15-30 comprehensive tests (GUT framework)
- [ ] **Non-Breaking**: No modifications to previous hop code
- [ ] **Regression**: All previous tests still pass
- [ ] **Documentation**: Completion doc + planning update
- [ ] **0 Errors**: Clean compilation across all files

### Sub-Hop Naming Pattern
```
Phase X.Y: Major Hop Name
├── Phase X.Ya: First Sub-Hop (2-3 signals, <500 lines)
├── Phase X.Yb: Second Sub-Hop (2-3 signals, <500 lines)
└── Phase X.Yc: Third Sub-Hop (2-3 signals, <500 lines)
```

### Red Flags (Stop and Refine)
- ❌ Any file >500 lines
- ❌ Total implementation >750 lines
- ❌ 2+ unrelated systems in one hop
- ❌ 5+ signals in one hop
- ❌ No performance targets defined
- ❌ No signal contracts documented
- ❌ Modifying previous hop code
- ❌ Tests not passing before completion

### Success Patterns (From Actual Hops)
- ✅ **Hop 2.4a**: Single system (348 lines), 2 signals, focused scope
- ✅ **Hop 2.4b**: Two related systems (337+367 lines), 2 signals, cohesive
- ✅ **Hop 1.1**: Split into 3 sub-hops (1.1a, 1.1b, 1.1c) when scope too large
- ✅ **Hop 2.4c**: Recognized scope issues early, paused for refinement

Living document — refine as habits evolve.

#EOF
