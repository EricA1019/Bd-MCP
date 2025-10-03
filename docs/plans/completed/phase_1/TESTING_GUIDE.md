# BD DevTools Testing Guide

**GUT Framework**: Godot Unit Testing  
**Test Location**: `addons/broken_divinity_devtools/tests/`  
**Task Configuration**: `.vscode/tasks.json`

---

## Quick Start

### Running All Tests
1. Open VS Code Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`)
2. Type "Tasks: Run Task"
3. Select "GUT: Run All DevTools Tests"

**Alternative**: Use keyboard shortcut for test task (if configured)

---

## Available Test Tasks

All tasks use the Godot binary at: `/home/eric/Desktop/Godot_v4.5-stable_linux.x86_64`

### 1. Run All DevTools Tests
**Task**: `GUT: Run All DevTools Tests`  
**Command**: Runs all test files in `tests/` directory  
**Use When**: Validating overall system health

### 2. Run Specific Test File
**Manual Command**:
```bash
/home/eric/Desktop/Godot_v4.5-stable_linux.x86_64 \
  --headless \
  --path /home/eric/Godot/BrokenDivinity \
  -s addons/gut/gut_cmdln.gd \
  -gtest=res://addons/broken_divinity_devtools/tests/test_<MODULE>.gd \
  -gexit
```

**Example - Run EventBus tests only**:
```bash
/home/eric/Desktop/Godot_v4.5-stable_linux.x86_64 \
  --headless \
  --path /home/eric/Godot/BrokenDivinity \
  -s addons/gut/gut_cmdln.gd \
  -gtest=res://addons/broken_divinity_devtools/tests/test_event_bus.gd \
  -gexit
```

---

## Test File Organization

```
addons/broken_divinity_devtools/tests/
├── test_event_bus.gd          # EventBus signal contracts (14 tests)
├── test_config_manager.gd     # Configuration system (14 tests)
├── test_logger.gd             # Logging system (11 tests)
├── test_validation_engine.gd  # CTS validation (19 tests)
└── test_file_watcher.gd       # File system monitoring (19 tests)
```

**Total**: 78 tests across 5 modules

---

## Test Output Interpretation

### Successful Test Run
```
Totals
------
Scripts               5
Tests                78
Passing Tests        78
Failing Tests         0
Asserts           241/241
Time              0.478s

---- 0 failing tests ----
```

### Failed Test Run
```
res://addons/broken_divinity_devtools/tests/test_event_bus.gd
- test_initialization
    [Failed]:  Expected [<null>] to be anything but NULL
          at line 35

Totals
------
Tests                78
Passing Tests        36
Failing Tests        42
```

---

## Common Test Patterns

### 1. Signal Contract Tests
**Purpose**: Validate signal emissions with correct arguments

```gdscript
func test_signal_emission():
    watch_signals(event_bus)
    event_bus.emit_plugin_initialized()
    assert_signal_emitted(event_bus, "plugin_initialized")
```

### 2. Performance Tests
**Purpose**: Ensure operations meet performance budgets

```gdscript
func test_performance():
    var start = Time.get_ticks_usec()
    module.expensive_operation()
    var duration_ms = (Time.get_ticks_usec() - start) / 1000.0
    assert_lt(duration_ms, 2.0, "Should complete in <2ms")
```

### 3. Memory Leak Tests
**Purpose**: Detect memory growth over repeated operations

```gdscript
func test_no_memory_leaks():
    var start_mem = Performance.get_monitor(Performance.MEMORY_STATIC)
    for i in range(100):
        module.do_operation()
    var mem_growth = Performance.get_monitor(Performance.MEMORY_STATIC) - start_mem
    assert_lt(mem_growth, 100000, "Memory growth should be <100KB")
```

---

## Test Writing Guidelines

### Before Writing Tests
1. **Read Module API**: Understand actual method signatures
2. **Check Signal Contracts**: Review SIGNAL_CONTRACTS.md
3. **Review Existing Tests**: Follow established patterns

### Test Structure
```gdscript
extends GutTest

var module = null

func before_each():
    # Setup before each test
    module = ModuleClass.new()

func after_each():
    # Cleanup after each test
    if module:
        module.free()
        module = null

func test_specific_behavior():
    # Arrange
    var input = "test_value"
    
    # Act
    var result = module.process(input)
    
    # Assert
    assert_not_null(result, "Should return a result")
    assert_eq(result.status, "success", "Should succeed")
```

### Best Practices
- ✅ One test per behavior
- ✅ Clear test names (`test_module_does_specific_thing`)
- ✅ Cleanup resources in `after_each()`
- ✅ Use descriptive assertion messages
- ✅ Test both success and failure paths
- ❌ Don't depend on test execution order
- ❌ Don't use time-based assertions (use fixed seeds)
- ❌ Don't leave memory leaks

---

## Debugging Failed Tests

### Step 1: Identify the Failure
Look for the specific assertion that failed:
```
[Failed]:  Expected [<null>] to be anything but NULL:  ConfigManager should have EventBus reference
      at line 75
```

### Step 2: Check Module Implementation
- Does the method exist?
- Does it have the expected signature?
- Does it return the expected type?

### Step 3: Update Test or Module
- **If test is wrong**: Update test to match implementation
- **If module is wrong**: Fix module to match test expectations
- **If both evolved**: Document and align

### Step 4: Re-run Tests
Use the specific test file command to validate fix quickly

---

## Current Test Status

**Last Run**: October 2, 2025  
**Overall**: 36/78 passing (46%)

**Module Status**:
- ✅ **FileWatcher**: 18/19 passing (95%) - EXCELLENT
- ⚠️ **ValidationEngine**: 9/19 passing (47%) - NEEDS WORK
- ⚠️ **Logger**: 4/11 passing (36%) - NEEDS WORK
- ⚠️ **EventBus**: 3/14 passing (21%) - CRITICAL
- ❌ **ConfigManager**: 0/14 passing (0%) - CRITICAL

**Known Issues**:
1. API mismatch between tests and implementations
2. Memory leaks (72 orphaned objects)
3. Performance budget violations in test environment

See `TEST_VALIDATION_REPORT.md` for detailed analysis.

---

## Adding New Tests

### 1. Create Test File
```gdscript
extends GutTest

# Test suite for NewModule
# Phase X Hop Y.Z

var new_module = null
var event_bus = null

func before_each():
    event_bus = preload("res://addons/broken_divinity_devtools/modules/core/event_bus.gd").new()
    new_module = NewModule.new(event_bus)

func after_each():
    if new_module:
        new_module.free()
        new_module = null
    if event_bus:
        event_bus.queue_free()
        event_bus = null

func test_initialization():
    assert_not_null(new_module, "Module should initialize")
    assert_eq(new_module.event_bus, event_bus, "Should store EventBus reference")
```

### 2. Follow Naming Convention
- File: `test_<module_name>.gd`
- Tests: `test_<specific_behavior>()`
- Variables: `module_name` (lowercase with underscores)

### 3. Add to Test Suite
Tests in `tests/` directory are automatically discovered by GUT.

### 4. Document Test Coverage
Update this guide with new test counts and coverage.

---

## Performance Budgets

**Target**: All operations < 2ms

| Operation | Budget | Typical | Status |
|-----------|--------|---------|--------|
| Plugin initialization | 2ms | 1.5ms | ✅ PASS |
| Signal emission | 0.01ms | 0.005ms | ✅ PASS |
| Config load | 2ms | 1.2ms | ✅ PASS |
| Validation run | 5ms | 3.8ms | ✅ PASS |
| File scan | 100ms | 65ms | ✅ PASS |

---

## CI/CD Integration (Future)

### Planned GitHub Actions Workflow
```yaml
name: GUT Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Download Godot
        run: wget https://downloads.tuxfamily.org/godotengine/4.5/Godot_v4.5-stable_linux.x86_64.zip
      - name: Extract Godot
        run: unzip Godot_v4.5-stable_linux.x86_64.zip
      - name: Run Tests
        run: ./Godot_v4.5-stable_linux.x86_64 --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://addons/broken_divinity_devtools/tests/ -gexit
```

---

## Additional Resources

- **GUT Documentation**: https://github.com/bitwes/Gut/wiki
- **Godot Testing Guide**: https://docs.godotengine.org/en/stable/contributing/development/testing.html
- **Signal Expert Guidelines**: `docs/reference/Signal Expert.prompt.md`
- **CTS Validation**: `docs/SIGNAL_CONTRACTS.md`

---

## Questions & Support

For test-related questions:
1. Check this guide first
2. Review existing test files for patterns
3. See TEST_VALIDATION_REPORT.md for known issues
4. Consult Signal Expert guidelines for architecture questions
