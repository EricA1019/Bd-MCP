# Broken Divinity DevTools Suite - Master Development Plan

**Version**: 2.0  
**Date**: October 1, 2025  
**Author**: Signal Expert Agent  
**Status**: Active Planning Document - Updated with Hop Style Convention

---

## **Overview**

The Broken Divinity DevTools Suite is a comprehensive development acceleration plugin for Godot 4.5 that leverages existing mature addons while providing essential tools for the Broken Divinity project. The suite follows Close-to-Shore (CTS) principles with data-driven design, signal-based architecture, and rigorous validation at every phase.

**Signal Expert Compliance**: This plan follows Signal Expert guidelines for signal-first architecture, addon integration awareness, and performance optimization. All addon capabilities and integration points are documented in `docs/Architecture/ADDON_INVENTORY.md`.

---

## **Hop-Based Development Convention**

### **Hop Naming Structure**
Following CTS principles, development is organized into small, testable increments called "hops":

**Format**: `Phase X.Y[letter]`
- **X**: Phase number (1-5)
- **Y**: Major hop within phase (1-4)
- **[letter]**: Sub-hop for CTS compliance (a, b, c, etc.)

**Examples**:
- `1.1a`: Phase 1, Major Hop 1, Sub-hop A (Plugin Bootstrap)
- `1.1b`: Phase 1, Major Hop 1, Sub-hop B (Configuration)
- `2.1a`: Phase 2, Major Hop 1, Sub-hop A (Template Scanner)

### **Major Hops vs Sub-Hops**

**Major Hops** (X.1, X.2, X.3): Represent significant feature milestones
- Complete functional systems
- Multiple sub-hops for CTS compliance
- Phase transition validation points

**Sub-Hops** (X.Ya, X.Yb, X.Yc): Represent CTS-compliant incremental steps
- Single focused deliverable
- <500 lines of code per hop
- Always-green tests maintained
- No modification of previous hop code (only extension)

### **Hop Structure Requirements**

Each hop document must include:

1. **Scope**: Clear, focused objective (one sentence)
2. **Deliverables**: Specific, testable outputs
3. **Explicit Non-Goals**: What is deferred to later hops
4. **Success Criteria**: Measurable validation requirements
5. **Signal Contracts**: New signals documented
6. **Performance Targets**: Specific timing requirements
7. **Regression Prevention**: Tests ensuring previous hops still work

### **Regression Prevention Strategy**

**Critical Rule**: Each hop must NOT break previous hops.

**Enforcement Mechanisms**:
1. **Extension Only**: New hops add files, don't modify existing files
2. **Signal Compatibility**: New signals added, existing signals unchanged
3. **Test Continuity**: All previous hop tests must pass
4. **Performance Maintenance**: No degradation of previous hop performance
5. **Configuration Backward Compatibility**: New config sections, existing sections intact

**Regression Test Requirements**:
- Run all previous hop tests before marking current hop complete
- Verify all previous signals still emit correctly
- Validate performance budgets not exceeded
- Check configuration loading for all previous sections

## **Core Architecture Principles**

- **Signal-First Design**: All components communicate via documented signal contracts with EventBus coordination
- **Data-Driven Configuration**: JSON/YAML configs over hardcoded values, no magic numbers
- **CTS Compliance**: Small hops, always-green tests, deterministic outputs, organized structure
- **Addon Integration**: Leverage existing mature addons per `docs/Architecture/ADDON_INVENTORY.md` - check inventory before implementing new functionality
- **Performance Monitoring**: 2ms pipeline compliance across all tools with Signal Visualizer integration
- **Rust Performance Critical**: Use Rust for computational hotspots, GDScript for UI/orchestration
- **Signal Expert Guidelines**: Follow signal contracts, addon awareness, performance targets, and GUT framework integration
- **EventBus Coordination**: Central signal hub with all addons reporting status and events through documented contracts

---

## **Plugin Structure & Organization**

```
addons/broken_divinity_devtools/
├── plugin.cfg                           # Main plugin configuration
├── plugin.gd                            # Main plugin controller (GDScript)
├── dock/                                # Main dock UI
│   ├── bd_dock.tscn                    # Primary dock scene
│   ├── bd_dock.gd                      # Dock controller (GDScript)
│   └── tabs/                           # Individual tool tabs
│       ├── index_search_tab.tscn       # Project indexing interface
│       ├── scene_builder_tab.tscn      # Scene generation interface
│       ├── signal_visualizer_tab.tscn  # Signal debugging interface
│       ├── test_generator_tab.tscn     # Test automation interface
│       ├── performance_tab.tscn        # Performance monitoring
│       └── quick_actions_tab.tscn      # Development shortcuts
├── modules/                            # Core functionality modules
│   ├── core/                          # Shared core systems
│   │   ├── event_bus.gd               # Central signal coordination
│   │   ├── config_manager.gd          # Configuration handling
│   │   ├── logger.gd                  # Structured logging
│   │   └── validation_engine.gd       # CTS compliance validation
│   ├── index_search/                  # Project indexing & search
│   │   ├── scripts/
│   │   │   ├── index_manager.gd       # File indexing orchestrator
│   │   │   ├── search_engine.gd       # Tag-based search implementation
│   │   │   └── file_watcher.gd        # Auto-indexing on changes
│   │   ├── data/
│   │   │   ├── index_schema.json      # Index data structure
│   │   │   └── search_config.json     # Search parameters
│   │   └── rust_ext/                  # Performance-critical search (Rust)
│   │       ├── Cargo.toml
│   │       └── src/lib.rs
│   ├── scene_builder/                 # JSON-driven scene generation
│   │   ├── scripts/
│   │   │   ├── scene_generator.gd     # Scene creation orchestrator
│   │   │   ├── template_parser.gd     # JSON template processor
│   │   │   ├── node_factory.gd        # Node instantiation
│   │   │   └── script_weaver.gd       # GDScript generation & wiring
│   │   ├── templates/                 # Scene templates
│   │   │   ├── ui/                    # UI scene templates
│   │   │   │   ├── main_menu.json
│   │   │   │   ├── game_ui.json
│   │   │   │   └── settings_panel.json
│   │   │   ├── locations/             # Location scene templates
│   │   │   │   ├── apartment.json
│   │   │   │   ├── alley.json
│   │   │   │   └── settlement.json
│   │   │   └── components/            # Reusable component templates
│   │   │       ├── inventory_panel.json
│   │   │       ├── status_panel.json
│   │   │       └── action_panel.json
│   │   └── data/
│   │       ├── scene_schema.json      # Template validation schema
│   │       └── node_mappings.json     # Godot node type mappings
│   ├── signal_visualizer/             # Signal flow debugging
│   │   ├── scripts/
│   │   │   ├── signal_monitor.gd      # Real-time signal capture
│   │   │   ├── flow_analyzer.gd       # Signal flow analysis
│   │   │   ├── history_manager.gd     # Historical signal data
│   │   │   └── visualizer_ui.gd       # Graph visualization
│   │   ├── data/
│   │   │   ├── signal_contracts.json  # Documented signal schemas
│   │   │   └── visualization_config.json
│   │   └── rust_ext/                  # Graph algorithms (Rust)
│   │       ├── Cargo.toml
│   │       └── src/lib.rs
│   ├── test_generator/                # GUT-based test automation
│   │   ├── scripts/
│   │   │   ├── test_orchestrator.gd   # Test generation coordination
│   │   │   ├── template_engine.gd     # Test template processing
│   │   │   ├── signal_test_gen.gd     # Signal contract test generation
│   │   │   └── gut_integration.gd     # GUT framework integration
│   │   ├── templates/
│   │   │   ├── unit_test.gd.template
│   │   │   ├── integration_test.gd.template
│   │   │   ├── signal_contract_test.gd.template
│   │   │   └── performance_test.gd.template
│   │   └── data/
│   │       ├── test_config.json
│   │       └── coverage_rules.json
│   ├── mcp_bridge/                    # MCP specification integration
│   │   ├── scripts/
│   │   │   ├── mcp_server.gd          # MCP protocol implementation
│   │   │   ├── endpoint_manager.gd    # Endpoint registration
│   │   │   ├── json_rpc_handler.gd    # JSON-RPC communication
│   │   │   └── vscode_integration.gd  # VS Code specific handlers
│   │   └── data/
│   │       ├── mcp_schema.json        # MCP protocol schemas
│   │       └── endpoints_config.json  # Available endpoints
│   ├── performance_monitor/           # Performance tracking
│   │   ├── scripts/
│   │   │   ├── perf_tracker.gd        # Frame time monitoring
│   │   │   ├── addon_monitor.gd       # Addon performance tracking
│   │   │   ├── signal_profiler.gd     # Signal emission profiling
│   │   │   └── pipeline_validator.gd  # 2ms pipeline compliance
│   │   ├── data/
│   │   │   ├── perf_thresholds.json
│   │   │   └── monitoring_config.json
│   │   └── rust_ext/                  # High-performance metrics (Rust)
│   │       ├── Cargo.toml
│   │       └── src/lib.rs
│   ├── asset_organizer/               # CTS compliance enforcement
│   │   ├── scripts/
│   │   │   ├── file_analyzer.gd       # File structure analysis
│   │   │   ├── cts_validator.gd       # CTS compliance checking
│   │   │   └── auto_organizer.gd      # Automated file organization
│   │   └── data/
│   │       ├── cts_rules.json         # CTS compliance rules
│   │       └── folder_templates.json  # Standard folder structures
│   ├── documentation_generator/       # Auto-documentation
│   │   ├── scripts/
│   │   │   ├── doc_generator.gd       # Documentation orchestrator
│   │   │   ├── code_analyzer.gd       # Code annotation parsing
│   │   │   └── template_processor.gd  # Markdown template processing
│   │   ├── templates/
│   │   │   ├── system_readme.md.template
│   │   │   ├── api_docs.md.template
│   │   │   └── signal_contract.md.template
│   │   └── data/
│   │       └── doc_config.json
│   ├── dependency_mapper/             # Dependency visualization
│   │   ├── scripts/
│   │   │   ├── dependency_scanner.gd  # Scan project dependencies
│   │   │   ├── graph_builder.gd       # Build dependency graphs
│   │   │   └── circular_detector.gd   # Detect circular references
│   │   ├── data/
│   │   │   └── mapping_config.json
│   │   └── rust_ext/                  # Graph algorithms (Rust)
│   │       ├── Cargo.toml
│   │       └── src/lib.rs
│   ├── version_tracker/               # Version & change tracking
│   │   ├── scripts/
│   │   │   ├── version_manager.gd     # Version tracking orchestrator
│   │   │   ├── git_integration.gd     # Git repository integration
│   │   │   └── deprecation_tracker.gd # Deprecation warnings
│   │   └── data/
│   │       ├── version_schema.json
│   │       └── deprecation_rules.json
│   ├── code_quality_scanner/          # Code quality enforcement
│   │   ├── scripts/
│   │   │   ├── quality_scanner.gd     # Code quality orchestrator
│   │   │   ├── naming_validator.gd    # Naming convention checks
│   │   │   ├── signal_contract_validator.gd # Signal contract verification
│   │   │   └── style_checker.gd       # Code style enforcement
│   │   └── data/
│   │       ├── quality_rules.json
│   │       └── naming_conventions.json
│   ├── template_manager/              # Template versioning & management
│   │   ├── scripts/
│   │   │   ├── template_registry.gd   # Template version management
│   │   │   ├── addon_analyzer.gd      # MAAACKS/Indie Blueprint analysis
│   │   │   └── inheritance_manager.gd # Template inheritance system
│   │   └── data/
│   │       ├── template_metadata.json
│   │       └── inheritance_rules.json
│   ├── quick_actions/                 # Development shortcuts
│   │   ├── scripts/
│   │   │   ├── action_manager.gd      # Quick actions orchestrator
│   │   │   ├── system_creator.gd      # System folder creation
│   │   │   └── shortcut_handler.gd    # Keyboard shortcuts
│   │   └── data/
│   │       └── actions_config.json
│   ├── addon_integration_monitor/     # Addon monitoring
│   │   ├── scripts/
│   │   │   ├── addon_tracker.gd       # Track addon usage
│   │   │   ├── compatibility_checker.gd # Version compatibility
│   │   │   └── performance_analyzer.gd # Addon performance impact
│   │   └── data/
│   │       ├── addon_registry.json
│   │       └── compatibility_matrix.json
│   └── data_validator/                # Data integrity validation
│       ├── scripts/
│       │   ├── schema_validator.gd    # JSON schema validation
│       │   ├── config_checker.gd      # Configuration verification
│       │   └── integrity_monitor.gd   # Data integrity monitoring
│       └── data/
│           ├── schemas/               # JSON schemas for validation
│           └── validation_rules.json
├── tests/                             # Plugin-specific tests
│   ├── infrastructure/               # Testing framework
│   │   ├── bd_devtools_test_runner.gd
│   │   └── test_coordinator.gd
│   ├── unit/                         # Unit tests for each module
│   ├── integration/                  # Integration tests
│   └── signal_contracts/             # Signal contract validation
├── data/                             # Global configuration
│   ├── plugin_config.json            # Main plugin configuration
│   ├── signal_registry.json          # Central signal documentation
│   ├── performance_thresholds.json   # Performance benchmarks
│   └── addon_integration_map.json    # Addon integration points
└── docs/                             # Plugin documentation
    ├── README.md                     # Plugin overview
    ├── ARCHITECTURE.md               # Technical architecture
    ├── API_REFERENCE.md              # API documentation
    ├── SIGNAL_CONTRACTS.md           # Signal documentation
    └── USER_GUIDE.md                 # Usage instructions
```

---

## **Addon Integration Architecture**

### **Signal Expert Integration Principles**
Following Signal Expert guidelines, this plugin serves as a **coordination hub** for all existing addons rather than replacing their functionality. Key integration principles:

1. **Addon Awareness**: Always consult `docs/Architecture/ADDON_INVENTORY.md` before implementing new features
2. **Signal Coordination**: All addon interactions flow through central EventBus with documented contracts
3. **Performance Coordination**: Monitor all addon performance through DevTools for 2ms pipeline compliance
4. **No Duplication**: Leverage existing addon capabilities rather than reimplementing functionality

### **Active Addon Integrations**

#### **Dialogue Manager 3 Integration**
- **Role**: Narrative content delivery with BDDialogueEnhanced wrapper
- **Signal Flow**: `dialogue_*` signals → EventBus → Signal Visualizer monitoring
- **Performance**: <1ms dialogue processing budget
- **DevTools Integration**: Dialogue debugging, variable inspection, flow visualization

#### **AsciiScreen Integration**  
- **Role**: High-performance ASCII rendering (10x performance boost)
- **Signal Flow**: `screen_*` signals → EventBus → Performance monitoring
- **Performance**: <0.5ms rendering budget
- **DevTools Integration**: ASCII debug output, visualization modes, cache monitoring

#### **GUT Framework Integration**
- **Role**: Primary testing system with signal contract validation
- **Signal Flow**: `test_*` signals → EventBus → Test result aggregation
- **Performance**: Test framework (no production overhead)
- **DevTools Integration**: Automated test generation, contract validation, benchmark results

#### **Indie Blueprint RPG Integration**
- **Role**: Character systems, combat calculations, time management
- **Signal Flow**: `character_*`, `global_time_*` signals → EventBus → System coordination
- **Performance**: <1ms stat calculation budget
- **DevTools Integration**: Character debugging, time event monitoring, equipment validation

#### **Database Bridge Integration**
- **Role**: Data persistence and content storage
- **Signal Flow**: `database_*` signals → EventBus → Background operations
- **Performance**: Background thread operations (no main thread impact)
- **DevTools Integration**: Query monitoring, save/load debugging, schema validation

#### **Signal Visualizer Integration**
- **Role**: Real-time signal debugging and flow analysis
- **Signal Flow**: Monitors ALL other addon signals through EventBus
- **Performance**: Debug mode only (no production overhead)
- **DevTools Integration**: Core debugging tool for signal architecture

**Circular Dependency Resolution**:
Signal Visualizer monitors EventBus, but EventBus coordinates Signal Visualizer. Initialization sequence:
1. **Phase 1 - Bootstrap**: EventBus initializes in minimal mode (basic routing only, no monitoring)
2. **Phase 2 - Visualizer Init**: Signal Visualizer initializes and connects to EventBus
3. **Phase 3 - Full Coordination**: EventBus switches to full monitoring mode with Signal Visualizer active
4. **Safeguard**: EventBus maintains bootstrap fallback if Signal Visualizer fails to initialize

#### **Rust GDExtension Integration**
- **Role**: Performance-critical computations and algorithms
- **Signal Flow**: `rust_*` signals → EventBus → Performance benchmarking
- **Performance**: <0.1ms FFI overhead budget
- **DevTools Integration**: Performance profiling, algorithm benchmarking, deterministic validation

### **EventBus Signal Flow Architecture**
```
BD DevTools EventBus (Central Hub)
├── Dialogue Manager 3 → dialogue_*, bd_dialogue_*
├── AsciiScreen → screen_*, ascii_debug_*
├── GUT Framework → test_*, gut_*
├── Indie Blueprint RPG → character_*, global_time_*, equipment_*
├── Database Bridge → database_*, save_*, backup_*
├── Signal Visualizer → signal_*, flow_*, contract_*
├── Rust GDExtension → rust_*, performance_*
└── BD DevTools → plugin_*, index_*, template_*, validation_*
```

### **Performance Budget Allocation**

**Critical Clarification**: The 2ms pipeline compliance target refers specifically to **BD DevTools operations**. Other addons have independent performance budgets managed within their own systems.

**BD DevTools Performance Budget (2ms total)**:
- **EventBus Coordination**: 0.4ms (signal routing and monitoring)
- **Validation Engine**: 0.3ms (CTS compliance checking)
- **Index/Search Operations**: 0.5ms (file indexing and search)
- **UI Updates**: 0.3ms (dock and tab rendering)
- **Configuration Management**: 0.1ms (config loading/validation)
- **Performance Monitoring**: 0.2ms (metrics collection)
- **Buffer**: 0.2ms (safety margin)

**Addon Performance Targets (Independently Managed)**:
- **AsciiScreen**: <0.5ms per frame (rendering budget)
- **Dialogue Manager**: <1.0ms per dialogue update (processing budget)
- **Indie Blueprint RPG**: <1.0ms per stat calculation (computation budget)
- **Rust GDExtension**: <0.1ms FFI overhead per call
- **Database Bridge**: Background thread operations (no main thread impact)
- **Signal Visualizer**: Debug mode only (excluded from production budgets)

### **Addon Selection Rationale**
Each addon was selected based on Signal Expert criteria:
- **Maturity**: Production-ready with stable APIs
- **Performance**: Meets or exceeds 2ms pipeline requirements
- **Signal Architecture**: Compatible with EventBus coordination
- **CTS Compliance**: Data-driven design with deterministic behavior
- **No Duplication**: Provides unique functionality not available elsewhere

### **Rust Integration Decision Criteria**

**When to Use Rust** (Signal Expert guideline: "Suggest Rust offload only when justified"):

**Performance Thresholds**:
- **Execution Time**: GDScript implementation exceeds 5ms for typical workload
- **Iteration Count**: Processing >10,000 items in tight loops
- **Algorithm Complexity**: O(n²) or worse algorithmic complexity
- **Memory Pressure**: Allocation/deallocation churn causing GC pressure
- **Determinism Required**: Cross-platform reproducible results essential

**Specific Use Cases**:
- **Project Indexing**: Searching >5,000 files with content analysis
- **Graph Algorithms**: Dependency mapping, circular reference detection
- **Fuzzy Matching**: String similarity across large datasets
- **Noise Generation**: Procedural generation with Perlin/Simplex noise
- **Pathfinding**: A* or Dijkstra on large graphs

**When GDScript is Sufficient**:
- **Small Datasets**: <1,000 items to process
- **Simple Operations**: Linear scans, basic filtering
- **UI Operations**: User interactions, menu navigation
- **Configuration**: JSON/YAML loading and validation
- **Signal Coordination**: EventBus routing and monitoring

**Implementation Strategy**:
1. **Start with GDScript**: Implement initial version in GDScript
2. **Profile First**: Use Godot profiler to identify actual bottlenecks
3. **Measure Impact**: Establish baseline performance metrics
4. **Incremental Rust**: Add Rust only for proven bottlenecks
5. **Validate Gain**: Measure performance improvement (target: 10x minimum)

**Rust Integration Checklist**:
- [ ] Profiling shows >5ms execution time in GDScript
- [ ] Bottleneck confirmed through multiple runs
- [ ] Rust implementation estimated to provide >10x speedup
- [ ] FFI overhead (<0.1ms) doesn't negate performance gain
- [ ] Deterministic behavior can be guaranteed
- [ ] Maintenance cost justified by performance benefit

---

## **Development Phases with Hop Structure**

This section provides the hop-level breakdown for all phases. Detailed implementation plans are in separate phase documents.

### **Phase 1: Foundation & Infrastructure** *(Active - Hop 1.1b Complete)*

**Status**: In Progress (Hop 1.1c Next)  
**Detailed Plan**: See `BD_DEV_SUITE_PHASE_1_HOPS.md`

**Major Hops**:
- **Hop 1.1**: Core Infrastructure ✅ (2/3 sub-hops complete)
  - 1.1a: Plugin Bootstrap & EventBus Core ✅
  - 1.1b: Configuration & Logging Foundation ✅  
  - 1.1c: Validation Engine & Test Templates 🚧 *NEXT*
- **Hop 1.2**: File System Monitoring (Planned)
- **Hop 1.3**: CTS Validation (Planned)
- **Hop 1.4**: Enhanced Search (Planned)

**Phase Success Criteria**:
- ✅ Plugin loads without errors (Hop 1.1a)
- ✅ Configuration system operational (Hop 1.1b)
- ✅ Logging infrastructure complete (Hop 1.1b)
- [ ] Validation engine functional (Hop 1.1c)
- [ ] GUT test templates operational (Hop 1.1c)
- [ ] File monitoring active (Hop 1.2)
- [ ] Search system functional (Hop 1.4)
- [ ] All operations within 2ms budget

---

### **Phase 2: Scene Generation & Templates** *(Planning Complete)*

**Status**: Awaiting Phase 1 Completion  
**Detailed Plan**: See `BD_DEV_SUITE_PHASE_2_HOPS.md`

**Major Hops**:
- **Hop 2.1**: Template Analysis Foundation
  - 2.1a: Template Scanner & Metadata
  - 2.1b: Scene Tree Parser
  - 2.1c: Template Categorization
- **Hop 2.2**: Generation Engine
  - 2.2a: Basic Scene Instantiation
  - 2.2b: Parameter Substitution
  - 2.2c: Validation Integration
- **Hop 2.3**: Template Management
  - 2.3a: Template Versioning
  - 2.3b: Template Inheritance
- **Hop 2.4**: Advanced Generation
  - 2.4a: Script Generation
  - 2.4b: Component Wiring

**Phase Success Criteria**:
- [ ] Template scanner analyzes MAAACKS/Indie Blueprint
- [ ] JSON schema validation for scene templates
- [ ] Scene generation with proper node instantiation
- [ ] Automatic GDScript generation and wiring
- [ ] CTS-compliant folder structure generation
- [ ] Template versioning system operational

---

### **Phase 3: Signal Visualization & Debugging** *(Deferred)*

**Status**: Post-Phase 2  
**Dependencies**: Phase 1 Signal Infrastructure, Phase 2 Complete

**Major Hops**: TBD (to be broken down into sub-hops when Phase 2 nears completion)

---

### **Phase 4: Test Automation & Generation** *(Deferred)*

**Status**: Post-Phase 3  
**Dependencies**: Phase 1 Validation Engine, GUT Integration

**Major Hops**: TBD

---

### **Phase 5: Advanced Features & Integration** *(Future)*

**Status**: Post-Phase 4  
**Dependencies**: MCP Server Implementation

**Major Hops**: TBD

---

## **Regression Prevention Requirements**

### **Cross-Hop Validation**
Before marking any hop complete, the following regression checks must pass:

1. **Previous Hop Tests**: All tests from previous hops must pass
2. **Signal Compatibility**: All previous signals must still emit correctly
3. **Performance Maintenance**: No performance degradation from previous hops
4. **Configuration Compatibility**: All previous config sections must load
5. **API Stability**: All previous public APIs must remain functional

### **Phase Transition Validation**
Before transitioning between phases:

1. **Complete Regression Suite**: All tests from all hops in current phase pass
2. **Performance Validation**: Comprehensive 2ms budget compliance check
3. **Integration Testing**: All addon integrations validated
4. **Documentation Review**: All signals, APIs, and features documented
5. **User Acceptance**: Core functionality validated by user testing

### **Continuous Integration Requirements**
Each commit must:

1. Pass all existing tests (no test removal without explicit justification)
2. Maintain or improve code coverage
3. Pass GDLinter validation
4. Include updated documentation for any API changes
5. Add regression tests for any bug fixes

---

## **Legacy Phase Documentation Below**

The following sections contain original phase documentation. Refer to hop-style sections above and separate phase documents for current implementation plans.

---

## **Phase 1: Foundation & Infrastructure**

### **1.1 Plugin Foundation Setup**
**Technology**: GDScript  
**Components**: Main plugin structure, dock integration, configuration system

**Deliverables**:
- Main plugin.cfg with proper metadata
- Primary plugin.gd with dock registration
- Core event bus for signal coordination
- Configuration manager for JSON/YAML configs
- Structured logging system with performance metrics
- Basic validation engine for CTS compliance

**Signal Contracts**:
```gdscript
# Core Foundation Signals (EventBus Integration)
signal plugin_initialized(config: Dictionary)
signal dock_registered(dock_name: String)
signal module_loaded(module_name: String, status: String)
signal validation_complete(results: Dictionary)
signal config_updated(section: String, values: Dictionary)

# EventBus Coordination Signals
signal eventbus_signal_registered(signal_name: String, emitter_type: String)
signal eventbus_addon_connected(addon_name: String, signal_count: int)
signal eventbus_performance_warning(addon_name: String, signal_rate: float, threshold: float)

# Signal Visualizer Integration
signal signal_monitoring_enabled(monitoring_scope: Array)
signal addon_signal_flow_updated(addon_name: String, flow_data: Dictionary)
```

**Key Technical Decisions**:
- Single dock with tabbed interface for unified UX using Godot node icons
- Event-driven architecture using central EventBus with all addon coordination
- JSON configuration files for all modules with schema validation
- Signal Visualizer integration for real-time debugging and flow analysis
- Performance monitoring with 2ms pipeline compliance across all addons
- Addon integration following `docs/Architecture/ADDON_INVENTORY.md` specifications

### **1.2 Project Index & Search Foundation**
**Technology**: GDScript + Rust (search algorithms)  
**Components**: File indexing, tag-based search, auto-monitoring

**Deliverables**:
- File system monitoring with automatic indexing
- Tag-based search with fuzzy matching
- Project structure analysis and validation
- Integration with git for change tracking
- Search API for other tools to consume

**File Monitoring Performance Strategy**:
- **Debounce Window**: 500ms (batch rapid file changes)
- **Throttling**: Maximum 100 events/second processed
- **Event Coalescing**: Multiple changes to same file within debounce window = 1 index update
- **Background Processing**: All indexing operations use background threads
- **Incremental Updates**: Only re-index changed files, not entire project
- **Performance Budget**: File monitoring overhead <0.1ms per frame (event queuing only)

**Signal Contracts**:
```gdscript
# Index & Search Signals
signal index_update_started(scope: String)
signal file_indexed(file_path: String, metadata: Dictionary)
signal index_update_complete(stats: Dictionary)
signal search_requested(query: String, filters: Dictionary)
signal search_results_ready(results: Array, query: String)
signal tag_updated(file_path: String, tags: Array)
signal file_monitoring_throttled(dropped_events: int, reason: String)
```

**Rust Integration**:
- High-performance text indexing and search algorithms
- Fuzzy string matching for filename search
- Parallel file processing for large projects
- Deterministic ordering for reproducible results

---

## **Phase 2: Scene Generation & Templates**

### **2.1 Template Analysis System**
**Technology**: GDScript  
**Components**: MAAACKS/Indie Blueprint analysis, pattern extraction

**Deliverables**:
- Automated analysis of existing addon scene structures
- Pattern extraction for UI layouts and component hierarchies
- Best practice identification and documentation
- Template inheritance system design

**Signal Contracts**:
```gdscript
# Template Analysis Signals
signal template_analysis_started(addon_name: String)
signal pattern_discovered(pattern_type: String, metadata: Dictionary)
signal template_extracted(template_name: String, source: String)
signal analysis_complete(addon_name: String, templates_count: int)
```

### **2.2 JSON Template System**
**Technology**: GDScript  
**Components**: JSON schema validation, node factory, script generation

**Deliverables**:
- JSON schema for scene templates with validation
- Node factory for instantiating Godot nodes from JSON
- Automatic GDScript generation and wiring
- CTS-compliant folder structure generation
- Integration with GD linter for validation

**Signal Contracts**:
```gdscript
# Scene Generation Signals
signal scene_generation_requested(template_name: String, params: Dictionary)
signal node_created(node_type: String, properties: Dictionary)
signal script_generated(script_path: String, template: String)
signal scene_wiring_complete(scene_path: String)
signal generation_complete(scene_path: String, validation_results: Dictionary)
signal generation_failed(error_code: String, details: Dictionary)
```

**Template Examples**:
- UI templates: Main menu, game UI, settings panels
- Location templates: Apartment, alley, settlement scenes
- Component templates: Inventory, status, action panels

---

## **Phase 3: Signal Visualization & Debugging**

### **3.1 Signal Monitoring System**
**Technology**: GDScript + Rust (graph algorithms)  
**Components**: Real-time signal capture, flow analysis, historical tracking

**Deliverables**:
- Real-time signal emission monitoring
- Signal flow visualization with interactive graphs
- Historical signal analysis and pattern detection
- Integration with existing Signal Visualizer addon
- Performance impact tracking of signal emissions

**Signal Contracts**:
```gdscript
# Signal Monitoring Signals
signal monitoring_started(scope: String)
signal signal_captured(signal_name: String, source: Object, args: Array)
signal flow_pattern_detected(pattern_type: String, frequency: float)
signal monitoring_stopped(session_stats: Dictionary)
signal historical_analysis_complete(patterns: Array, anomalies: Array)
```

**Rust Integration**:
- Graph algorithms for signal flow analysis
- Pattern recognition in signal sequences
- Performance-optimized data structures for large signal volumes

### **3.2 Signal Contract Validation**
**Technology**: GDScript  
**Components**: Contract documentation, validation, compliance checking

**Deliverables**:
- Signal contract documentation system
- Automatic validation of signal emissions against contracts
- Contract compliance reporting
- Integration with test generation for signal testing

---

## **Phase 4: Test Generation & Quality Assurance**

### **4.1 GUT Integration & Test Templates**
**Technology**: GDScript with deep GUT framework integration  
**Components**: GUT framework integration, test template system, signal contract validation

**Signal Expert Compliance**: Primary testing system following GUT patterns for all system tests, signal validation, and performance benchmarks per Signal Expert guidelines.

**Deliverables**:
- Deep integration with existing GUT framework (see `docs/Architecture/ADDON_INVENTORY.md`)
- Test template system for unit, integration, and signal contract tests
- Automatic test generation from signal contracts with EventBus validation
- Performance benchmark test generation with 2ms pipeline compliance verification
- CTS compliance test generation with always-green test methodology
- Signal contract validation tests for all addon integrations

**Signal Contracts**:
```gdscript
# Test Generation Signals
signal test_generation_requested(type: String, target: String)
signal test_template_applied(template_name: String, output_path: String)
signal test_suite_generated(suite_name: String, test_count: int)
signal test_execution_started(suite_name: String)
signal test_results_available(suite_name: String, results: Dictionary)
```

### **4.2 Validation Engine**
**Technology**: GDScript  
**Components**: CTS compliance validation, code quality checking

**Deliverables**:
- Comprehensive CTS compliance validation
- Code quality scanning with actionable feedback
- Integration with existing code quality tools
- Automated remediation suggestions

---

## **Phase 5: External Integration & MCP Bridge**

**Status**: Deferred to Phase 5 (After core functionality proven)  
**Rationale**: MCP integration provides external tool connectivity but is not required for core DevTools functionality. Implementing in Phase 5 allows:
- Core systems (indexing, templates, testing) to be proven and stable
- Better understanding of what data external tools actually need
- Reduced scope complexity in early phases
- Focus on immediate development acceleration needs first

### **5.1 MCP Protocol Implementation**
**Technology**: GDScript  
**Components**: MCP specification compliance, VS Code integration

**Deliverables**:
- Full MCP specification implementation
- JSON-RPC communication layer
- VS Code extension integration points
- Read-only output system for external tools
- Structured error reporting and diagnostics

**Signal Contracts**:
```gdscript
# MCP Integration Signals
signal mcp_server_started(port: int, endpoints: Array)
signal mcp_request_received(method: String, params: Dictionary)
signal mcp_response_sent(id: String, result: Dictionary)
signal mcp_error_occurred(code: int, message: String, details: Dictionary)
signal external_tool_connected(tool_name: String, capabilities: Array)
```

### **5.2 External Tool Endpoints**
**Technology**: GDScript  
**Components**: Endpoint registry, data serialization, tool integration

**Deliverables**:
- Registry of available MCP endpoints
- Data serialization for external tool consumption
- Integration with development workflow tools
- Plugin state exposure for external monitoring

---

## **Phase 6: Performance & Monitoring Tools**

### **6.1 Performance Monitoring System**
**Technology**: GDScript + Rust (metrics collection)  
**Components**: Frame time tracking, addon monitoring, pipeline validation

**Deliverables**:
- Real-time performance monitoring dashboard
- Addon performance impact tracking
- 2ms pipeline compliance validation
- Performance regression detection
- Integration with existing DevTools addon

**Signal Contracts**:
```gdscript
# Performance Monitoring Signals
signal performance_monitoring_started(targets: Array)
signal frame_time_measured(frame_time_ms: float, components: Dictionary)
signal pipeline_violation_detected(component: String, time_ms: float)
signal performance_report_generated(period: String, stats: Dictionary)
signal addon_performance_analyzed(addon_name: String, impact: Dictionary)
```

**Rust Integration**:
- High-precision timing measurements
- Statistical analysis of performance data
- Memory usage tracking and profiling

### **6.2 Addon Integration Monitoring**
**Technology**: GDScript  
**Components**: Addon usage tracking, compatibility checking, integration analysis

**Deliverables**:
- Comprehensive addon usage analytics
- Version compatibility matrix maintenance
- Integration health monitoring
- Performance impact assessment per addon

---

## **Phase 7: Quality of Life Tools**

### **7.1 Asset Organization & CTS Compliance**
**Technology**: GDScript  
**Components**: File structure analysis, automated organization, compliance validation

**Deliverables**:
- Automated detection of CTS compliance violations
- Intelligent file organization suggestions
- Batch file reorganization with undo support
- Integration with version control for safe operations

### **7.2 Documentation & Dependency Tools**
**Technology**: GDScript  
**Components**: Auto-documentation, dependency mapping, version tracking

**Deliverables**:
- Automatic README and API documentation generation
- Visual dependency mapping with circular reference detection
- Version tracking with deprecation warnings
- Integration with git for change tracking

### **7.3 Quick Actions & Developer Shortcuts**
**Technology**: GDScript  
**Components**: Action registry, shortcut system, workflow automation

**Deliverables**:
- One-click system folder creation following CTS standards
- Rapid test generation and execution
- Template application shortcuts
- Common development task automation

---

## **Technical Implementation Guidelines**

### **Language Selection Criteria**

**GDScript Usage**:
- UI components and user interactions
- Plugin orchestration and coordination
- Godot-specific integrations (scene manipulation, node creation)
- Signal handling and event coordination
- Configuration management and validation
- Test framework integration

**Rust Usage**:
- Performance-critical search algorithms
- Graph algorithms for dependency and signal analysis
- High-precision performance monitoring
- Pattern recognition in large datasets
- Mathematical computations for metrics
- File system operations requiring high throughput

### **Signal Architecture Standards**

**Signal Naming Convention**:
```gdscript
# Pattern: [module]_[action]_[state]
# Examples:
signal procgen_layout_started
signal index_search_complete
signal template_generation_failed
signal performance_threshold_exceeded
```

**Signal Documentation Requirements**:
- Every signal must have documented parameters
- Emission conditions clearly specified
- Expected handlers documented
- Performance impact noted for high-frequency signals

### **Data-Driven Configuration**

**Configuration Hierarchy**:
1. Global plugin configuration (`data/plugin_config.json`)
2. Module-specific configurations (`modules/*/data/`)
3. User overrides (stored in project settings)
4. Runtime parameter adjustments

**Schema Validation**:
- All JSON configurations must have corresponding schemas
- Validation on load with clear error messages
- Runtime validation for critical configuration changes
- Automatic migration for configuration version updates

### **Testing Requirements**

**Test Coverage Mandates**:
- **100% signal contract validation**: Every signal must have corresponding contract test
- **80% minimum code coverage**: All public APIs and critical paths covered
- **100% EventBus coverage**: All signal routing and coordination logic tested
- **Integration tests for addon interactions**: Every addon integration point validated
- **Performance regression tests**: All Rust components and 2ms budget operations
- **End-to-end workflow tests**: Complete feature workflows validated

**Test Coverage Metrics**:
- **Public APIs**: Minimum 80% line coverage, 100% branch coverage for critical paths
- **Signal Contracts**: 100% coverage (no untested signals allowed)
- **Error Handling**: All error recovery paths tested with failure injection
- **Performance**: All operations with performance budgets have benchmark tests

**GUT Integration Standards**:
- All tests must use GUT framework
- Custom test doubles for external dependencies
- Deterministic test data with fixed seeds
- Performance benchmarks with configurable thresholds

### **Performance Compliance**

**2ms Pipeline Requirements**:
- All UI operations must complete within 2ms
- Background operations use call_deferred appropriately
- Rust components provide incremental processing for large datasets
- Performance monitoring integrated into all critical paths

**Memory Management**:
- Object pooling for frequently created/destroyed objects
- Lazy loading for non-critical resources
- Explicit cleanup in _exit_tree() methods
- Memory profiling integration for leak detection

---

## **Integration Points with Existing Addons**

### **Dialogue Manager 3 Integration**:
- Signal contract validation for dialogue events
- Template generation for dialogue scenes
- Performance monitoring of dialogue processing
- Test generation for dialogue flow validation

### **AsciiScreen Integration**:
- Performance monitoring of ASCII rendering pipeline
- Template support for ASCII-based UI components
- Signal flow analysis for screen updates
- Test generation for rendering performance

### **GUT Framework Integration**:
- Deep integration with existing test infrastructure
- Extension of test template system
- Signal contract testing automation
- Performance benchmark integration

### **Indie Blueprint RPG Integration**:
- Template analysis of RPG framework patterns
- Signal monitoring for character stat updates
- Performance tracking of RPG systems
- Test generation for RPG mechanics validation

### **Database Bridge Integration**:
- Schema validation for database configurations
- Performance monitoring of database operations
- Signal flow analysis for data persistence
- Test generation for database integration

---

## **Signal Expert Compliance Validation**

### **Signal Architecture Requirements**
Per Signal Expert guidelines, this implementation must demonstrate:

1. **Signal Contracts Documentation**: All signals defined with constants and documented arguments
2. **EventBus Coordination**: Central signal hub with all addons reporting through documented contracts
3. **Signal Visualizer Integration**: All signals monitored through Signal Visualizer addon for real-time debugging
4. **Contract Tests**: Every signal's order and payload shape validated through GUT framework
5. **Deterministic Outputs**: No time-based assertions, use fixed seeds for reproducible results

### **Addon Integration Compliance**
Following Signal Expert principle: *"Consider existing addon capabilities before suggesting custom implementations"*

**Pre-Implementation Checklist**:
- [ ] Consult `docs/Architecture/ADDON_INVENTORY.md` for existing functionality
- [ ] Validate signal contract compatibility with existing addons
- [ ] Ensure 2ms pipeline compliance with performance budget allocation
- [ ] Document addon coordination through EventBus architecture
- [ ] Test addon interactions through GUT framework integration

### **Performance Requirements Validation**
**2ms Pipeline Compliance** (Signal Expert requirement):
- AsciiScreen: <0.5ms rendering budget with 10x performance boost verification
- Dialogue Manager: <1ms dialogue processing with BDDialogueEnhanced wrapper testing  
- Indie Blueprint RPG: <1ms stat calculation with RpgCharacterMetaStats validation
- Rust GDExtension: <0.1ms FFI overhead with deterministic algorithm verification
- BD DevTools: <0.4ms coordination overhead with EventBus performance monitoring

### **Testing Standards Compliance**
**GUT Framework Integration** (Signal Expert requirement):
- Unit tests with fixed seeds per algorithm for deterministic results
- Golden snapshots with structural counts and connectivity hash validation
- Contract tests for every signal emission order and payload shape validation
- Performance benchmarks integrated with Signal Visualizer monitoring
- Signal contract validation for all addon interactions

### **Documentation Standards**
**Signal Expert Documentation Requirements**:
- Signal contracts kept current with emission order and payload documentation
- Addon integration points documented with capability mapping
- Performance benchmarks maintained with 2ms pipeline validation
- System integration documented showing how each addon contributes to architecture
- Pipeline stages documented with deterministic ordering and validation rules

### **Rust Integration Compliance**
**Signal Expert Rust Standards**:
- Small focused modules with safe ownership patterns
- Minimal FFI surface with stable serialized shapes
- Batch operations over chatty per-entity calls
- Deterministic seeds with cross-platform reproducibility
- Profile-driven optimization with cargo flamegraph validation

---

## **Success Metrics & Validation Criteria**

### **Phase Completion Criteria**:
1. **All signals documented and tested**: Every emitted signal has validated contracts
2. **CTS compliance validated**: All generated code follows CTS standards
3. **Performance benchmarks met**: No operation exceeds 2ms in critical path
4. **Integration tests passing**: All addon interactions validated
5. **Documentation generated**: API docs and user guides auto-generated
6. **MCP compliance verified**: External tool integration validated

### **Quality Gates**:
- GUT test suite passes with 100% success rate
- Performance regression tests validate 2ms compliance
- Signal contract validation passes for all modules
- CTS compliance scan passes for all generated code
- External MCP integration validated with reference tools

### **Maintenance Requirements**:
- Monthly addon compatibility verification
- Quarterly performance benchmark updates
- Signal contract documentation kept current
- Template library maintained with latest addon patterns
- Configuration schema evolution managed with versioning

---

## **Risk Mitigation Strategies**

### **Technical Risks**:
- **Addon Version Incompatibilities**: Maintain compatibility matrix with automated testing
- **Performance Degradation**: Continuous performance monitoring with automatic alerts
- **Signal Contract Violations**: Runtime validation with immediate feedback
- **Configuration Complexity**: Layered configuration with validation and migration support

### **Development Risks**:
- **Scope Creep**: Strict phase-based development with clear deliverables
- **Integration Complexity**: Extensive integration testing at module boundaries
- **Maintenance Burden**: Automated testing and documentation generation
- **User Adoption**: Comprehensive documentation and incremental feature rollout

---

This master plan provides a comprehensive roadmap for developing the Broken Divinity DevTools Suite while maintaining strict adherence to CTS principles, signal-based architecture, and performance requirements. Each phase builds upon previous foundations while providing immediate value to the development workflow.