# Hop 1.2c: Performance Optimization & Rust Integration
**Phase**: 1.2c - Performance & Advanced Features  
**Status**: In Progress  
**Prerequisites**: Hop 1.2a (FileWatcher), Hop 1.2b (IndexManager) Complete  
**Target Completion**: ~1250 lines (Rust + GDScript + Tests)

---

## **Architecture Overview**

Following **Signal Expert** principles for Rust integration:
- **Minimal FFI Surface**: Batch operations, stable structs
- **Deterministic Ordering**: No HashMap iteration, sorted results
- **Signal Compliance**: All Rust operations emit signals via EventBus
- **Performance Focus**: Parallel processing, arena allocation, zero-copy where possible
- **Graceful Fallback**: GDScript implementation if Rust unavailable

### **Performance Targets (Signal Expert Compliance)**
- Index 5000 files: **<10 seconds** (vs 25+ seconds GDScript baseline)
- Search 5000 files: **<20ms** (vs 100ms GDScript baseline)
- Git status check: **<500ms**
- Memory usage: **<50MB** for large projects
- Parallel efficiency: **>80%**
- Pipeline compliance: **2ms per operation** (monitoring enabled)

---

## **Signal Contracts (Hop 1.2c)**

### **New Signals Added to EventBus**

```gdscript
# Performance & Rust Integration Signals (Hop 1.2c)
signal rust_indexing_started(file_count: int, parallel_threads: int)
signal git_status_updated(changed_files: Array, branch: String)
signal performance_warning(operation: String, duration_ms: float, threshold_ms: float)
```

### **Signal Emission Contracts**

#### **rust_indexing_started**
- **Emitter**: RustBridge (via IndexManager)
- **Frequency**: Multiple per session (bulk re-indexing)
- **Args**:
  - `file_count: int` - Total files to index
  - `parallel_threads: int` - Number of Rust threads spawned
- **Follows**: `index_updated` signal from Hop 1.2b
- **Performance**: Emission overhead <0.01ms

#### **git_status_updated**
- **Emitter**: GitIntegration
- **Frequency**: Multiple per session (git operations detected)
- **Args**:
  - `changed_files: Array[String]` - Paths of modified files
  - `branch: String` - Current git branch
- **Follows**: File system events from FileWatcher
- **Performance**: Emission overhead <0.01ms

#### **performance_warning**
- **Emitter**: PerformanceMonitor (centralized)
- **Frequency**: Rare (only when thresholds exceeded)
- **Args**:
  - `operation: String` - Operation name (e.g., "rust_indexing", "search")
  - `duration_ms: float` - Actual duration
  - `threshold_ms: float` - Expected threshold
- **Follows**: Any performance-tracked operation
- **Performance**: Emission overhead <0.01ms

---

## **Rust Implementation Plan**

### **File: .rust/src/bd_indexer.rs (~500 lines)**

```rust
// Core indexing module following Signal Expert Rust principles
use godot::prelude::*;
use rayon::prelude::*; // Parallel processing
use std::path::PathBuf;
use std::sync::Arc;

/// High-performance file indexer with deterministic output
#[derive(GodotClass)]
#[class(base=RefCounted)]
pub struct BDIndexer {
    #[base]
    base: Base<RefCounted>,
    
    // Configuration
    thread_count: usize,
    enable_parallel: bool,
    
    // Performance tracking
    last_index_duration_ms: f64,
    last_search_duration_ms: f64,
}

#[godot_api]
impl BDIndexer {
    /// Index files in parallel with deterministic ordering
    /// Returns: Dictionary { "file_count": int, "duration_ms": float, "files": Array }
    #[func]
    fn index_files(&mut self, paths: Array<GString>) -> Dictionary {
        // Implementation: Parallel processing with deterministic sort
        // - Use rayon for parallel file scanning
        // - Collect results into Vec, sort by path (deterministic)
        // - Extract metadata without allocations where possible
        // - Return structured Dictionary (stable FFI)
    }
    
    /// Fast search with relevance ranking
    #[func]
    fn search_files(&self, query: GString, index_data: Dictionary) -> Array<Dictionary> {
        // Implementation: Fast search with ranking
        // - Exact match = 100 points
        // - StartsWith = 75 points
        // - Contains = 50 points
        // - Sort by score DESC, then path ASC (deterministic)
    }
    
    /// Extract file metadata efficiently
    #[func]
    fn extract_metadata(&self, path: GString) -> Dictionary {
        // Implementation: Zero-copy metadata extraction
        // - File size, modification time
        // - Extension detection
        // - Return stable Dictionary structure
    }
}

// Key Principles Applied:
// 1. Deterministic: Always sort results by path
// 2. Stable FFI: Dictionary/Array only (no complex structs)
// 3. Performance: Parallel with rayon, minimal allocations
// 4. Safe: No unsafe blocks, proper error handling
```

### **File: addons/broken_divinity_devtools/modules/indexing/rust_bridge.gd (~200 lines)**

```gdscript
extends RefCounted
class_name RustBridge
## Rust <-> GDScript bridge for high-performance indexing
## 
## Provides graceful fallback to GDScript if Rust unavailable.
## All Rust operations emit signals via EventBus for monitoring.
##
## Signal Expert Compliance:
## - Minimal FFI surface (batch operations)
## - Stable data structures (Dictionary/Array)
## - Graceful degradation (fallback to IndexManager)
## - Performance monitoring (emit performance_warning)

# Dependencies
var event_bus: EventBus
var logger: Logger
var config_manager: ConfigManager
var index_manager: IndexManager  # Fallback implementation

# Rust extension instance
var _rust_indexer: BDIndexer = null
var _rust_available: bool = false

# Performance tracking
var _last_operation_duration_ms: float = 0.0
const PERFORMANCE_THRESHOLD_MS: float = 2.0  # Signal Expert: 2ms pipeline

func _init(p_event_bus: EventBus, p_logger: Logger, p_config: ConfigManager, p_index: IndexManager):
    event_bus = p_event_bus
    logger = p_logger
    config_manager = p_config
    index_manager = p_index
    
    _initialize_rust_bridge()

func _initialize_rust_bridge() -> void:
    ## Attempt to load Rust extension with graceful fallback
    
    if not ClassDB.class_exists("BDIndexer"):
        logger.log_warning("RustBridge", "Rust extension not available, using GDScript fallback")
        _rust_available = false
        return
    
    _rust_indexer = BDIndexer.new()
    _rust_available = true
    logger.log_info("RustBridge", "Rust indexer initialized successfully")

func index_files_batch(file_paths: Array) -> Dictionary:
    ## Index multiple files using Rust (or fallback to GDScript)
    ##
    ## Returns: { "success": bool, "file_count": int, "duration_ms": float }
    
    var start_time := Time.get_ticks_msec()
    var result := {}
    
    if _rust_available:
        # Use Rust implementation
        var thread_count := OS.get_processor_count()
        event_bus.emit_rust_indexing_started(file_paths.size(), thread_count)
        
        result = _rust_indexer.index_files(file_paths)
        
    else:
        # Fallback to GDScript
        logger.log_warning("RustBridge", "Using GDScript fallback for indexing")
        result = _fallback_index_files(file_paths)
    
    var duration_ms := (Time.get_ticks_msec() - start_time) as float
    _last_operation_duration_ms = duration_ms
    
    # Emit performance warning if threshold exceeded
    if duration_ms > PERFORMANCE_THRESHOLD_MS:
        event_bus.emit_performance_warning("rust_indexing", duration_ms, PERFORMANCE_THRESHOLD_MS)
    
    result["duration_ms"] = duration_ms
    return result

func search_files_fast(query: String, index_data: Dictionary) -> Array:
    ## Fast search using Rust (or fallback to GDScript)
    
    var start_time := Time.get_ticks_msec()
    var results := []
    
    if _rust_available:
        results = _rust_indexer.search_files(query, index_data)
    else:
        results = index_manager.search_partial(query)
    
    var duration_ms := (Time.get_ticks_msec() - start_time) as float
    
    if duration_ms > PERFORMANCE_THRESHOLD_MS:
        event_bus.emit_performance_warning("search", duration_ms, PERFORMANCE_THRESHOLD_MS)
    
    return results

func is_rust_available() -> bool:
    ## Check if Rust extension is loaded
    return _rust_available

func _fallback_index_files(file_paths: Array) -> Dictionary:
    ## GDScript fallback implementation
    var indexed_count := 0
    
    for file_path in file_paths:
        if index_manager.add_file(file_path):
            indexed_count += 1
    
    return {
        "success": true,
        "file_count": indexed_count
    }
```

---

## **Git Integration Plan**

### **File: addons/broken_divinity_devtools/modules/file_system/git_integration.gd (~300 lines)**

```gdscript
extends RefCounted
class_name GitIntegration
## Git repository integration for file tracking
##
## Provides git status monitoring, .gitignore respect, branch tracking.
## Emits git_status_updated signal on repository changes.
##
## Signal Expert Compliance:
## - Respects .gitignore (don't index ignored files)
## - Deterministic output (sorted file lists)
## - Performance target: <500ms for status check
## - Signal emission on git operations

# Dependencies
var event_bus: EventBus
var logger: Logger
var file_watcher: FileWatcher

# Git state
var _git_root: String = ""
var _current_branch: String = ""
var _gitignore_patterns: Array[String] = []
var _last_status_check_ms: int = 0

const STATUS_CHECK_INTERVAL_MS: int = 5000  # Check every 5 seconds

func _init(p_event_bus: EventBus, p_logger: Logger, p_watcher: FileWatcher):
    event_bus = p_event_bus
    logger = p_logger
    file_watcher = p_watcher
    
    _detect_git_repository()
    _load_gitignore_patterns()

func _detect_git_repository() -> bool:
    ## Find .git directory in project root
    var project_root := ProjectSettings.globalize_path("res://")
    var git_dir := project_root.path_join(".git")
    
    if DirAccess.dir_exists_absolute(git_dir):
        _git_root = project_root
        _current_branch = _get_current_branch()
        logger.log_info("GitIntegration", "Git repository detected: %s (branch: %s)" % [_git_root, _current_branch])
        return true
    
    logger.log_info("GitIntegration", "No git repository detected")
    return false

func check_status() -> Dictionary:
    ## Check git status and emit signal if changes detected
    ## Returns: { "changed_files": Array[String], "branch": String, "is_clean": bool }
    
    if _git_root.is_empty():
        return {"is_clean": true, "changed_files": [], "branch": ""}
    
    var start_time := Time.get_ticks_msec()
    
    # Execute git status --porcelain
    var output := []
    var exit_code := OS.execute("git", ["-C", _git_root, "status", "--porcelain"], output, true)
    
    if exit_code != 0:
        logger.log_error("GitIntegration", "Git status failed: %d" % exit_code)
        return {"is_clean": true, "changed_files": [], "branch": _current_branch}
    
    # Parse output
    var changed_files := _parse_git_status(output[0] if output.size() > 0 else "")
    var is_clean := changed_files.is_empty()
    
    # Emit signal if changes detected
    if not is_clean:
        event_bus.emit_git_status_updated(changed_files, _current_branch)
    
    var duration_ms := Time.get_ticks_msec() - start_time
    _last_status_check_ms = duration_ms
    
    # Performance check
    if duration_ms > 500:
        event_bus.emit_performance_warning("git_status", duration_ms, 500.0)
    
    return {
        "is_clean": is_clean,
        "changed_files": changed_files,
        "branch": _current_branch
    }

func should_ignore_file(file_path: String) -> bool:
    ## Check if file matches .gitignore patterns
    for pattern in _gitignore_patterns:
        if _matches_gitignore_pattern(file_path, pattern):
            return true
    return false

func _load_gitignore_patterns() -> void:
    ## Load and parse .gitignore file
    if _git_root.is_empty():
        return
    
    var gitignore_path := _git_root.path_join(".gitignore")
    if not FileAccess.file_exists(gitignore_path):
        return
    
    var file := FileAccess.open(gitignore_path, FileAccess.READ)
    if file:
        while not file.eof_reached():
            var line := file.get_line().strip_edges()
            if not line.is_empty() and not line.begins_with("#"):
                _gitignore_patterns.append(line)
        file.close()
    
    logger.log_info("GitIntegration", "Loaded %d .gitignore patterns" % _gitignore_patterns.size())

func _get_current_branch() -> String:
    ## Get current git branch name
    var output := []
    OS.execute("git", ["-C", _git_root, "branch", "--show-current"], output, true)
    return output[0].strip_edges() if output.size() > 0 else "unknown"

func _parse_git_status(status_text: String) -> Array[String]:
    ## Parse git status --porcelain output
    var changed_files: Array[String] = []
    var lines := status_text.split("\n")
    
    for line in lines:
        if line.length() < 4:
            continue
        
        # Format: "XY filename" where XY is status code
        var file_path := line.substr(3).strip_edges()
        if not file_path.is_empty():
            changed_files.append(file_path)
    
    # Deterministic ordering (Signal Expert requirement)
    changed_files.sort()
    return changed_files

func _matches_gitignore_pattern(path: String, pattern: String) -> bool:
    ## Simple gitignore pattern matching
    # TODO: Implement full gitignore spec (wildcards, negation, etc.)
    if pattern.ends_with("/"):
        return path.begins_with(pattern)
    return path.contains(pattern)
```

---

## **Testing Strategy**

### **Test Coverage (GUT Framework)**

#### **Test 1: test_rust_bridge.gd (~250 lines)**
```gdscript
# Tests:
# - Rust extension loading (with/without BDIndexer)
# - Graceful fallback to GDScript
# - Batch indexing performance
# - Fast search performance
# - Signal emission (rust_indexing_started, performance_warning)
# - Performance threshold detection
```

#### **Test 2: test_git_integration.gd (~200 lines)**
```gdscript
# Tests:
# - Git repository detection
# - .gitignore pattern loading
# - Status check execution
# - File ignore pattern matching
# - Signal emission (git_status_updated)
# - Performance <500ms target
```

#### **Test 3: test_performance_targets.gd (~150 lines)**
```gdscript
# Tests:
# - 5000 file indexing <10s
# - Search 5000 files <20ms
# - Memory usage <50MB
# - Parallel efficiency >80%
# - Pipeline compliance 2ms
```

---

## **Implementation Steps (CTS Compliance)**

### **Step 1: Update EventBus** (COMPLETE FIRST)
- Add 3 new signals to event_bus.gd
- Add emit functions
- Update SIGNALS constant
- Document signal contracts

### **Step 2: Implement Rust Core** (ISOLATED)
- Create bd_indexer.rs
- Implement parallel indexing
- Implement fast search
- Test Rust module standalone

### **Step 3: Create GDScript Bridge** (INTEGRATION)
- Implement rust_bridge.gd
- Add graceful fallback
- Integrate with IndexManager
- Test with/without Rust

### **Step 4: Git Integration** (FEATURE)
- Implement git_integration.gd
- Add .gitignore support
- Test status checking
- Validate performance

### **Step 5: Testing & Validation** (VERIFICATION)
- Create all GUT tests
- Run performance benchmarks
- Validate signal contracts
- Regression test Hop 1.2a/1.2b

### **Step 6: Documentation** (COMPLETION)
- Create HOP_1_2C_COMPLETE.md
- Update signal contracts
- Document performance results
- Update plugin docs

---

## **Success Criteria**

### **Functional**
- ✅ Rust indexer operational (or graceful GDScript fallback)
- ✅ 5000+ file projects index successfully
- ✅ Git integration tracks repository status
- ✅ .gitignore patterns respected
- ✅ All 3 new signals emit correctly
- ✅ Performance monitoring active

### **Performance**
- ✅ 5000 files index: <10 seconds
- ✅ Search 5000 files: <20ms
- ✅ Git status check: <500ms
- ✅ Memory usage: <50MB
- ✅ Parallel efficiency: >80%

### **Testing**
- ✅ All Rust bridge tests pass
- ✅ All Git integration tests pass
- ✅ Performance benchmarks pass
- ✅ Regression tests pass (Hop 1.2a/1.2b)
- ✅ 100% signal contract coverage

### **Documentation**
- ✅ HOP_1_2C_COMPLETE.md created
- ✅ Signal contracts documented
- ✅ Performance results published
- ✅ Rust integration guide updated

---

## **Signal Expert Compliance Checklist**

- ✅ **Deterministic**: Rust results always sorted
- ✅ **Minimal FFI**: Dictionary/Array only
- ✅ **Signal Contracts**: All 3 signals documented
- ✅ **Performance**: 2ms pipeline monitored
- ✅ **Graceful Degradation**: GDScript fallback
- ✅ **Testing**: GUT tests for all contracts
- ✅ **Documentation**: Complete signal docs
- ✅ **No Globals**: No hidden Rust state
- ✅ **Safe Rust**: No unsafe blocks
- ✅ **Profile Ready**: cargo flamegraph compatible
