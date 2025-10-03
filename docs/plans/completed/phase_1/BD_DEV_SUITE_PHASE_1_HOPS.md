# Phase 1: Foundation & Infrastructure - Hop Implementation Plan

**Phase**: Foundation & Infrastructure  
**Status**: Active Development (Hop 1.1b Complete, 1.1c In Progress)  
**Version**: 2.0 (Updated with CTS-compliant sub-hop structure)  
**Target**: Establish core plugin architecture and validation framework  
**Dependencies**: None (Foundation Phase)

---

## **Phase 1 Overview**

Create the foundational architecture for the Broken Divinity DevTools Suite with emphasis on signal-first design, CTS compliance validation, and comprehensive testing infrastructure. This phase establishes the patterns and validation framework that all subsequent phases will follow.

**Hop-Based Development Convention**: Phase 1 follows the `Phase X.Y[letter]` format where:
- **X = 1**: Phase number (Foundation & Infrastructure)
- **Y = 1-4**: Major hop (Core Foundation, File System, Validation, Search Enhancement)
- **[letter] = a, b, c**: Sub-hop for CTS compliance (<500 lines each, always-green tests)

**Phase Success Criteria**:
- ✅ Plugin loads and registers dock successfully
- ✅ Core EventBus operational with signal monitoring
- ✅ Validation engine operational with CTS compliance checking
- ✅ GUT integration complete with plugin-specific test infrastructure
- ✅ Configuration system operational with JSON schema validation
- ✅ Project indexing system functional with tag-based search
- ✅ All signal contracts documented and tested
- ✅ Performance monitoring active with 2ms pipeline validation

---

## **Hop 1.1a: Plugin Bootstrap & EventBus Core**

### **Scope**
Minimal plugin foundation with EventBus bootstrap mode. **CTS Principle**: Start with absolute minimum to get plugin loading.

### **Deliverables**
1. **Basic Plugin Configuration**
   - `plugin.cfg` with minimal metadata
   - `plugin.gd` with basic initialization only
   - Plugin loads without errors

2. **EventBus Bootstrap Mode**
   - Minimal signal routing (no monitoring yet)
   - Basic signal emission capability
   - Foundation for future coordination

3. **Basic Dock Registration**
   - Empty dock container that appears in editor
   - Basic tab structure (no functionality)
   - Godot node icons placeholder

### **Explicit Non-Goals (For Later Hops)**
- ❌ Configuration management
- ❌ Validation engine
- ❌ Signal monitoring/logging
- ❌ Test generation
- ❌ Professional UI

### **Success Criteria**
- [ ] Plugin appears in Godot plugin manager
- [ ] Plugin enables without errors
- [ ] Empty dock appears in editor
- [ ] EventBus can emit/receive basic signals
- [ ] Plugin initializes within 2ms

---

## **Hop 1.1b: Configuration & Logging Foundation**

### **Scope**
Add configuration system and logging infrastructure. **CTS Principle**: Build on working plugin foundation.

### **Deliverables**
1. **Configuration Management**
   - JSON configuration loading
   - Basic schema validation
   - Default configuration fallback

2. **Structured Logging**
   - Tagged log system
   - Log levels (DEBUG, INFO, WARN, ERROR)
   - Performance-safe logging (no string construction overhead)

3. **Configuration-Driven Initialization**
   - Plugin configuration from JSON
   - EventBus configuration from data files
   - Graceful fallback on config errors

### **Success Criteria**
- [ ] Plugin loads configuration from JSON
- [ ] Configuration validation catches malformed JSON
- [ ] Logs appear with proper tags and levels
- [ ] Configuration errors don't crash plugin
- [ ] All operations complete within 2ms budget

---

## **Hop 1.1c: Validation Engine & Test Templates**

### **Scope**
Add validation framework and test generation capability. **CTS Principle**: Build validation infrastructure now that plugin is stable.

### **Deliverables**
1. **Validation Engine Foundation**
   - CTS compliance validation rules
   - Signal contract validation framework
   - Performance validation templates

2. **GUT Test Templates**
   - Unit test template with Signal Expert patterns
   - Signal contract test template
   - Performance benchmark template

3. **Professional Dock UI**
   - Godot node icons throughout
   - Basic tab functionality
   - Status indicators

### **Success Criteria**
- [ ] Validation engine can check basic CTS violations
- [ ] Test templates generate valid GUT tests
- [ ] Signal contract validation works for EventBus signals
- [ ] Dock UI uses Godot node icons
- [ ] All validation operations complete within 2ms budget

### **Technical Implementation**

#### **File Structure Creation**
```
addons/broken_divinity_devtools/
├── plugin.cfg
├── plugin.gd
├── dock/
│   ├── bd_dock.tscn
│   └── bd_dock.gd
├── modules/
│   └── core/
│       ├── event_bus.gd
│       ├── config_manager.gd
│       ├── logger.gd
│       └── validation_engine.gd
├── data/
│   ├── plugin_config.json
│   ├── signal_registry.json
│   └── schemas/
│       ├── plugin_config.schema.json
│       └── signal_contract.schema.json
├── tests/
│   ├── infrastructure/
│   │   ├── bd_devtools_test_runner.gd
│   │   └── hop_1_1_foundation_test.gd
│   └── templates/
│       ├── unit_test.gd.template
│       ├── signal_contract_test.gd.template
│       └── validation_test.gd.template
└── docs/
    ├── README.md
    └── SIGNAL_CONTRACTS.md
```

#### **Signal Contracts (Hop 1.1)**
```gdscript
# Core Foundation Signals
const SIGNALS = {
    # Plugin Lifecycle
    "plugin_initialized": {
        "args": ["config: Dictionary"],
        "description": "Emitted when plugin completes initialization",
        "frequency": "once_per_session"
    },
    "dock_registered": {
        "args": ["dock_name: String"],
        "description": "Emitted when dock is successfully registered",
        "frequency": "once_per_session"
    },
    "module_loaded": {
        "args": ["module_name: String", "status: String"],
        "description": "Emitted when module loading completes (success/failed)",
        "frequency": "multiple_per_session"
    },
    
    # Validation Events
    "validation_started": {
        "args": ["validation_type: String", "target: String"],
        "description": "Emitted when validation process begins",
        "frequency": "multiple_per_session"
    },
    "validation_complete": {
        "args": ["results: Dictionary"],
        "description": "Emitted when validation completes with results",
        "frequency": "multiple_per_session"
    },
    "cts_violation_detected": {
        "args": ["file_path: String", "violation_type: String", "details: Dictionary"],
        "description": "Emitted when CTS compliance violation is detected",
        "frequency": "multiple_per_session"
    },
    
    # Configuration Events
    "config_loaded": {
        "args": ["config_path: String", "schema_valid: bool"],
        "description": "Emitted when configuration file is loaded",
        "frequency": "multiple_per_session"
    },
    "config_updated": {
        "args": ["section: String", "values: Dictionary"],
        "description": "Emitted when configuration values are updated",
        "frequency": "multiple_per_session"
    },
    "config_validation_failed": {
        "args": ["config_path: String", "errors: Array"],
        "description": "Emitted when configuration fails schema validation",
        "frequency": "multiple_per_session"
    }
}
```

### **Implementation Steps**

#### **Step 1: Plugin Infrastructure (2ms compliance target)**
1. Create `plugin.cfg` with proper addon dependencies
2. Implement `plugin.gd` with dock registration
3. Create basic dock scene and controller
4. Validate plugin loads without errors

#### **Step 2: Core EventBus (Signal-first architecture)**
1. Implement `modules/core/event_bus.gd` with signal registry
2. Add signal emission logging with performance metrics
3. Create signal contract validation framework
4. Test signal emission and reception

#### **Step 3: Validation Engine Foundation**
1. Implement `modules/core/validation_engine.gd`
2. Create CTS compliance validation templates
3. Implement test generation templates for GUT
4. Create performance validation framework

#### **Step 4: Configuration Management**
1. Implement `modules/core/config_manager.gd`
2. Create JSON schema validation system
3. Implement hierarchical configuration loading
4. Test configuration validation and loading

### **Validation Criteria (Hop 1.1)**

#### **Functional Validation**
- [ ] Plugin loads in Godot editor without errors
- [ ] Dock appears in editor interface with proper icon
- [ ] EventBus can emit and receive signals correctly
- [ ] Configuration files load and validate against schemas
- [ ] Validation engine can detect basic CTS violations

#### **Performance Validation**
- [ ] Plugin initialization completes within 2ms
- [ ] Signal emission overhead < 0.01ms per signal
- [ ] Configuration loading completes within 1ms
- [ ] Memory usage remains below 10MB for core systems

#### **Signal Contract Validation**
- [ ] All defined signals emit with correct parameter types
- [ ] Signal emission order follows documented contracts
- [ ] No signal emissions without proper documentation
- [ ] Signal monitoring captures all emissions correctly

#### **GUT Test Integration**
- [ ] BD DevTools test runner integrates with existing GUT framework
- [ ] Test templates generate valid GUT test files
- [ ] All core signal contracts have corresponding GUT tests
- [ ] Performance benchmarks execute and pass thresholds

### **Test Templates Created**

#### **Unit Test Template**
```gdscript
# File: tests/templates/unit_test.gd.template
extends GutTest

# Auto-generated unit test template for BD DevTools
# Module: {{MODULE_NAME}}
# Component: {{COMPONENT_NAME}}
# Generated: {{TIMESTAMP}}

var test_subject
var mock_event_bus

func before_each():
    mock_event_bus = double(EventBus)
    test_subject = {{COMPONENT_CLASS}}.new()
    test_subject.event_bus = mock_event_bus

func after_each():
    test_subject = null
    mock_event_bus = null

func test_{{COMPONENT_NAME}}_initialization():
    # Test component initializes correctly
    assert_not_null(test_subject, "Component should initialize")
    assert_true(test_subject.is_initialized, "Component should report initialized state")

func test_{{COMPONENT_NAME}}_signal_contracts():
    # Validate signal contracts are followed
    var signal_list = test_subject.get_signal_list()
    for signal_info in signal_list:
        assert_true(EventBus.SIGNALS.has(signal_info.name), 
                   "Signal %s must be documented in signal registry" % signal_info.name)

func test_{{COMPONENT_NAME}}_performance():
    # Validate performance requirements
    var start_time = Time.get_time_dict_from_system()
    {{PERFORMANCE_TEST_CODE}}
    var end_time = Time.get_time_dict_from_system()
    var duration_ms = (end_time.unix - start_time.unix) * 1000
    assert_lt(duration_ms, 2.0, "Operation must complete within 2ms")
```

#### **Signal Contract Test Template**
```gdscript
# File: tests/templates/signal_contract_test.gd.template
extends GutTest

# Auto-generated signal contract test for BD DevTools
# Signal: {{SIGNAL_NAME}}
# Generated: {{TIMESTAMP}}

var event_bus
var signal_monitor

func before_all():
    event_bus = EventBus.new()
    signal_monitor = SignalMonitor.new()

func before_each():
    signal_monitor.clear()
    event_bus.connect("{{SIGNAL_NAME}}", signal_monitor.capture_signal)

func after_each():
    if event_bus.is_connected("{{SIGNAL_NAME}}", signal_monitor.capture_signal):
        event_bus.disconnect("{{SIGNAL_NAME}}", signal_monitor.capture_signal)

func test_{{SIGNAL_NAME}}_parameter_types():
    # Test signal emits with correct parameter types
    event_bus.emit_signal("{{SIGNAL_NAME}}", {{SIGNAL_ARGS_EXAMPLE}})
    
    var captured = signal_monitor.get_last_emission("{{SIGNAL_NAME}}")
    assert_not_null(captured, "Signal should be captured")
    assert_eq(captured.args.size(), {{EXPECTED_ARG_COUNT}}, "Signal should have correct parameter count")
    
    {{PARAMETER_TYPE_VALIDATIONS}}

func test_{{SIGNAL_NAME}}_emission_order():
    # Test signal emission follows documented order
    {{EMISSION_ORDER_TEST_CODE}}

func test_{{SIGNAL_NAME}}_performance_impact():
    # Test signal emission performance
    var start_time = Time.get_time_dict_from_system()
    for i in range(1000):
        event_bus.emit_signal("{{SIGNAL_NAME}}", {{SIGNAL_ARGS_EXAMPLE}})
    var end_time = Time.get_time_dict_from_system()
    
    var avg_time_ms = ((end_time.unix - start_time.unix) * 1000) / 1000.0
    assert_lt(avg_time_ms, 0.01, "Signal emission should average < 0.01ms")
```

---

## **Hop 1.2: File System Monitoring & Indexing**

**Major Hop Overview**: Implement file system monitoring, project indexing, and basic search functionality to enable real-time project awareness.

**Sub-Hop Breakdown**:
- **Hop 1.2a**: Basic File System Monitoring
- **Hop 1.2b**: Project Index & Simple Search
- **Hop 1.2c**: Performance Optimization & Rust Integration

---

### **Hop 1.2a: Basic File System Monitoring**

#### **Scope** 
Implement basic file system watching with event emission. **CTS Principle**: Start with simple file change detection.

#### **Prerequisites**
- ✅ Hop 1.1 complete (all sub-hops a, b, c)
- ✅ EventBus operational
- ✅ Logger available

#### **Deliverables**

1. **File Watcher Core** (~300 lines)
   - `file_watcher.gd`: FileSystemWatcher integration
   - Basic file change detection (add, modify, delete)
   - File extension categorization (.gd, .tscn, .json, .md)
   - Debounced change notifications

2. **File Event System** (~150 lines)
   - 3 new signals: `file_added`, `file_modified`, `file_deleted`
   - Signal contracts documented
   - EventBus integration
   - Change event batching

3. **Basic File Metadata** (~100 lines)
   - File metadata structure (path, type, timestamp)
   - Metadata extraction
   - Temporary storage

#### **Explicit Non-Goals**
- ❌ Full project indexing (deferred to 1.2b)
- ❌ Search functionality (deferred to 1.2b)
- ❌ Git integration (deferred to 1.2c)
- ❌ Content analysis (deferred to 1.2c)
- ❌ Performance optimization (deferred to 1.2c)

#### **Signal Contracts (Hop 1.2a)**
```gdscript
# New signals added in Hop 1.2a
const HOP_1_2A_SIGNALS = {
    "file_added": {
        "args": ["file_path: String", "file_type: String"],
        "description": "Emitted when new file is detected",
        "frequency": "high_frequency",
        "emitter": "FileWatcher"
    },
    "file_modified": {
        "args": ["file_path: String", "file_type: String", "timestamp: int"],
        "description": "Emitted when file is modified",
        "frequency": "high_frequency",
        "emitter": "FileWatcher"
    },
    "file_deleted": {
        "args": ["file_path: String", "file_type: String"],
        "description": "Emitted when file is deleted",
        "frequency": "multiple_per_session",
        "emitter": "FileWatcher"
    }
}
```

#### **Success Criteria**
- [ ] File watcher detects file system changes within 100ms
- [ ] All 3 new signals emit correctly
- [ ] File type categorization works for common extensions
- [ ] Debouncing prevents signal spam during bulk operations
- [ ] All Hop 1.1 tests still pass (regression check)
- [ ] GUT tests written for all 3 signals
- [ ] Documentation updated in SIGNAL_CONTRACTS.md

#### **Performance Targets**
- File change detection latency: <100ms
- Signal emission: <0.01ms
- Metadata extraction: <1ms per file
- Memory usage: <5MB

#### **File Structure (Hop 1.2a)**
```
addons/broken_divinity_devtools/
└── modules/
    └── file_system/
        ├── scripts/
        │   └── file_watcher.gd       # NEW: File watching (~300 lines)
        ├── data/
        │   └── file_types.json       # NEW: File type definitions
        └── tests/
            └── test_file_watcher.gd  # NEW: File watcher tests (~200 lines)
```

---

### **Hop 1.2b: Project Index & Simple Search**

#### **Scope**
Build project-wide file index with basic search capabilities. **CTS Principle**: Simple in-memory index first.

#### **Prerequisites**
- ✅ Hop 1.2a complete
- ✅ File watcher operational
- ✅ File change events emitting

#### **Deliverables**

1. **Index Manager** (~400 lines)
   - `index_manager.gd`: In-memory file registry
   - Automatic index updates from file events
   - Index persistence to JSON
   - Index recovery on startup

2. **Simple Search Engine** (~300 lines)
   - `search_engine.gd`: Basic search implementation
   - Exact filename matching
   - Partial filename matching
   - File type filtering

3. **Search API** (~200 lines)
   - Search result structures
   - Search methods (by name, by type, by path)
   - Result ranking (simple relevance)
   - Search history tracking

4. **UI Integration** (~250 lines)
   - Search input in dock
   - Results list display
   - File type filter dropdown
   - Click-to-open navigation

#### **Explicit Non-Goals**
- ❌ Fuzzy search (deferred to 1.2c)
- ❌ Content search (deferred to Hop 1.4)
- ❌ Rust performance optimization (deferred to 1.2c)
- ❌ Advanced filtering (deferred to Hop 1.4)

#### **Signal Contracts (Hop 1.2b)**
```gdscript
# New signals added in Hop 1.2b
const HOP_1_2B_SIGNALS = {
    "index_update_started": {
        "args": ["file_count: int"],
        "description": "Emitted when index update begins",
        "frequency": "multiple_per_session",
        "emitter": "IndexManager"
    },
    "index_update_complete": {
        "args": ["file_count: int", "duration_ms: float"],
        "description": "Emitted when index update completes",
        "frequency": "multiple_per_session",
        "emitter": "IndexManager"
    },
    "search_requested": {
        "args": ["query: String", "filters: Dictionary"],
        "description": "Emitted when search is requested",
        "frequency": "high_frequency",
        "emitter": "SearchEngine"
    },
    "search_complete": {
        "args": ["query: String", "result_count: int", "duration_ms: float"],
        "description": "Emitted when search completes",
        "frequency": "high_frequency",
        "emitter": "SearchEngine"
    }
}
```

#### **Success Criteria**
- [ ] Index tracks all project files correctly
- [ ] Search returns accurate results for filename queries
- [ ] File type filtering works
- [ ] Index persists and restores correctly
- [ ] All 4 new signals emit correctly
- [ ] Search UI responsive and functional
- [ ] All Hop 1.2a tests still pass (regression check)
- [ ] Performance targets met

#### **Performance Targets**
- Full project index: <5 seconds (1000 files)
- Search response: <50ms
- Index persistence: <1 second
- Memory usage: <20MB for typical project

#### **File Structure (Hop 1.2b)**
```
addons/broken_divinity_devtools/
└── modules/
    └── file_system/
        ├── scripts/
        │   ├── index_manager.gd       # NEW: Index management (~400 lines)
        │   └── search_engine.gd       # NEW: Search engine (~300 lines)
        ├── data/
        │   └── project_index.json     # NEW: Persisted index
        ├── ui/
        │   └── search_panel.gd        # NEW: Search UI (~250 lines)
        └── tests/
            ├── test_index_manager.gd  # NEW: Index tests (~300 lines)
            └── test_search_engine.gd  # NEW: Search tests (~250 lines)
```

---

### **Hop 1.2c: Performance Optimization & Rust Integration**

#### **Scope**
Optimize indexing performance with Rust GDExtension for large projects. **CTS Principle**: Add performance when needed.

#### **Prerequisites**
- ✅ Hop 1.2a complete (File watching)
- ✅ Hop 1.2b complete (Basic indexing)
- ✅ Performance bottlenecks identified

#### **Deliverables**

1. **Rust Indexing Core** (~500 lines Rust)
   - `bd_indexer.rs`: High-performance indexing
   - Parallel file processing
   - Efficient metadata extraction
   - Fast search implementation

2. **GDExtension Bridge** (~200 lines GDScript)
   - Rust ↔ GDScript interface
   - Data serialization/deserialization
   - Error handling and fallback
   - Performance monitoring

3. **Git Integration** (~300 lines)
   - Git status tracking
   - Change detection via git
   - Ignore .gitignore files
   - Branch-aware indexing

4. **Advanced Features** (~250 lines)
   - Incremental index updates
   - Index compression
   - Background indexing
   - Index corruption recovery

#### **Explicit Non-Goals**
- ❌ Content-based search (deferred to Hop 1.4)
- ❌ Advanced fuzzy matching (deferred to Hop 1.4)
- ❌ Dependency analysis (deferred to Hop 1.3)

#### **Signal Contracts (Hop 1.2c)**
```gdscript
# New signals added in Hop 1.2c
const HOP_1_2C_SIGNALS = {
    "rust_indexing_started": {
        "args": ["file_count: int", "parallel_threads: int"],
        "description": "Emitted when Rust indexing begins",
        "frequency": "multiple_per_session",
        "emitter": "BDIndexer"
    },
    "git_status_updated": {
        "args": ["changed_files: Array", "branch: String"],
        "description": "Emitted when git status changes",
        "frequency": "multiple_per_session",
        "emitter": "GitIntegration"
    },
    "performance_warning": {
        "args": ["operation: String", "duration_ms: float", "threshold_ms: float"],
        "description": "Emitted when operation exceeds performance threshold",
        "frequency": "rare",
        "emitter": "PerformanceMonitor"
    }
}
```

#### **Success Criteria**
- [ ] Rust indexing significantly faster than GDScript (>5x improvement)
- [ ] Large projects (5000+ files) index within 10 seconds
- [ ] Git integration accurately tracks changes
- [ ] Background indexing doesn't block UI
- [ ] All 3 new signals emit correctly
- [ ] All Hop 1.2a and 1.2b tests still pass (regression check)
- [ ] Performance targets met

#### **Performance Targets**
- Index 5000 files: <10 seconds
- Search 5000 files: <20ms
- Git status check: <500ms
- Memory usage: <50MB for large projects
- Parallel processing efficiency: >80%

#### **File Structure (Hop 1.2c)**
```
addons/broken_divinity_devtools/
├── rust_ext/
│   └── src/
│       └── bd_indexer.rs         # NEW: Rust indexing (~500 lines)
└── modules/
    └── file_system/
        ├── scripts/
        │   ├── rust_bridge.gd        # NEW: Rust interface (~200 lines)
        │   └── git_integration.gd    # NEW: Git tracking (~300 lines)
        └── tests/
            ├── test_rust_indexing.gd # NEW: Rust tests (~250 lines)
            └── test_git_integration.gd # NEW: Git tests (~200 lines)
```

---

## **Hop 1.3: CTS Compliance Validation**

**Major Hop Overview**: Implement CTS compliance validation, project structure analysis, and automated fix suggestions.

**Sub-Hop Breakdown**:
- **Hop 1.3a**: Directory Structure Validation
- **Hop 1.3b**: Asset Categorization & Rules Engine

**Sub-Hop Breakdown**:
- **Hop 1.3a**: Directory Structure Validation
- **Hop 1.3b**: Asset Categorization & Rules Engine

---

### **Hop 1.3a: Directory Structure Validation**

#### **Scope**
Implement CTS directory structure validation - check for required folders and proper organization.

#### **Prerequisites**
- ✅ Hop 1.2 complete (all sub-hops a, b, c)
- ✅ Project index available
- ✅ File metadata accessible

#### **Deliverables**

1. **CTS Structure Validator** (~350 lines)
   - `cts_validator.gd`: Directory structure validation
   - Validate game_systems/ folder structure
   - Check for required folders (scenes/, scripts/, data/, docs/, tests/)
   - Report missing or misplaced directories

2. **Validation Rules Engine** (~250 lines)
   - JSON-based validation rules
   - Configurable directory requirements
   - Rule priority and severity levels
   - Rule conflict resolution

3. **Violation Reporter** (~200 lines)
   - Structured violation reports
   - Violation categorization (error, warning, info)
   - Suggested fixes with context
   - Violation persistence

#### **Explicit Non-Goals**
- ❌ Asset categorization (deferred to 1.3b)
- ❌ Automated fixes (deferred to 1.3b)
- ❌ Advanced dependency analysis (deferred to Hop 1.4)
- ❌ Content validation (deferred to Hop 1.4)

#### **Signal Contracts (Hop 1.3a)**
```gdscript
# New signals added in Hop 1.3a
const HOP_1_3A_SIGNALS = {
    "cts_validation_started": {
        "args": ["scope: String"],
        "description": "Emitted when CTS validation begins",
        "frequency": "multiple_per_session",
        "emitter": "CTSValidator"
    },
    "cts_violation_detected": {
        "args": ["violation_type: String", "path: String", "severity: String", "message: String"],
        "description": "Emitted when CTS violation is found",
        "frequency": "multiple_per_session",
        "emitter": "CTSValidator"
    },
    "cts_validation_complete": {
        "args": ["total_violations: int", "errors: int", "warnings: int", "duration_ms: float"],
        "description": "Emitted when CTS validation completes",
        "frequency": "multiple_per_session",
        "emitter": "CTSValidator"
    }
}
```

#### **Success Criteria**
- [ ] Validates game_systems/ structure correctly
- [ ] Detects missing required folders
- [ ] Reports violations with proper severity
- [ ] All 3 new signals emit correctly
- [ ] Validation completes within 2 seconds
- [ ] All Hop 1.2 tests still pass (regression check)
- [ ] GUT tests cover all validation rules

#### **Performance Targets**
- Structure validation: <2 seconds
- Rule evaluation: <1ms per rule
- Violation reporting: <10ms
- Memory usage: <10MB

#### **File Structure (Hop 1.3a)**
```
addons/broken_divinity_devtools/
└── modules/
    └── validation/
        ├── scripts/
        │   ├── cts_validator.gd          # NEW: CTS validation (~350 lines)
        │   └── violation_reporter.gd     # NEW: Reporting (~200 lines)
        ├── data/
        │   ├── cts_rules.json            # NEW: Validation rules
        │   └── violation_templates.json  # NEW: Fix suggestions
        └── tests/
            └── test_cts_validator.gd     # NEW: Validation tests (~300 lines)
```

---

### **Hop 1.3b: Asset Categorization & Rules Engine**

#### **Scope**
Add asset categorization, automated fix suggestions, and extensible rules system.

#### **Prerequisites**
- ✅ Hop 1.3a complete
- ✅ Directory validation working
- ✅ Violation reporting operational

#### **Deliverables**

1. **Asset Categorizer** (~300 lines)
   - Categorize files by type and purpose
   - Expected location validation
   - Misplaced file detection
   - Smart categorization heuristics

2. **Automated Fix Engine** (~350 lines)
   - Generate fix suggestions for violations
   - One-click fix application
   - Batch fix operations
   - Fix validation and rollback

3. **Extensible Rules System** (~250 lines)
   - Plugin-based rule architecture
   - Custom rule creation API
   - Rule hot-reloading
   - Rule testing framework

4. **Validation UI** (~300 lines)
   - Violation list display
   - Fix suggestion buttons
   - Validation status indicators
   - Click-to-navigate violations

#### **Explicit Non-Goals**
- ❌ Content analysis (deferred to Hop 1.4)
- ❌ Dependency validation (deferred to Hop 1.4)
- ❌ Signal contract validation (covered in Hop 1.1c)

#### **Signal Contracts (Hop 1.3b)**
```gdscript
# New signals added in Hop 1.3b
const HOP_1_3B_SIGNALS = {
    "asset_categorized": {
        "args": ["file_path: String", "category: String", "confidence: float"],
        "description": "Emitted when asset is categorized",
        "frequency": "high_frequency",
        "emitter": "AssetCategorizer"
    },
    "fix_suggested": {
        "args": ["violation_id: String", "fix_description: String", "fix_actions: Array"],
        "description": "Emitted when automated fix is available",
        "frequency": "multiple_per_session",
        "emitter": "FixEngine"
    },
    "fix_applied": {
        "args": ["violation_id: String", "success: bool", "result_message: String"],
        "description": "Emitted when fix is applied",
        "frequency": "multiple_per_session",
        "emitter": "FixEngine"
    }
}
```

#### **Success Criteria**
- [ ] Asset categorization accuracy >90%
- [ ] Automated fixes work for common violations
- [ ] Custom rules can be added via JSON
- [ ] All 3 new signals emit correctly
- [ ] UI displays violations clearly
- [ ] All Hop 1.3a tests still pass (regression check)
- [ ] Fix operations are reversible

#### **Performance Targets**
- Asset categorization: <5ms per file
- Fix generation: <10ms per violation
- Fix application: <100ms
- UI update latency: <50ms

#### **File Structure (Hop 1.3b)**
```
addons/broken_divinity_devtools/
└── modules/
    └── validation/
        ├── scripts/
        │   ├── asset_categorizer.gd  # NEW: Categorization (~300 lines)
        │   ├── fix_engine.gd         # NEW: Automated fixes (~350 lines)
        │   └── rules_engine.gd       # NEW: Rules system (~250 lines)
        ├── ui/
        │   └── validation_panel.gd   # NEW: Validation UI (~300 lines)
        ├── data/
        │   └── custom_rules/         # NEW: Custom rule directory
        └── tests/
            ├── test_asset_categorizer.gd  # NEW: (~250 lines)
            ├── test_fix_engine.gd         # NEW: (~300 lines)
            └── test_rules_engine.gd       # NEW: (~200 lines)
```

---

## **Hop 1.4: Advanced Search & Content Analysis**

**Major Hop Overview**: Enhance search with fuzzy matching, content-based search, and dependency analysis.

**Sub-Hop Breakdown**:
- **Hop 1.4a**: Fuzzy Search & Tag System
- **Hop 1.4b**: Content Search & Dependency Analysis

---

### **Hop 1.4a: Fuzzy Search & Tag System**

#### **Scope**
Add fuzzy search capabilities and tag-based organization. **CTS Principle**: Enhance existing search incrementally.

#### **Prerequisites**
- ✅ Hop 1.2 complete (all sub-hops)
- ✅ Basic search operational
- ✅ Project index available

#### **Deliverables**

1. **Fuzzy Search Engine** (~400 lines)
   - Fuzzy filename matching algorithm
   - Levenshtein distance calculation
   - Result ranking by relevance
   - Search result highlighting

2. **Tag System** (~300 lines)
   - File tagging infrastructure
   - Tag-based search and filtering
   - Tag auto-suggestion
   - Tag persistence

3. **Search History** (~200 lines)
   - Recent searches tracking
   - Search frequency analysis
   - Quick-access recent items
   - Search pattern learning

4. **Enhanced Search UI** (~250 lines)
   - Fuzzy search input with preview
   - Tag filter chips
   - Search history dropdown
   - Advanced filter panel

#### **Explicit Non-Goals**
- ❌ Content search (deferred to 1.4b)
- ❌ Dependency analysis (deferred to 1.4b)
- ❌ AI-powered search (future consideration)

#### **Signal Contracts (Hop 1.4a)**
```gdscript
# New signals added in Hop 1.4a
const HOP_1_4A_SIGNALS = {
    "fuzzy_search_requested": {
        "args": ["query: String", "max_results: int"],
        "description": "Emitted when fuzzy search is requested",
        "frequency": "high_frequency",
        "emitter": "FuzzySearchEngine"
    },
    "tag_added": {
        "args": ["file_path: String", "tag: String"],
        "description": "Emitted when tag is added to file",
        "frequency": "multiple_per_session",
        "emitter": "TagSystem"
    },
    "search_history_updated": {
        "args": ["query: String", "timestamp: int"],
        "description": "Emitted when search history is updated",
        "frequency": "high_frequency",
        "emitter": "SearchHistory"
    }
}
```

#### **Success Criteria**
- [ ] Fuzzy search finds relevant files with typos
- [ ] Tag system organizes files effectively
- [ ] Search history improves workflow
- [ ] All 3 new signals emit correctly
- [ ] Search performance remains <50ms
- [ ] All Hop 1.3 tests still pass (regression check)
- [ ] UI enhancements are intuitive

#### **Performance Targets**
- Fuzzy search: <50ms (1000 files)
- Tag lookup: <10ms
- History access: <5ms
- UI rendering: <16ms (60 FPS)

#### **File Structure (Hop 1.4a)**
```
addons/broken_divinity_devtools/
└── modules/
    └── search/
        ├── scripts/
        │   ├── fuzzy_search_engine.gd  # NEW: Fuzzy search (~400 lines)
        │   ├── tag_system.gd           # NEW: Tagging (~300 lines)
        │   └── search_history.gd       # NEW: History (~200 lines)
        ├── ui/
        │   └── advanced_search_panel.gd # NEW: Search UI (~250 lines)
        ├── data/
        │   ├── tags.json               # NEW: Tag storage
        │   └── search_history.json     # NEW: History storage
        └── tests/
            ├── test_fuzzy_search.gd    # NEW: (~300 lines)
            ├── test_tag_system.gd      # NEW: (~250 lines)
            └── test_search_history.gd  # NEW: (~200 lines)
```

---

### **Hop 1.4b: Content Search & Dependency Analysis**

#### **Scope**
Add content-based search for code and text files, plus dependency relationship mapping.

#### **Prerequisites**
- ✅ Hop 1.4a complete
- ✅ Fuzzy search operational
- ✅ Tag system functional

#### **Deliverables**

1. **Content Search Engine** (~450 lines)
   - Full-text search for .gd and .md files
   - Regex pattern matching
   - Context-aware results
   - Code symbol search

2. **Dependency Analyzer** (~400 lines)
   - Script dependency detection
   - Scene dependency mapping
   - Resource reference tracking
   - Circular dependency detection

3. **Advanced Filtering** (~300 lines)
   - Multi-criteria filtering
   - Filter combinations (AND/OR/NOT)
   - Saved filter presets
   - Filter performance optimization

4. **Search API Expansion** (~250 lines)
   - Rich search result objects
   - Search result serialization
   - API for addon integration
   - Search analytics

#### **Explicit Non-Goals**
- ❌ AI-powered semantic search (future)
- ❌ Cross-project search (future)
- ❌ Cloud-based indexing (future)

#### **Signal Contracts (Hop 1.4b)**
```gdscript
# New signals added in Hop 1.4b
const HOP_1_4B_SIGNALS = {
    "content_search_requested": {
        "args": ["query: String", "file_types: Array", "include_regex: bool"],
        "description": "Emitted when content search is requested",
        "frequency": "multiple_per_session",
        "emitter": "ContentSearchEngine"
    },
    "dependency_discovered": {
        "args": ["source_file: String", "dependency_file: String", "dependency_type: String"],
        "description": "Emitted when dependency is discovered",
        "frequency": "high_frequency",
        "emitter": "DependencyAnalyzer"
    },
    "circular_dependency_detected": {
        "args": ["dependency_chain: Array"],
        "description": "Emitted when circular dependency is found",
        "frequency": "rare",
        "emitter": "DependencyAnalyzer"
    }
}
```

#### **Success Criteria**
- [ ] Content search finds code symbols accurately
- [ ] Dependency analysis maps project structure
- [ ] Circular dependencies are detected
- [ ] Advanced filtering works correctly
- [ ] All 3 new signals emit correctly
- [ ] Search API usable by other addons
- [ ] All Hop 1.4a tests still pass (regression check)
- [ ] Performance targets met

#### **Performance Targets**
- Content search: <200ms (100 files)
- Dependency analysis: <5 seconds (full project)
- Filter application: <20ms
- API response: <10ms

#### **File Structure (Hop 1.4b)**
```
addons/broken_divinity_devtools/
└── modules/
    └── search/
        ├── scripts/
        │   ├── content_search_engine.gd  # NEW: Content search (~450 lines)
        │   ├── dependency_analyzer.gd    # NEW: Dependencies (~400 lines)
        │   ├── advanced_filter.gd        # NEW: Filtering (~300 lines)
        │   └── search_api.gd             # NEW: API (~250 lines)
        ├── data/
        │   └── dependency_graph.json     # NEW: Dependency data
        └── tests/
            ├── test_content_search.gd    # NEW: (~350 lines)
            ├── test_dependency_analyzer.gd # NEW: (~400 lines)
            └── test_advanced_filter.gd   # NEW: (~250 lines)
```

---

## **Hop 1.1: Core Plugin Foundation (DETAILED IMPLEMENTATION)**

### **Hop 1.1a: Plugin Bootstrap & EventBus Core**

### **Technical Implementation**

#### **File Structure Extension**
```
modules/
└── index_search/
    ├── scripts/
    │   ├── index_manager.gd
    │   ├── search_engine.gd
    │   ├── file_watcher.gd
    │   └── project_analyzer.gd
    ├── data/
    │   ├── index_schema.json
    │   ├── search_config.json
    │   └── file_type_mappings.json
    ├── rust_ext/
    │   ├── Cargo.toml
    │   ├── src/
    │   │   ├── lib.rs
    │   │   ├── indexer.rs
    │   │   └── search.rs
    │   └── gdextension/
    └── tests/
        ├── test_index_manager.gd
        ├── test_search_engine.gd
        └── test_file_watcher.gd
```

#### **Signal Contracts (Hop 1.2 - Basic File Monitoring)**
```gdscript
# Basic File Monitoring Signals
const FILE_MONITORING_SIGNALS = {
    # Basic file events
    "file_detected": {
        "args": ["file_path: String", "file_type: String"],
        "description": "Emitted when new file is detected",
        "frequency": "moderate"
    },
    "file_modified": {
        "args": ["file_path: String", "modification_time: float"],
        "description": "Emitted when file is modified",
        "frequency": "moderate"
    },
    "file_removed": {
        "args": ["file_path: String"],
        "description": "Emitted when file is removed",
        "frequency": "low"
    },
    
    # Basic search events
    "search_requested": {
        "args": ["query: String", "file_type_filter: String"],
        "description": "Emitted when basic search is requested",
        "frequency": "moderate"
    },
    "search_results_ready": {
        "args": ["results: Array", "query: String"],
        "description": "Emitted when search results are available",
        "frequency": "moderate"
    }
}
```

#### **Signal Contracts (Hop 1.3 - CTS Validation)**
```gdscript
# CTS Structure Validation Signals
const CTS_VALIDATION_SIGNALS = {
    # Validation events
    "cts_validation_started": {
        "args": ["scope: String"],
        "description": "Emitted when CTS validation begins",
        "frequency": "low"
    },
    "cts_violation_detected": {
        "args": ["violation_type: String", "file_path: String", "expected_location: String"],
        "description": "Emitted when CTS structure violation is found",
        "frequency": "moderate"
    },
    "cts_validation_complete": {
        "args": ["total_files: int", "violations: int"],
        "description": "Emitted when CTS validation completes",
        "frequency": "low"
    }
}
```

#### **Signal Contracts (Hop 1.4 - Enhanced Search)**
```gdscript
# Enhanced Search Signals
const ENHANCED_SEARCH_SIGNALS = {
    # Advanced search events
    "fuzzy_search_requested": {
        "args": ["query: String", "filters: Dictionary"],
        "description": "Emitted when fuzzy search is requested",
        "frequency": "high"
    },
    "content_search_requested": {
        "args": ["query: String", "file_types: Array"],
        "description": "Emitted when content search is requested",
        "frequency": "moderate"
    },
    "search_performance_warning": {
        "args": ["search_type: String", "duration_ms: float", "threshold_ms: float"],
        "description": "Emitted when search exceeds performance threshold",
        "frequency": "rare"
    }
}
```
    },
    "search_performance_warning": {
        "args": ["query: String", "duration_ms: float"],
        "description": "Emitted when search exceeds performance thresholds",
        "frequency": "rare"
    },
    
    # File System Events
    "file_changed": {
        "args": ["file_path: String", "change_type: String"],
        "description": "Emitted when file system change is detected",
        "frequency": "high_frequency"
    },
    "directory_structure_changed": {
        "args": ["root_path: String", "change_summary: Dictionary"],
        "description": "Emitted when significant directory changes occur",
        "frequency": "multiple_per_session"
    },
    
    # Tag Management
    "tag_updated": {
        "args": ["file_path: String", "tags: Array"],
        "description": "Emitted when file tags are updated",
        "frequency": "multiple_per_session"
    },
    "tag_system_rebuilt": {
        "args": ["tag_count: int", "file_count: int"],
        "description": "Emitted when tag system is rebuilt",
        "frequency": "rare"
    }
}
```

### **Implementation Steps**

#### **Step 1: File System Monitoring**
1. Implement `file_watcher.gd` with FileSystemDock integration
2. Create real-time change detection system
3. Implement debounced index updates
4. Add git integration for change tracking

#### **Step 2: Core Indexing System (Rust Integration)**
1. Create Rust GDExtension for performance-critical indexing
2. Implement parallel file processing
3. Create metadata extraction and storage
4. Add index persistence and recovery

#### **Step 3: Search Engine Implementation**
1. Implement tag-based search with fuzzy matching
2. Create search result ranking and filtering
3. Add search performance optimization
4. Implement search API for other tools

#### **Step 4: Project Analysis Framework**
1. Create CTS compliance analysis
2. Implement asset categorization system
3. Add dependency relationship mapping
4. Create project health metrics

### **Rust Performance Integration**

#### **Indexing Performance Requirements**
- Index 1000 files in < 100ms
- Search response time < 10ms for typical queries
- Memory usage < 50MB for full project index
- Parallel processing for large directories

#### **Rust Module Interface**
```rust
// File: rust_ext/src/lib.rs
use godot::prelude::*;
use godot::classes::{Resource, RefCounted};

#[derive(GodotClass)]
#[class(base=RefCounted)]
pub struct BDIndexer {
    base: Base<RefCounted>,
    index_data: HashMap<String, FileMetadata>,
}

#[godot_api]
impl BDIndexer {
    #[func]
    pub fn index_directory(&mut self, path: String) -> Dictionary {
        // High-performance directory indexing
    }
    
    #[func]
    pub fn search_files(&self, query: String, filters: Dictionary) -> Array<Dictionary> {
        // Optimized search with fuzzy matching
    }
    
    #[func]
    pub fn update_file_index(&mut self, file_path: String) -> bool {
        // Incremental file index updates
    }
}
```

### **Validation Criteria (Hop 1.2)**

#### **Functional Validation**
- [ ] File system changes trigger automatic index updates
- [ ] Search returns accurate results for all file types
- [ ] Tag-based filtering works correctly
- [ ] Index persists across editor sessions
- [ ] CTS compliance analysis identifies violations

#### **Performance Validation**
- [ ] Full project index completes within 5 seconds
- [ ] Search results appear within 10ms
- [ ] Memory usage stays below 50MB for large projects
- [ ] File change detection latency < 100ms

#### **Integration Validation**
- [ ] EventBus receives all index/search signals
- [ ] Rust extension loads and functions correctly
- [ ] Git integration tracks file changes accurately
- [ ] Other modules can consume search API

#### **Reliability Validation**
- [ ] Index corruption detection and recovery works
- [ ] Large file handling doesn't crash system
- [ ] Concurrent access to index is thread-safe
- [ ] Index survives editor crashes and restarts

---

## **Phase 1 Validation & Completion**

### **Phase 1 Success Metrics**

#### **Technical Metrics**
1. **Performance Compliance**
   - All operations complete within 2ms target
   - Index/search performance meets Rust-optimized targets
   - Memory usage below defined thresholds
   - Signal emission overhead minimal

2. **Signal Architecture**
   - 100% signal contract documentation coverage
   - All signals have corresponding GUT tests
   - EventBus handles all plugin communications
   - Signal performance monitoring active

3. **CTS Compliance**
   - Validation engine detects all major CTS violations
   - Generated code follows CTS standards
   - File organization follows defined patterns
   - Documentation is auto-generated and current

4. **Testing Infrastructure**
   - GUT integration fully operational
   - Test templates generate valid test code
   - All modules have comprehensive test coverage
   - Performance regression tests operational

#### **Integration Metrics**
1. **Addon Integration**
   - Works alongside existing mature addons
   - No conflicts with Dialogue Manager, GUT, etc.
   - Proper integration with AsciiScreen performance
   - Database Bridge compatibility maintained

2. **Development Workflow**
   - Plugin loads reliably in development environment
   - Dock interface is responsive and intuitive
   - Search functionality aids daily development
   - Validation provides actionable feedback

### **Phase 1 Final Validation Test Suite**

#### **End-to-End Workflow Test**
```gdscript
# File: tests/integration/test_phase_1_complete.gd
extends GutTest

func test_complete_plugin_workflow():
    # Test complete Phase 1 functionality
    var plugin = load("res://addons/broken_divinity_devtools/plugin.gd").new()
    
    # 1. Plugin loads and initializes
    plugin._enter_tree()
    yield(get_tree().create_timer(0.1), "timeout")  # Allow initialization
    assert_true(plugin.is_initialized, "Plugin should initialize successfully")
    
    # 2. EventBus is operational
    var event_bus = plugin.get_event_bus()
    assert_not_null(event_bus, "EventBus should be available")
    
    # 3. Index system functions
    var index_manager = plugin.get_index_manager()
    index_manager.index_project()
    yield(index_manager, "index_update_complete")
    assert_gt(index_manager.get_file_count(), 0, "Should index project files")
    
    # 4. Search functions
    var search_results = index_manager.search("test")
    assert_is(search_results, Array, "Search should return results array")
    
    # 5. Validation engine functions
    var validator = plugin.get_validation_engine()
    var validation_results = validator.validate_project_cts()
    assert_true(validation_results.has("compliance_score"), "Should return compliance metrics")
    
    plugin._exit_tree()
```

### **Phase 1 Deliverable Checklist**

- [ ] **Core Plugin Infrastructure**
  - [ ] Plugin.cfg properly configured
  - [ ] Plugin loads without errors
  - [ ] Dock integration functional
  - [ ] Professional UI with Godot icons

- [ ] **EventBus System**
  - [ ] Central signal coordination operational
  - [ ] All signals documented and tested
  - [ ] Signal performance monitoring active
  - [ ] Signal contract validation working

- [ ] **Validation Engine**
  - [ ] CTS compliance checking functional
  - [ ] Test template generation working
  - [ ] Performance validation operational

---

## **Error Recovery & Rollback Strategies**

### **Plugin Initialization Failures**
**Failure Scenarios**: Plugin fails to load, dock registration fails, configuration corruption
**Recovery Actions**:
1. Fall back to minimal configuration with default settings
2. Disable failing modules and continue with working ones
3. Show user-friendly error messages with repair suggestions
4. Provide one-click configuration reset option

### **EventBus Communication Failures**
**Failure Scenarios**: Signal emission failures, connection breakdowns, performance degradation
**Recovery Actions**:
1. Automatic signal route redundancy with fallback paths
2. Signal emission timeout with automatic retry (max 3 attempts)
3. Performance throttling when signal rates exceed thresholds
4. Graceful degradation to direct method calls when signal system fails

### **Validation Engine Failures**
**Failure Scenarios**: Schema validation errors, test generation failures, CTS validation crashes
**Recovery Actions**:
1. Skip validation for corrupted files and mark for manual review
2. Fall back to basic validation when advanced validation fails
3. Cache last known good validation state for rollback
4. Provide manual validation bypass with warning notices

### **File System Monitoring Failures**
**Failure Scenarios**: File watcher crashes, index corruption, search failures
**Recovery Actions**:
1. Automatic index rebuild from file system scan
2. Search fallback to simple file listing when index fails
3. Graceful degradation to manual refresh when auto-monitoring fails
4. Index corruption detection with automatic repair

### **Configuration State Management**
**State Coordination**: Track all subsystem states for coordinated rollback
**Rollback Triggers**: 
- Any subsystem failure that impacts core functionality
- Performance degradation below 2ms pipeline compliance
- Signal contract violations that break addon integration
- User-initiated reset or recovery mode activation

### **Concurrency & Thread Safety**
**Background Operations**: File monitoring, index building, validation scanning
**Coordination Strategy**:
- Use `call_deferred()` for all UI updates from background threads
- Implement work stealing queues for background task distribution
- Maintain thread-safe state through message passing patterns
- Provide cancellation tokens for long-running background operations
  - [ ] GUT integration complete

- [ ] **Configuration Management**
  - [ ] JSON schema validation working
  - [ ] Hierarchical config loading functional
  - [ ] Runtime config updates supported
  - [ ] Configuration persistence working

- [ ] **Index & Search System**
  - [ ] File system monitoring operational
  - [ ] Real-time indexing functional
  - [ ] Search engine performance optimized
  - [ ] Tag-based search working
  - [ ] Rust integration performance verified

- [ ] **Testing Infrastructure**
  - [ ] BD DevTools test runner functional
  - [ ] Test templates generate valid tests
  - [ ] All signal contracts tested
  - [ ] Performance regression tests operational

### **Phase 1 → Phase 2 Transition Criteria**

**Prerequisites for Phase 2 Start**:
1. All Phase 1 validation tests pass
2. Performance benchmarks meet targets
3. Signal contracts 100% documented and tested
4. Index system handles full BD project scope
5. Validation engine detects CTS violations accurately
6. No memory leaks or performance regressions
7. Integration with existing addons verified
8. Development workflow improvement demonstrated

**Handoff Deliverables**:
1. Complete Phase 1 codebase with tests
2. Performance benchmark baseline established
3. Signal contract registry fully populated
4. Template generation system ready for expansion
5. Validation framework ready for template analysis
6. Index system ready to catalog scene templates
7. Configuration system ready for template schemas

This foundation ensures Phase 2 can focus on scene generation and template analysis while maintaining the rigorous validation and testing standards established in Phase 1.