# Phase 2: Scene Generation & Templates - Hop Implementation Plan

**Phase**: Scene Generation & Templates  
**Status**: Planning Complete → Sub-Hop Breakdown  
**Version**: 2.0 (Updated with CTS-compliant sub-hop structure)  
**Target**: Template analysis and JSON-driven scene generation  
**Dependencies**: Phase 1 (Foundation & Infrastructure) Complete

---

## **Phase 2 Overview**

Build upon Phase 1's foundation to create a comprehensive scene generation system powered by JSON templates extracted from mature addons (MAAACKS, Indie Blueprint). This phase follows the CTS-compliant hop-based development convention with each major hop broken into small, testable sub-hops.

**Hop-Based Development Convention**: Phase 2 follows the `Phase X.Y[letter]` format where:
- **X = 2**: Phase number (Scene Generation & Templates)
- **Y = 1-4**: Major hop (Template Analysis, Template System, Template Management, Advanced Features)
- **[letter] = a, b, c**: Sub-hop for CTS compliance (<500 lines each, always-green tests)

**Phase Success Criteria**:
- ✅ MAAACKS and Indie Blueprint addon analysis complete
- ✅ Template extraction and inheritance system operational
- ✅ JSON schema validation for scene templates
- ✅ Scene generation with proper node instantiation
- ✅ Automatic GDScript generation and wiring
- ✅ CTS-compliant folder structure generation
- ✅ Integration with GD linter validation
- ✅ Template versioning and management system
- ✅ All generated scenes pass validation tests
- ✅ No regression from Phase 1 functionality

---

## **Hop 2.1: Template Analysis & Pattern Extraction**

**Major Hop Overview**: Analyze existing mature addons to extract proven patterns, create template inheritance system, and establish the foundation for automated scene generation.

**Status**: 3/4 Sub-Hops Complete ✅ (Hop 2.1a ✅, Hop 2.1b ✅, Hop 2.1c ✅, Hop 2.1d 🚧)

**Sub-Hop Breakdown**:
- **Hop 2.1a**: Addon Analysis Foundation (MAAACKS focus) ✅ COMPLETE
- **Hop 2.1b**: Pattern Extraction & Documentation ✅ COMPLETE
- **Hop 2.1c**: Template Registry & Inheritance ✅ COMPLETE
- **Hop 2.1d**: Scene Generation Engine 🚧 NEXT

---

### **Hop 2.1a: Addon Analysis Foundation (MAAACKS Focus)**

#### **Scope**
Build the addon analysis infrastructure with MAAACKS addon as primary target. Extract basic patterns and create foundational analysis system.

#### **Prerequisites**
- ✅ Phase 1 complete (all hops 1.1, 1.2, 1.3, 1.4)
- ✅ EventBus operational
- ✅ Configuration system ready
- ✅ Logging infrastructure available

#### **Prerequisites**
- ✅ Phase 1 complete (all hops 1.1, 1.2, 1.3, 1.4)
- ✅ EventBus operational
- ✅ Configuration system ready
- ✅ Logging infrastructure available

#### **Deliverables**

1. **MAAACKS Analyzer Core** (~250 lines)
   - `addon_analyzer.gd`: Base analyzer class
   - `maaacks_analyzer.gd`: MAAACKS-specific analysis
   - Pattern discovery for menu systems
   - UI component identification

2. **Analysis Event System** (~150 lines)
   - 3 new signals: `analysis_started`, `pattern_discovered`, `analysis_complete`
   - Signal contracts documented
   - EventBus integration
   - Background analysis support

3. **Basic Pattern Storage** (~100 lines)
   - Pattern data structures
   - JSON serialization for discovered patterns
   - Temporary pattern storage
   - Basic pattern validation

#### **Explicit Non-Goals**
- ❌ Indie Blueprint analysis (deferred to 2.1b)
- ❌ Template inheritance system (deferred to 2.1c)
- ❌ Complex pattern relationships (deferred to 2.1b)
- ❌ Template registry (deferred to 2.1c)
- ❌ Advanced pattern confidence scoring (deferred to 2.1b)

#### **Signal Contracts (Hop 2.1a)**
```gdscript
# New signals added in Hop 2.1a
const HOP_2_1A_SIGNALS = {
    "analysis_started": {
        "args": ["addon_name: String", "scope: String"],
        "description": "Emitted when addon analysis begins",
        "frequency": "multiple_per_session",
        "emitter": "AddonAnalyzer"
    },
    "pattern_discovered": {
        "args": ["pattern_type: String", "source_addon: String", "metadata: Dictionary"],
        "description": "Emitted when reusable pattern is identified",
        "frequency": "high_frequency",
        "emitter": "MAAACKSAnalyzer"
    },
    "analysis_complete": {
        "args": ["addon_name: String", "stats: Dictionary"],
        "description": "Emitted when addon analysis completes",
        "frequency": "multiple_per_session",
        "emitter": "AddonAnalyzer"
    }
}
```

#### **Success Criteria**
- [ ] `addon_analyzer.gd` compiles and loads without errors
- [ ] `maaacks_analyzer.gd` successfully analyzes MAAACKS menu systems
- [ ] At least 5 MAAACKS patterns discovered and stored
- [ ] All 3 new signals emit correctly
- [ ] Background analysis doesn't block UI (uses `call_deferred()`)
- [ ] Analysis completes within 10 seconds for MAAACKS addon
- [ ] All Phase 1 tests still pass (regression check)
- [ ] GUT tests written for all 3 signals
- [ ] Documentation updated in SIGNAL_CONTRACTS.md

#### **Performance Targets**
- Analysis initialization: <2ms
- Pattern discovery (per pattern): <10ms
- Signal emission: <0.01ms
- Total MAAACKS analysis: 5-10 seconds (background)
- Memory usage: <10MB for pattern storage

#### **File Structure (Hop 2.1a)**
```
addons/broken_divinity_devtools/
└── modules/
    └── scene_builder/
        ├── scripts/
        │   ├── addon_analyzer.gd        # NEW: Base analyzer (~150 lines)
        │   └── maaacks_analyzer.gd      # NEW: MAAACKS analysis (~250 lines)
        ├── data/
        │   └── patterns_temp.json       # NEW: Temporary pattern storage
        └── tests/
            └── test_addon_analyzer.gd   # NEW: Analyzer tests (~200 lines)
```

---

### **Hop 2.1b: Pattern Extraction & Documentation** ✅ COMPLETE

**Completion Date**: 2025-10-03  
**Status**: All deliverables implemented and tested

#### **Scope**
Extend analysis to Indie Blueprint addon, implement pattern confidence scoring, and create comprehensive pattern documentation system.

#### **Prerequisites**
- ✅ Hop 2.1a complete
- ✅ MAAACKS analysis functional
- ✅ Base analyzer infrastructure ready

#### **Deliverables**

1. **Indie Blueprint Analyzer** (~300 lines) ✅
   - `indie_blueprint_analyzer.gd`: RPG framework analysis (411 lines)
   - Character system pattern extraction
   - State machine pattern identification
   - Save/load pattern discovery

2. **Pattern Confidence System** (~200 lines) ✅
   - `pattern_confidence.gd`: Pattern quality tracking (315 lines)
   - Pattern scoring algorithm
   - Usage frequency tracking
   - Best practice identification
   - Anti-pattern detection (8 types)

3. **Pattern Documentation Generator** (~250 lines) ✅
   - `pattern_documentation.gd`: Auto-doc generation (401 lines)
   - Auto-generated pattern documentation
   - Markdown output with code examples
   - Pattern relationship mapping
   - Best practice summaries

4. **Extended Analysis Signals** (~50 lines) ✅
   - 4 new signals for pattern classification
   - UI pattern specific signals
   - Scene structure analysis signals
   - All signals documented in SIGNAL_CONTRACTS.md

#### **Explicit Non-Goals**
- ❌ Template inheritance (deferred to 2.1c)
- ❌ Template registry (deferred to 2.1c)
- ❌ Template versioning (deferred to 2.1c)
- ❌ Scene generation (deferred to Hop 2.2)

#### **Signal Contracts (Hop 2.1b)** ✅
```gdscript
# New signals added in Hop 2.1b (IMPLEMENTED)
const HOP_2_1B_SIGNALS = {
    "ui_pattern_identified": {
        "args": ["pattern_id: String", "ui_type: String", "confidence: float"],
        "description": "Emitted when UI pattern is identified and classified",
        "frequency": "high_frequency",
        "emitter": "IndieBlueprintAnalyzer"
    },
    "best_practice_found": {
        "args": ["practice_id: String", "category: String", "description: String"],
        "description": "Emitted when best practice is found in analyzed code",
        "frequency": "multiple_per_session",
        "emitter": "IndieBlueprintAnalyzer, MAAACKSAnalyzer"
    },
    "anti_pattern_detected": {
        "args": ["pattern_id: String", "issue_type: String", "severity: String"],
        "description": "Emitted when anti-pattern is detected",
        "frequency": "multiple_per_session",
        "emitter": "PatternConfidence"
    },
    "scene_structure_analyzed": {
        "args": ["scene_path: String", "structure_data: Dictionary"],
        "description": "Emitted when scene structure analysis completes",
        "frequency": "multiple_per_session",
        "emitter": "IndieBlueprintAnalyzer"
    }
}
```

#### **Success Criteria** ✅
- ✅ Indie Blueprint analysis discovers RPG patterns successfully (11 patterns)
- ✅ Pattern confidence scoring assigns valid scores (0.0-1.0)
- ✅ UI patterns identified across both addons (character, state machine, save, time systems)
- ✅ 9 best practices identified and documented
- ✅ Anti-pattern detection system implemented (8 types)
- ✅ All 4 new signals emit correctly and documented
- ✅ Pattern documentation generates valid Markdown
- ✅ All Hop 2.1a tests still pass (regression check)
- ✅ Performance targets met for all operations

#### **Performance Targets** ✅
- Indie Blueprint analysis: <10 seconds (background) ✅
- Pattern confidence calculation: <2ms per pattern ✅
- Documentation generation: <10ms per pattern ✅
- Total memory: <20MB for all patterns ✅
- Signal emission: <0.1ms ✅

#### **File Structure (Hop 2.1b)** ✅
```
addons/broken_divinity_devtools/
└── modules/
    └── scene_builder/
        ├── indie_blueprint_analyzer.gd       # NEW: 411 lines ✅
        ├── pattern_confidence.gd             # NEW: 315 lines ✅
        ├── pattern_documentation.gd          # NEW: 401 lines ✅
        └── test_scene_builder_hop_2_1b.gd    # NEW: 435 lines, 28 tests ✅
```

**Completion Documentation**: See `docs/plans/active/HOP_2_1B_COMPLETE.md`

---

### **Hop 2.1c: Template Registry & Inheritance** ✅

**Status:** ✅ COMPLETE  
**Completion Date:** 2025-10-03  
**Documentation:** See `/docs/plans/active/HOP_2_1C_COMPLETE.md`

#### **Scope**
Create template inheritance system, build template registry with version management, and establish template validation framework.

#### **Prerequisites**
- ✅ Hop 2.1a complete (MAAACKS analysis)
- ✅ Hop 2.1b complete (Pattern extraction)
- ✅ Pattern database populated

#### **Deliverables**

1. **Template Inheritance System** (~350 lines) ✅
   - `template_inheritance.gd`: Template inheritance resolution
   - Parent/child inheritance management
   - Component composition patterns (mixins, traits)
   - Circular reference detection
   - Inheritance chain resolution (<5ms)

2. **Template Registry** (~300 lines) ✅
   - `template_registry.gd`: Template storage and lifecycle
   - Template metadata storage (category, tags, version)
   - Version control and history tracking
   - Template dependency tracking (forward and reverse)
   - Search capabilities (name, tag, category)
   - Import/export JSON functionality

3. **Template Validation** (~200 lines) ✅
   - `template_validator.gd`: JSON schema validation
   - Required field verification (id, name, version, type)
   - Template integrity checks
   - Node structure validation
   - Inheritance chain validation
   - Dependency resolution validation (<2ms)

4. **Base Template Library** (~150 lines JSON) ✅
   - `ui_component.json`: Base UI component template
   - `game_scene.json`: Base game scene template with 3-layer hierarchy
   - `system_scene.json`: Base system/manager template (autoload-ready)
   - All templates validated and auto-loaded on plugin startup

5. **Testing** (~470 lines) ✅
   - `test_scene_builder_hop_2_1c.gd`: 40 comprehensive tests
   - Inheritance tests (10): chain resolution, merging, cycle prevention
   - Registry tests (14): CRUD, search, versioning, dependencies
   - Validator tests (11): schema validation, integrity checks
   - Integration tests (5): workflows, signal emission

6. **Documentation** ✅
   - `HOP_2_1C_COMPLETE.md`: Full completion documentation with examples
   - `SIGNAL_CONTRACTS.md`: Updated with 4 template system signals
   - Plugin integration documented
   - Usage examples and best practices

#### **Actual File Structure**
```
modules/scene_builder/
  template_inheritance.gd     ~350 lines   # Inheritance management
  template_registry.gd        ~300 lines   # Template storage & lifecycle
  template_validator.gd       ~200 lines   # JSON validation & integrity
templates/
  ui_component.json           ~50 lines    # Base UI template
  game_scene.json             ~60 lines    # Base game scene template
  system_scene.json           ~65 lines    # Base system template
tests/
  test_scene_builder_hop_2_1c.gd  ~470 lines  # 40 comprehensive tests
docs/plans/active/
  HOP_2_1C_COMPLETE.md        ~430 lines   # Completion documentation
modules/core/
  event_bus.gd                +30 lines    # 4 template system signals
plugin.gd                     +50 lines    # Template system integration
```

#### **Explicit Non-Goals**
- ❌ Scene generation (deferred to Hop 2.1d) - Next up!
- ❌ GDScript generation (deferred to Hop 2.2)
- ❌ Advanced template features (deferred to Hop 2.4)

#### **Signal Contracts (Hop 2.1c)**
```gdscript
# New signals added in Hop 2.1c
const HOP_2_1C_SIGNALS = {
    "template_registered": {
        "args": ["template_id: String", "version: String", "metadata: Dictionary"],
        "description": "Emitted when template is registered in system",
        "frequency": "multiple_per_session",
        "emitter": "TemplateRegistry"
    },
    "template_inheritance_resolved": {
        "args": ["child_template: String", "parent_template: String", "inheritance_type: String"],
        "description": "Emitted when template inheritance is established",
        "frequency": "multiple_per_session",
        "emitter": "TemplateInheritance"
    },
    "template_validation_complete": {
        "args": ["template_id: String", "validation_results: Dictionary"],
        "description": "Emitted when template validation completes",
        "frequency": "multiple_per_session",
        "emitter": "TemplateValidator"
    },
    "template_registry_updated": {
        "args": ["operation: String", "affected_templates: Array"],
        "description": "Emitted when template registry is modified",
        "frequency": "multiple_per_session",
        "emitter": "TemplateRegistry"
    }
}
```

#### **Success Criteria**
- [x] Template inheritance resolves correctly for 3-level template chains ✅
- [x] Registry manages 10+ templates with metadata (started with 3 base templates) ✅
- [x] Template validation catches invalid JSON schemas ✅
- [x] Circular reference detection prevents invalid inheritance ✅
- [x] All 4 new signals emit correctly ✅
- [x] Base template library loads without errors ✅
- [x] Template operations complete within performance targets (<2ms registry, <5ms inheritance) ✅
- [x] 40 comprehensive tests written covering all modules ✅
- [x] Full documentation complete (HOP_2_1C_COMPLETE.md, SIGNAL_CONTRACTS.md) ✅

#### **Performance Targets**
- Template registration: <2ms per template
- Inheritance resolution: <5ms per template chain
- Validation: <10ms per template
- Registry operations: <2ms
- Total registry memory: <15MB

#### **File Structure (Hop 2.1c)**
```
addons/broken_divinity_devtools/
└── modules/
    └── scene_builder/
        ├── scripts/
        │   ├── inheritance_manager.gd     # NEW: Inheritance system (~350 lines)
        │   ├── registry_manager.gd        # NEW: Registry management (~300 lines)
        │   └── template_validator.gd      # NEW: Validation (~200 lines)
        ├── templates/
        │   └── base/
        │       ├── ui_component.json      # NEW: Base UI template
        │       ├── game_scene.json        # NEW: Base game template
        │       └── system_scene.json      # NEW: Base system template
        ├── data/
        │   ├── template_schema.json       # NEW: JSON Schema Draft-07
        │   ├── inheritance_rules.json     # NEW: Inheritance rules
        │   └── template_registry.json     # NEW: Registry database
        └── tests/
            ├── test_inheritance_manager.gd   # NEW: Inheritance tests (~300 lines)
            ├── test_registry_manager.gd      # NEW: Registry tests (~250 lines)
            └── test_template_validator.gd    # NEW: Validation tests (~200 lines)
```

---

## **Hop 2.2: JSON Template System & Scene Generation**

**Major Hop Overview**: Implement core scene generation system using JSON templates, including node instantiation, GDScript generation, and proper scene wiring with CTS compliance.

**Status**: 2/3 Sub-Hops Complete ✅ (Hop 2.2a ✅, Hop 2.2b ✅, Hop 2.2c 🚧)

**Sub-Hop Breakdown**:
- **Hop 2.2a**: Scene Generation Core (Node instantiation) ✅ COMPLETE
- **Hop 2.2b**: GDScript Generation & Wiring ✅ COMPLETE
- **Hop 2.2c**: CTS Integration & Validation 🚧 NEXT

---

### **Hop 2.2a: Scene Generation Core (Node Instantiation)**

#### **Scope**
Build the core scene generation engine that creates Godot scenes from JSON templates with proper node hierarchies and property assignment.

#### **Prerequisites**
- ✅ Hop 2.1 complete (all sub-hops a, b, c)
- ✅ Template registry operational
- ✅ Template validation functional

#### **Status: ✅ COMPLETE**
- **Completion Date:** 2024
- **Line Count:** ~950 lines (PropertyMapper: 200, NodeFactory: 300, SceneGenerator: 450)
- **Signals Added:** 3 (generation_requested, node_created, generation_complete)
- **Test Coverage:** 20+ tests, all passing
- **Performance:** All targets met or exceeded

#### **Deliverables**

1. **Scene Generation Engine** (~400 lines)
   - `scene_generator.gd`: Main orchestrator
   - JSON template parsing
   - Scene hierarchy construction
   - Error handling and rollback

2. **Node Factory System** (~300 lines)
   - `node_factory.gd`: Dynamic node instantiation
   - Property assignment from JSON
   - Node type resolution
   - Node configuration

3. **Property Mapping** (~200 lines)
   - `property_mapper.gd`: JSON to Godot property mapping
   - Type conversion and validation
   - Complex property handling (Colors, Vectors, etc.)
   - Property validation

#### **Explicit Non-Goals**
- ❌ GDScript generation (deferred to 2.2b)
- ❌ Signal connections (deferred to 2.2b)
- ❌ CTS folder structure (deferred to 2.2c)
- ❌ Advanced scene features (deferred to Hop 2.4)

#### **Signal Contracts (Hop 2.2a)**
```gdscript
# New signals added in Hop 2.2a
const HOP_2_2A_SIGNALS = {
    "generation_requested": {
        "args": ["template_id: String", "output_path: String", "params: Dictionary"],
        "description": "Emitted when scene generation is requested",
        "frequency": "multiple_per_session",
        "emitter": "SceneGenerator"
    },
    "template_loaded": {
        "args": ["template_id: String", "validation_status: String"],
        "description": "Emitted when template is loaded and validated",
        "frequency": "multiple_per_session",
        "emitter": "SceneGenerator"
    },
    "node_created": {
        "args": ["node_type: String", "node_name: String", "properties: Dictionary"],
        "description": "Emitted when individual node is instantiated",
        "frequency": "high_frequency",
        "emitter": "NodeFactory"
    }
}
```

#### **Success Criteria**
- [x] Generates simple scene from JSON template (Control + 2 children)
- [x] Node properties assign correctly from template
- [x] Scene hierarchy matches template specification
- [x] Error handling rolls back partial generations
- [x] All 3 new signals emit correctly
- [x] Generated scenes load in Godot editor without errors
- [x] All Hop 2.1 tests still pass (regression check)
- [x] Performance targets met for scene generation (<5s for 100 nodes)

**Actual Results:**
- ✅ PropertyMapper: 15+ Godot type conversions, <0.5ms per property
- ✅ NodeFactory: 30+ built-in node types, <1ms per node, 90%+ cache hit rate
- ✅ SceneGenerator: Complete workflow with inheritance, rollback, <2.5s for 50 nodes
- ✅ Full integration with EventBus, plugin lifecycle, template system
- ✅ 20+ comprehensive tests covering all workflows
- ✅ Documentation: HOP_2_2A_COMPLETE.md, SIGNAL_CONTRACTS.md updated

#### **Performance Targets**
- Scene generation initialization: <2ms
- Node creation: <1ms per node
- Property assignment: <0.5ms per property
- Total generation time: <5 seconds for complex scenes (100+ nodes)
- Memory usage: <50MB during generation

---

### **Hop 2.2b: GDScript Generation & Wiring**

#### **Scope**
Implement GDScript code generation from templates with signal connection automation and method stub generation.

#### **Prerequisites**
- ✅ Hop 2.2a complete
- ✅ Scene generation functional
- ✅ Node instantiation working

#### **Deliverables**

1. **Script Weaver System** (~450 lines)
   - `script_weaver.gd`: GDScript generation engine
   - Template-driven code generation
   - Signal connection automation
   - Method stub generation

2. **Reference Resolution** (~200 lines)
   - `reference_resolver.gd`: Node reference system
   - NodePath validation
   - `@onready` variable generation
   - Unique name handling (`%` syntax)

3. **Script Templates** (~300 lines total)
   - `base_controller.gd.template`: Base controller
   - `ui_component.gd.template`: UI component
   - `game_location.gd.template`: Game location
   - Template variable substitution

#### **Explicit Non-Goals**
- ❌ CTS folder structure (deferred to 2.2c)
- ❌ Documentation generation (deferred to 2.2c)
- ❌ Advanced script features (deferred to Hop 2.4)

#### **Signal Contracts (Hop 2.2b)**
```gdscript
# New signals added in Hop 2.2b
const HOP_2_2B_SIGNALS = {
    "script_generated": {
        "args": ["script_path: String", "template_used: String", "line_count: int"],
        "description": "Emitted when GDScript file is generated",
        "frequency": "multiple_per_session",
        "emitter": "ScriptWeaver"
    },
    "signal_connected": {
        "args": ["source: String", "signal_name: String", "target: String", "method: String"],
        "description": "Emitted when signal connection is established",
        "frequency": "high_frequency",
        "emitter": "ScriptWeaver"
    },
    "reference_resolved": {
        "args": ["reference_name: String", "node_path: NodePath"],
        "description": "Emitted when node reference is resolved",
        "frequency": "high_frequency",
        "emitter": "ReferenceResolver"
    }
}
```

#### **Success Criteria**
- [ ] Generates valid GDScript that compiles without errors
- [ ] Signal connections work correctly in generated scenes
- [ ] `@onready` variables reference correct nodes
- [ ] Method stubs include proper type hints
- [ ] All 3 new signals emit correctly
- [ ] Generated scripts follow GDScript style guide
- [ ] All Hop 2.2a tests still pass (regression check)
- [ ] GD linter validation passes on generated scripts

#### **Performance Targets**
- Script generation: <3 seconds for complex scripts
- Signal connection: <0.5ms per connection
- Reference resolution: <1ms per reference
- Script validation: <2 seconds per script
- Memory usage: <30MB for script generation

---

### **Hop 2.2c: CTS Integration & Validation**

#### **Scope**
Integrate CTS-compliant folder structure generation, automatic documentation, and validation framework for generated content.

#### **Prerequisites**
- ✅ Hop 2.2a complete (Scene generation)
- ✅ Hop 2.2b complete (GDScript generation)
- ✅ Phase 1 CTS validator available

#### **Deliverables**

1. **CTS Enforcer** (~300 lines)
   - `cts_enforcer.gd`: Folder structure generation
   - Naming convention enforcement
   - File placement validation
   - CTS compliance checking

2. **Generation Validator** (~350 lines)
   - `scene_validator.gd`: Generated scene validation
   - `script_validator.gd`: Generated script validation
   - Integration with Phase 1 validation engine
   - Validation reporting

3. **Documentation Generator** (~250 lines)
   - Auto-generated README.md for generated content
   - Signal contract documentation
   - Usage examples
   - API documentation

#### **Explicit Non-Goals**
- ❌ Template management UI (deferred to Hop 2.3)
- ❌ Advanced generation features (deferred to Hop 2.4)

#### **Signal Contracts (Hop 2.2c)**
```gdscript
# New signals added in Hop 2.2c
const HOP_2_2C_SIGNALS = {
    "hierarchy_built": {
        "args": ["scene_path: String", "node_count: int", "depth: int"],
        "description": "Emitted when scene hierarchy construction completes",
        "frequency": "multiple_per_session",
        "emitter": "SceneGenerator"
    },
    "cts_validated": {
        "args": ["target_path: String", "compliance_score: float", "violations: Array"],
        "description": "Emitted when CTS validation completes",
        "frequency": "multiple_per_session",
        "emitter": "CTSEnforcer"
    },
    "generation_complete": {
        "args": ["output_directory: String", "files_created: Array", "success: bool"],
        "description": "Emitted when complete generation workflow finishes",
        "frequency": "multiple_per_session",
        "emitter": "SceneGenerator"
    }
}
```

#### **Success Criteria**
- [ ] Generated content follows CTS folder structure
- [ ] File naming conventions enforced correctly
- [ ] CTS compliance score >0.9 for all generated content
- [ ] Documentation generates correctly for all outputs
- [ ] All 3 new signals emit correctly
- [ ] Integration with Phase 1 validator works
- [ ] All Hop 2.2a and 2.2b tests pass (regression check)
- [ ] End-to-end generation workflow functional

#### **Performance Targets**
- CTS folder creation: <1 second
- Validation: <2 seconds per generated project
- Documentation generation: <1 second
- Total workflow: <10 seconds for complete generation
- Memory usage: <100MB for complete workflow

---

## **Hop 2.3: Template Management & UI** ✅

**Major Hop Overview**: Create template management system with UI for browsing, selecting, and configuring templates.

**Status**: 2/2 Sub-Hops Complete ✅ (Hop 2.3a ✅, Hop 2.3b ✅)

**Sub-Hop Breakdown**:
- **Hop 2.3a**: Template Browser UI ✅ COMPLETE
- **Hop 2.3b**: Template Configuration & Preview ✅ COMPLETE

---

### **Hop 2.3a: Template Browser UI**

#### **Scope**
Build UI for browsing available templates, viewing template metadata, and basic template selection.

#### **Prerequisites**
- ✅ Hop 2.2 complete (all sub-hops a, b, c)
- ✅ Template registry functional
- ✅ Scene generation working

#### **Deliverables**

1. **Template Browser Panel** (~400 lines)
   - Template list view with filtering
   - Template metadata display
   - Search and categorization
   - Template preview

2. **Template Detail View** (~300 lines)
   - Template property display
   - Inheritance hierarchy visualization
   - Dependency information
   - Version history

#### **Explicit Non-Goals**
- ❌ Template configuration (deferred to 2.3b)
- ❌ Template creation UI (deferred to Hop 2.4)
- ❌ Advanced template editing (deferred to Hop 2.4)

#### **Success Criteria**
- [ ] Template browser lists all registered templates
- [ ] Search and filtering work correctly
- [ ] Template details display accurately
- [ ] UI responsive and follows BD DevTools style
- [ ] Integration with dock system works
- [ ] All Hop 2.2 tests still pass (regression check)

---

### **Hop 2.3b: Template Configuration & Preview** ✅

**Status**: COMPLETE (2025-01-XX)  
**Implementation**: Complete with comprehensive testing  
**Documentation**: HOP_2_3B_COMPLETE.md  

#### **Scope**
Add template configuration UI with parameter customization and real-time preview of generation output.

#### **Prerequisites**
- ✅ Hop 2.3a complete
- ✅ Template browser functional

#### **Deliverables** ✅

1. **Configuration Panel** (488 lines) ✅
   - ✅ Template parameter editing with type-aware controls
   - ✅ Property customization UI (CheckBox, SpinBox, LineEdit, ColorPickerButton)
   - ✅ Real-time validation feedback (<2ms target)
   - ✅ Configuration presets (save/load/delete)
   - ✅ Reset to defaults functionality
   - **File**: `modules/ui/template_configuration_panel.gd`

2. **Preview System** (369 lines) ✅
   - ✅ Real-time generation preview with 3 modes
   - ✅ Dry-run mode (no file creation, in-memory)
   - ✅ Preview scene visualization (hierarchy tree)
   - ✅ Generated code preview (GDScript + JSON)
   - ✅ Deferred updates for performance (<10ms target)
   - **File**: `modules/ui/template_preview_system.gd`

3. **EventBus Integration** (+45 lines) ✅
   - ✅ 3 new signals (configuration_changed, preview_generated, preview_failed)
   - ✅ Signal contracts documented (v0.8.0-alpha)
   - ✅ Logger integration for all signal emissions
   - **File**: `modules/core/event_bus.gd`

4. **Dock Integration** (265 lines) ✅
   - ✅ HSplitContainer layout (browse/details/config/preview)
   - ✅ Complete signal wiring between 4 components
   - ✅ Global registry access via autoloads
   - **Files**: `dock/template_browser_dock.gd`, `plugin.gd`, `dock/bd_dock.gd`

5. **Testing** (442 lines, 40+ tests) ✅
   - ✅ Configuration panel tests (11)
   - ✅ Preview system tests (9)
   - ✅ EventBus signal contracts (3)
   - ✅ Integration tests (5)
   - ✅ Performance benchmarks (2)
   - ✅ Error handling coverage (3)
   - **File**: `tests/test_template_configuration.gd`

#### **Success Criteria** ✅
- ✅ Template parameters configurable via UI
- ✅ Preview generates without creating files
- ✅ Configuration validation works (<2ms)
- ✅ Preview updates in real-time (<10ms)
- ✅ All Hop 2.3a tests still pass (regression check)
- ✅ CTS compliance: <500 lines per file
- ✅ Signal-first architecture enforced
- ✅ Comprehensive testing with GUT framework
- ✅ Full documentation complete

#### **Implementation Notes**
- Total new code: ~1,629 lines across 4 files
- Total modified code: +71 lines across 3 files
- EventBus signals: 45 total (39 previous + 3 Hop 2.3a + 3 Hop 2.3b)
- Performance validated: All targets met in test suite
- All modules compile with 0 errors
- See `docs/plans/active/HOP_2_3B_COMPLETE.md` for detailed documentation

---

## **Hop 2.4: Advanced Generation Features**

**Major Hop Overview**: Implement advanced template features including composite generation, validation systems, and optimization tools.

**Status**: 1/3 Sub-Hops Complete ✅ (Hop 2.4a ✅, Hop 2.4b 🚧, Hop 2.4c 🚧)

**Sub-Hop Breakdown**:
- **Hop 2.4a**: Template Composition Core ✅ COMPLETE
- **Hop 2.4b**: Composition Validation & Conflict Resolution ✅ COMPLETE
- **Hop 2.4c**: Advanced Composition Features (NEXT)

---

### **Hop 2.4a: Template Composition Core** ✅

**Status**: COMPLETE (2025-01-XX)  
**Implementation**: Complete with comprehensive testing  
**Documentation**: HOP_2_4A_COMPLETE.md  

#### **Scope**
Enable multi-template composition for complex scene generation with layer-based merging and override resolution. Focus on core composition engine without conflict detection (deferred to 2.4b).

#### **Prerequisites**
- ✅ Hop 2.3 complete (all sub-hops a, b)
- ✅ Template configuration functional
- ✅ Template preview system operational
- ✅ EventBus and Logger ready

#### **Deliverables** ✅

1. **Template Composer Engine** (346 lines) ✅
   - ✅ Multi-template orchestration with layer management
   - ✅ Layer-based composition workflow (base + overlays)
   - ✅ Base template + overlay management (add/remove)
   - ✅ Composition state tracking and statistics
   - ✅ Public API: `compose_templates()`, `add_overlay()`, `remove_overlay()`, `get_composition_result()`
   - ✅ Performance monitoring with target validation
   - **File**: `modules/scene_builder/template_composer.gd`

2. **Template Merger Utility** (305 lines) ✅
   - ✅ Node matching by name/path
   - ✅ Property merging logic with type awareness
   - ✅ Override resolution (last-wins default, merge-properties option)
   - ✅ Children preservation and recursive merging
   - ✅ Connection merging with deduplication
   - ✅ Public API: `merge_templates()`, `merge_nodes()`, `apply_overrides()`
   - **File**: `modules/scene_builder/template_merger.gd`

3. **EventBus Integration** (+43 lines) ✅
   - ✅ 3 new signals: `composition_started`, `template_merged`, `composition_complete`
   - ✅ Signal contracts documented (v0.9.0-alpha)
   - ✅ Logger integration for all composition events
   - **File**: `modules/core/event_bus.gd`

4. **UI Integration** (Programmatic) ✅
   - ✅ Composition API ready for UI integration
   - ✅ Works with existing TemplatePreviewSystem
   - ✅ Signal emissions enable UI tracking
   - **Note**: GUI controls deferred to future refinement

5. **Testing** (665 lines, 35 tests) ✅
   - ✅ Composition engine tests (10)
   - ✅ Merger logic tests (8)
   - ✅ EventBus signal contracts (3)
   - ✅ Integration tests (5)
   - ✅ Performance benchmarks (3): <30ms, <50ms, <100ms targets
   - ✅ Edge case handling (6)
   - **File**: `tests/test_template_composition.gd`

#### **Explicit Non-Goals**
- ❌ Conflict detection and resolution (deferred to 2.4b)
- ❌ Conditional generation rules (deferred to 2.4c)
- ❌ Template macros and variables (deferred to 2.4c)
- ❌ Batch generation support (deferred to 2.4c)
- ❌ Advanced validation beyond basic merging (deferred to 2.4b)

#### **Success Criteria** ✅
- ✅ Multiple templates (2-5) compose correctly
- ✅ Override resolution follows last-wins principle
- ✅ Layer ordering affects final output (sequential/reverse)
- ✅ Composition integrates with preview system (via signals)
- ✅ Performance: <50ms for 3-template composition
- ✅ Performance: <100ms for 5-template composition
- ✅ All 3 composition signals emit correctly
- ✅ CTS compliance: <500 lines per file (346, 305)
- ✅ All Hop 2.3 tests still pass (regression check)
- ✅ Comprehensive test coverage (35 tests)

#### **Performance Validation**
- ✅ 2-template composition: ~15-20ms (target: <30ms)
- ✅ 3-template composition: ~30-40ms (target: <50ms)
- ✅ 5-template composition: ~70-85ms (target: <100ms)
- ✅ Memory overhead: Minimal (uses duplicate() for safety)
- ✅ All performance tests pass in GUT framework

#### **Implementation Notes**
- Total new code: ~651 lines across 2 modules
- Total test code: 665 lines (35 comprehensive tests)
- EventBus: +43 lines (3 signals with full contracts)
- Total signals: 48 (45 from Hop 2.3b + 3 new)
- All modules compile with 0 errors
- See `docs/plans/active/HOP_2_4A_COMPLETE.md` for detailed documentation

---

### **Hop 2.4b: Composition Validation & Conflict Resolution** ✅ **COMPLETE**

#### **Scope**
Add intelligent conflict detection, resolution strategies, and comprehensive validation for composed templates.

#### **Prerequisites**
- ✅ Hop 2.4a complete
- ✅ Core composition functional

#### **Deliverables**

1. **Composition Validator** (~300 lines) ✅
   - ✅ Conflict detection (property collisions, type mismatches)
   - ✅ Validation rules for composed templates (4 conflict types)
   - ✅ Dependency checking (connection validation)
   - ✅ Structural integrity validation (metadata, hierarchy)
   - **Actual**: 337 lines (composition_validator.gd)
   - **Performance**: <10ms validation for 3-template composition

2. **Conflict Resolver** (~250 lines) ✅
   - ✅ Resolution strategies (last-wins, merge, priority-based, manual)
   - ✅ User-configurable conflict rules (per-property overrides)
   - ✅ Automatic resolution with configurable strategies
   - ✅ Manual override support (flag for user decision)
   - **Actual**: 367 lines (conflict_resolver.gd)
   - **Performance**: <5ms per conflict resolution

3. **EventBus Integration** ✅
   - ✅ 2 new signals: conflict_detected, conflict_resolved
   - ✅ Full signal contracts documented in SIGNAL_CONTRACTS.md
   - ✅ Signal-first architecture (signals added before modules)
   - **Total signals**: 50 (48 from Hop 2.4a + 2 new)

4. **TemplateComposer Integration** ✅
   - ✅ Optional validation parameters (non-breaking)
   - ✅ Auto-resolution workflow integration
   - ✅ Backward compatible (all params default to false)
   - **Integration code**: +107 lines to template_composer.gd

5. **Comprehensive Test Suite** ✅
   - ✅ 30 tests across 5 categories (validator, resolver, integration, performance, signals)
   - ✅ All conflict types tested
   - ✅ All resolution strategies tested
   - ✅ Performance targets validated
   - **Test code**: 720 lines (test_composition_validation.gd)

#### **Success Criteria**
- ✅ Conflicts detected accurately (4 conflict types: property collision, type mismatch, structural violation, missing dependency)
- ✅ Resolution strategies work correctly (4 strategies: last-wins, priority-based, merge, manual)
- ✅ User can configure conflict handling (custom rules, template priorities, strategy selection)
- ✅ All Hop 2.4a tests still pass (regression check - no breaking changes)
- ✅ Performance targets met (<10ms validation, <5ms per conflict)
- ✅ Signal contracts fully documented (conflict_detected, conflict_resolved)
- ✅ CTS compliance (<500 lines per file: 337, 367)
- ✅ Comprehensive testing (30 GUT tests)

#### **Performance Validation**
- ✅ Validation (3 templates): ~3-5ms (target: <10ms)
- ✅ Resolution (per conflict): ~1-2ms (target: <5ms)
- ✅ Combined validation + resolution (5 conflicts): ~15-20ms (target: <35ms)
- ✅ Last-wins strategy: ~0.5ms per conflict (fastest)
- ✅ Priority-based strategy: ~1ms per conflict
- ✅ Merge strategy: ~2-3ms per conflict (depends on value size)

#### **Implementation Notes**
- Total new code: ~704 lines across 2 modules
- Total integration code: +157 lines (EventBus +50, TemplateComposer +107)
- Total test code: 720 lines (30 comprehensive tests)
- Total signals: 50 (48 from previous + 2 new)
- All modules compile with 0 errors
- Signal contracts: v0.10.0-alpha
- See `docs/plans/active/HOP_2_4B_COMPLETE.md` for detailed documentation

---

### **Hop 2.4c: Advanced Composition Features**

**Major Hop Overview**: Extend template composition system with conditional rules, macro expansion, variable substitution, and batch generation workflows.

**Status**: Planning (Refinement Required for CTS Compliance)  
**CTS Analysis**: Original scope too broad (3 unrelated systems, ~750 lines, 7+ signals) → Requires sub-hop split

**Sub-Hop Breakdown**:
- **Hop 2.4c-i**: Conditional Rules Engine (RECOMMENDED FIRST)
- **Hop 2.4c-ii**: Macro & Variable System
- **Hop 2.4c-iii**: Batch Generation Workflow

**Original Scope Issues Identified**:
- ❌ 3 unrelated systems in one hop (conditionals, macros, batch)
- ❌ ~750 total lines (exceeds <750 CTS limit)
- ❌ 7+ signals required (exceeds 2-3 per hop guideline)
- ❌ No signal contracts defined
- ❌ No performance targets specified
- ❌ Mixed concerns (selection logic + parameterization + workflow)

**Recommended Approach**: Implement as 3 independent sub-hops following CTS compliance pattern established in Hops 1.1 and 2.4a/b.

---

### **Hop 2.4c-i: Conditional Rules Engine** 🎯 **RECOMMENDED NEXT**

#### **Scope**
Context-aware template selection based on configurable rule evaluation system. Single-purpose hop focused on conditional logic only.

#### **Prerequisites**
- ✅ Hop 2.4b complete (Validation & Resolution)
- ✅ Template composition functional
- ✅ EventBus operational with 50 signals

#### **Deliverables**

1. **ConditionalRuleEngine Core** (~300 lines)
   - `conditional_rule_engine.gd`: Rule evaluation system
   - Rule schema definition (JSON/YAML)
   - Context matching and evaluation
   - Rule priority and chaining
   - Performance: <5ms for 10 rules, <100ms for 100 rules
   - **File**: `modules/scene_builder/conditional_rule_engine.gd`

2. **Rule Data Structures** (~50 lines JSON)
   - `rule_schema.json`: JSON schema for rule definitions
   - `default_rules.json`: Example conditional rules
   - Context specification format
   - **Location**: `modules/scene_builder/data/`

3. **EventBus Integration** (~30 lines)
   - 2 new signals (signal-first):
     * `rule_evaluated(rule_id: String, context: Dictionary, result: bool, execution_time_ms: float)`
     * `context_selected(template_id: String, context_data: Dictionary, rule_chain: Array)`
   - Signal contracts documented in SIGNAL_CONTRACTS.md
   - **Total signals**: 52 (50 from Hop 2.4b + 2 new)

4. **Comprehensive Testing** (~350 lines, 15+ tests)
   - Rule evaluation tests (5): Simple rules, complex rules, priority handling
   - Context matching tests (3): Exact match, partial match, wildcard
   - Integration tests (3): Template selection workflow, multi-rule chaining
   - Performance tests (2): <5ms for 10 rules, <100ms for 100 rules
   - Signal contract tests (2): rule_evaluated, context_selected
   - **File**: `tests/test_conditional_rules_hop_2_4c_i.gd`

5. **Documentation** (~200 lines)
   - `HOP_2_4C_I_COMPLETE.md`: Completion documentation
   - Rule syntax and usage examples
   - Integration guide with TemplateComposer
   - Performance validation results
   - **Location**: `docs/plans/active/`

#### **Explicit Non-Goals**
- ❌ Macro expansion (deferred to Hop 2.4c-ii)
- ❌ Variable substitution (deferred to Hop 2.4c-ii)
- ❌ Batch processing (deferred to Hop 2.4c-iii)
- ❌ Template parameterization (deferred to Hop 2.4c-ii)
- ❌ Multi-composition workflows (deferred to Hop 2.4c-iii)

#### **Signal Contracts (Hop 2.4c-i)**
```gdscript
# New signals added in Hop 2.4c-i (SIGNAL-FIRST)
const HOP_2_4C_I_SIGNALS = {
    "rule_evaluated": {
        "purpose": "Emitted when a conditional rule is evaluated",
        "args": {
            "rule_id": "String - Unique identifier for the rule",
            "context": "Dictionary - Context data used for evaluation",
            "result": "bool - Evaluation result (true/false)",
            "execution_time_ms": "float - Time taken to evaluate (ms)"
        },
        "frequency": "Per rule evaluation (potentially high)",
        "example_payload": {
            "rule_id": "ui_context_desktop",
            "context": {"platform": "desktop", "screen_size": "1920x1080"},
            "result": true,
            "execution_time_ms": 1.2
        }
    },
    "context_selected": {
        "purpose": "Emitted when template is selected based on context",
        "args": {
            "template_id": "String - Selected template identifier",
            "context_data": "Dictionary - Context that triggered selection",
            "rule_chain": "Array[String] - Rules that matched in priority order"
        },
        "frequency": "Per template selection (moderate)",
        "example_payload": {
            "template_id": "ui_component_desktop",
            "context_data": {"platform": "desktop", "theme": "dark"},
            "rule_chain": ["platform_desktop", "theme_dark"]
        }
    }
}
```

#### **Success Criteria**
- [ ] **Signal-First**: All 2 signals defined in EventBus BEFORE module implementation
- [ ] **Scope Compliance**: ConditionalRuleEngine <500 lines (target: ~300)
- [ ] **Signal Contracts**: Both signals documented in SIGNAL_CONTRACTS.md v0.11.0-alpha
- [ ] **Comprehensive Testing**: 15+ tests covering all functionality
- [ ] **Performance Targets Met**:
  - [ ] <5ms rule evaluation for 10 rules
  - [ ] <100ms rule evaluation for 100 rules
  - [ ] <2ms for simple single-rule evaluation
- [ ] **Rule Evaluation**: Conditional rules evaluate correctly with context
- [ ] **Context Matching**: Template selection works based on context data
- [ ] **Rule Priority**: Multiple rules resolve with correct priority
- [ ] **Integration**: Works seamlessly with TemplateComposer
- [ ] **Regression Check**: All Hop 2.4b tests still pass (no breaking changes)
- [ ] **CTS Compliance**: All Definition of Done items met
- [ ] **Documentation**: HOP_2_4C_I_COMPLETE.md created with examples
- [ ] **0 Errors**: Clean compilation across all files

#### **Performance Targets**
- Rule loading: <1ms
- Simple rule evaluation: <2ms
- Complex rule evaluation (10 conditions): <5ms
- Rule chain evaluation (10 rules): <5ms
- Batch evaluation (100 rules): <100ms
- Context matching: <1ms per rule
- Signal emission: <0.1ms
- Memory usage: <5MB for 100 rules

#### **File Structure (Hop 2.4c-i)**
```
modules/scene_builder/
  conditional_rule_engine.gd   ~300 lines   # Rule evaluation system
  data/
    rule_schema.json            ~30 lines    # Rule definition schema
    default_rules.json          ~20 lines    # Example rules
tests/
  test_conditional_rules_hop_2_4c_i.gd  ~350 lines  # 15+ comprehensive tests
docs/plans/active/
  HOP_2_4C_I_COMPLETE.md        ~200 lines   # Completion documentation
modules/core/
  event_bus.gd                  +30 lines    # 2 new signals
```

---

### **Hop 2.4c-ii: Macro & Variable System** 🔮 **FUTURE**

#### **Scope**
Template parameterization with macro expansion and variable substitution. Enables dynamic template generation with reusable template fragments.

#### **Prerequisites**
- ✅ Hop 2.4c-i complete (Conditional Rules)
- ✅ Rule-based template selection functional
- ✅ EventBus operational with 52 signals

#### **Deliverables**

1. **MacroProcessor System** (~150 lines)
   - `macro_processor.gd`: Macro expansion engine
   - Macro definition and registration
   - Recursive macro expansion
   - Macro validation and error handling
   - Performance: <10ms macro expansion
   - **File**: `modules/scene_builder/macro_processor.gd`

2. **VariableResolver System** (~100 lines)
   - `variable_resolver.gd`: Variable substitution engine
   - Variable scope management
   - Type-safe variable substitution
   - Default value handling
   - Performance: <5ms variable resolution
   - **File**: `modules/scene_builder/variable_resolver.gd`

3. **EventBus Integration** (~30 lines)
   - 2 new signals (signal-first):
     * `macro_expanded(macro_id: String, expanded_content: Dictionary, variables_used: Array)`
     * `variables_substituted(template_id: String, variable_map: Dictionary, substitution_count: int)`
   - Signal contracts documented in SIGNAL_CONTRACTS.md
   - **Total signals**: 54 (52 from Hop 2.4c-i + 2 new)

4. **Comprehensive Testing** (~400 lines, 20+ tests)
   - Macro expansion tests (8): Simple macros, nested macros, recursive expansion
   - Variable substitution tests (6): Type conversion, defaults, scope resolution
   - Integration tests (4): Combined macro + variable workflows
   - Performance tests (2): <10ms expansion, <5ms substitution
   - **File**: `tests/test_macros_variables_hop_2_4c_ii.gd`

5. **Documentation** (~250 lines)
   - `HOP_2_4C_II_COMPLETE.md`: Completion documentation
   - Macro syntax and variable reference
   - Template parameterization examples
   - Best practices and patterns
   - **Location**: `docs/plans/active/`

#### **Explicit Non-Goals**
- ❌ Conditional rules (completed in Hop 2.4c-i)
- ❌ Batch processing (deferred to Hop 2.4c-iii)
- ❌ Multi-composition workflows (deferred to Hop 2.4c-iii)
- ❌ Advanced macro features (loops, conditionals within macros)

#### **Signal Contracts (Hop 2.4c-ii)**
```gdscript
# New signals added in Hop 2.4c-ii (SIGNAL-FIRST)
const HOP_2_4C_II_SIGNALS = {
    "macro_expanded": {
        "purpose": "Emitted when a template macro is expanded",
        "args": {
            "macro_id": "String - Macro identifier",
            "expanded_content": "Dictionary - Resulting template content",
            "variables_used": "Array[String] - Variables referenced in macro"
        },
        "frequency": "Per macro expansion (moderate)",
        "example_payload": {
            "macro_id": "ui_button_template",
            "expanded_content": {"type": "Button", "properties": {"text": "Click Me"}},
            "variables_used": ["button_text", "button_size"]
        }
    },
    "variables_substituted": {
        "purpose": "Emitted when template variables are substituted",
        "args": {
            "template_id": "String - Template being processed",
            "variable_map": "Dictionary - Variable name → value mappings",
            "substitution_count": "int - Number of substitutions performed"
        },
        "frequency": "Per template processing (moderate)",
        "example_payload": {
            "template_id": "game_menu_main",
            "variable_map": {"title": "Main Menu", "version": "v1.0"},
            "substitution_count": 5
        }
    }
}
```

#### **Success Criteria**
- [ ] **Signal-First**: All 2 signals defined in EventBus BEFORE module implementation
- [ ] **Scope Compliance**: Each file <500 lines (MacroProcessor ~150, VariableResolver ~100)
- [ ] **Signal Contracts**: Both signals documented in SIGNAL_CONTRACTS.md v0.12.0-alpha
- [ ] **Comprehensive Testing**: 20+ tests covering all functionality
- [ ] **Performance Targets Met**:
  - [ ] <10ms macro expansion for complex macros
  - [ ] <5ms variable substitution for 50 variables
  - [ ] <20ms combined macro + variable processing
- [ ] **Macro Expansion**: Macros expand correctly with recursive support
- [ ] **Variable Substitution**: Variables substitute with type safety
- [ ] **Integration**: Works with TemplateComposer and ConditionalRuleEngine
- [ ] **Regression Check**: All Hop 2.4c-i tests still pass (no breaking changes)
- [ ] **CTS Compliance**: All Definition of Done items met
- [ ] **Documentation**: HOP_2_4C_II_COMPLETE.md created with examples
- [ ] **0 Errors**: Clean compilation across all files

#### **Performance Targets**
- Macro loading: <1ms
- Simple macro expansion: <5ms
- Nested macro expansion (3 levels): <10ms
- Variable substitution (50 vars): <5ms
- Combined processing: <20ms
- Signal emission: <0.1ms
- Memory usage: <10MB for macro cache

#### **File Structure (Hop 2.4c-ii)**
```
modules/scene_builder/
  macro_processor.gd            ~150 lines   # Macro expansion
  variable_resolver.gd          ~100 lines   # Variable substitution
tests/
  test_macros_variables_hop_2_4c_ii.gd  ~400 lines  # 20+ tests
docs/plans/active/
  HOP_2_4C_II_COMPLETE.md       ~250 lines   # Completion doc
modules/core/
  event_bus.gd                  +30 lines    # 2 new signals
```

---

### **Hop 2.4c-iii: Batch Generation Workflow** 🚀 **FUTURE**

#### **Scope**
Multi-composition workflow orchestration with batch processing, progress tracking, and error recovery for generating multiple scenes efficiently.

#### **Prerequisites**
- ✅ Hop 2.4c-ii complete (Macro & Variable System)
- ✅ Template parameterization functional
- ✅ EventBus operational with 54 signals

#### **Deliverables**

1. **BatchCompositionManager** (~250 lines)
   - `batch_composition_manager.gd`: Batch workflow orchestrator
   - Multi-composition queue management
   - Parallel composition support (background threads)
   - Progress tracking and reporting
   - Error recovery and rollback
   - Performance: <200ms for 10 compositions
   - **File**: `modules/scene_builder/batch_composition_manager.gd`

2. **EventBus Integration** (~40 lines)
   - 3 new signals (signal-first):
     * `batch_started(batch_id: String, composition_count: int, estimated_time_ms: float)`
     * `batch_progress(batch_id: String, completed: int, total: int, current_template: String)`
     * `batch_complete(batch_id: String, success_count: int, failure_count: int, total_time_ms: float)`
   - Signal contracts documented in SIGNAL_CONTRACTS.md
   - **Total signals**: 57 (54 from Hop 2.4c-ii + 3 new)

3. **Comprehensive Testing** (~350 lines, 15+ tests)
   - Batch workflow tests (5): Sequential, parallel, mixed batches
   - Progress tracking tests (3): Progress signals, accurate counts
   - Error recovery tests (4): Partial failures, rollback, resume
   - Performance tests (3): 10 compositions, 50 compositions, stress test
   - **File**: `tests/test_batch_generation_hop_2_4c_iii.gd`

4. **Documentation** (~220 lines)
   - `HOP_2_4C_III_COMPLETE.md`: Completion documentation
   - Batch workflow examples
   - Performance optimization guide
   - Error handling strategies
   - **Location**: `docs/plans/active/`

#### **Explicit Non-Goals**
- ❌ Conditional rules (completed in Hop 2.4c-i)
- ❌ Macro/variable system (completed in Hop 2.4c-ii)
- ❌ Advanced batch scheduling (simple queue only)
- ❌ Distributed batch processing (single-instance only)

#### **Signal Contracts (Hop 2.4c-iii)**
```gdscript
# New signals added in Hop 2.4c-iii (SIGNAL-FIRST)
const HOP_2_4C_III_SIGNALS = {
    "batch_started": {
        "purpose": "Emitted when batch composition workflow begins",
        "args": {
            "batch_id": "String - Unique batch identifier",
            "composition_count": "int - Number of compositions in batch",
            "estimated_time_ms": "float - Estimated total time (ms)"
        },
        "frequency": "Per batch start (low)",
        "example_payload": {
            "batch_id": "game_menus_batch_001",
            "composition_count": 10,
            "estimated_time_ms": 180.0
        }
    },
    "batch_progress": {
        "purpose": "Emitted during batch processing for progress updates",
        "args": {
            "batch_id": "String - Batch identifier",
            "completed": "int - Compositions completed so far",
            "total": "int - Total compositions in batch",
            "current_template": "String - Template currently being processed"
        },
        "frequency": "Per composition completion (moderate)",
        "example_payload": {
            "batch_id": "game_menus_batch_001",
            "completed": 3,
            "total": 10,
            "current_template": "main_menu_desktop"
        }
    },
    "batch_complete": {
        "purpose": "Emitted when batch composition workflow finishes",
        "args": {
            "batch_id": "String - Batch identifier",
            "success_count": "int - Successfully completed compositions",
            "failure_count": "int - Failed compositions",
            "total_time_ms": "float - Actual total time taken (ms)"
        },
        "frequency": "Per batch completion (low)",
        "example_payload": {
            "batch_id": "game_menus_batch_001",
            "success_count": 9,
            "failure_count": 1,
            "total_time_ms": 165.3
        }
    }
}
```

#### **Success Criteria**
- [ ] **Signal-First**: All 3 signals defined in EventBus BEFORE module implementation
- [ ] **Scope Compliance**: BatchCompositionManager <500 lines (target: ~250)
- [ ] **Signal Contracts**: All 3 signals documented in SIGNAL_CONTRACTS.md v0.13.0-alpha
- [ ] **Comprehensive Testing**: 15+ tests covering all functionality
- [ ] **Performance Targets Met**:
  - [ ] <200ms for 10 compositions (batch)
  - [ ] <1000ms for 50 compositions (batch)
  - [ ] <20ms per composition (average)
- [ ] **Batch Processing**: Multiple compositions execute correctly
- [ ] **Progress Tracking**: Accurate progress signals emitted
- [ ] **Error Recovery**: Partial failures handled gracefully with rollback
- [ ] **Integration**: Works with ConditionalRuleEngine and MacroProcessor
- [ ] **Regression Check**: All Hop 2.4c-ii tests still pass (no breaking changes)
- [ ] **CTS Compliance**: All Definition of Done items met
- [ ] **Documentation**: HOP_2_4C_III_COMPLETE.md created with examples
- [ ] **0 Errors**: Clean compilation across all files

#### **Performance Targets**
- Batch initialization: <5ms
- Per-composition overhead: <2ms
- 10 compositions (sequential): <200ms
- 10 compositions (parallel): <120ms (if threading supported)
- 50 compositions (sequential): <1000ms
- Progress signal emission: <0.1ms
- Memory usage: <30MB for 50-composition batch

#### **File Structure (Hop 2.4c-iii)**
```
modules/scene_builder/
  batch_composition_manager.gd  ~250 lines   # Batch workflow orchestrator
tests/
  test_batch_generation_hop_2_4c_iii.gd  ~350 lines  # 15+ tests
docs/plans/active/
  HOP_2_4C_III_COMPLETE.md      ~220 lines   # Completion doc
modules/core/
  event_bus.gd                  +40 lines    # 3 new signals
```

---

### **Hop 2.4c Summary & Transition Plan**

#### **CTS Compliance Analysis**
**Original Hop 2.4c** (Single monolithic hop):
- ❌ ~750 total lines (exceeds <750 limit)
- ❌ 3 unrelated systems (exceeds single-focus guideline)
- ❌ 7+ signals (exceeds 2-3 per hop guideline)
- ❌ No signal contracts defined
- ❌ No performance targets specified
- ❌ Would violate CTS Definition of Done

**Refined Hop 2.4c** (3 sub-hops):
- ✅ Each sub-hop <500 lines per file, <750 total
- ✅ Single focused system per sub-hop
- ✅ 2-3 signals per sub-hop (7 total split across 3 hops)
- ✅ All signal contracts defined upfront
- ✅ Performance targets specified
- ✅ Follows CTS Definition of Done
- ✅ Matches successful pattern from Hop 1.1 (1.1a, 1.1b, 1.1c)

#### **Recommended Implementation Order**
1. **Hop 2.4c-i First**: Conditional Rules Engine
   - Foundation for context-aware template selection
   - Required by both macro system and batch generation
   - Standalone value (can ship without 2.4c-ii/iii)

2. **Hop 2.4c-ii Second**: Macro & Variable System
   - Builds on conditional rules for dynamic templates
   - Enables template parameterization
   - Can work without batch generation

3. **Hop 2.4c-iii Last**: Batch Generation Workflow
   - Orchestrates all previous features
   - Requires both conditional rules and macros for full power
   - Optional (single compositions work fine without it)

#### **Phase 2 Completion Criteria**
After Hop 2.4c-iii complete:
- ✅ All 3 sub-hops implemented and tested
- ✅ 50+ total tests across all sub-hops (15+20+15)
- ✅ 7 new signals (2+2+3) documented in SIGNAL_CONTRACTS.md
- ✅ All performance targets validated
- ✅ Full regression suite passing (Hops 2.1-2.4c)
- ✅ Template composition system feature-complete
- ✅ Ready for Phase 3 (UI & Integration)

---

### **Next Steps for Hop 2.4c**

**Immediate Action Required**:
1. **User Decision**: Confirm sub-hop split approach (2.4c-i, 2.4c-ii, 2.4c-iii)
2. **Begin Hop 2.4c-i**: Start with Conditional Rules Engine
3. **Signal-First**: Define 2 signals in EventBus BEFORE implementing ConditionalRuleEngine
4. **Follow CTS Workflow**: Step 0 → Step 1 (signal-first) → Steps 2-7

---

## **Future Hop Candidates (Phase 3+)**

### **Hop 2.5 (Future): Template Versioning & Migration**

**Note**: This is a future enhancement deferred until Phase 2 core features complete. Listed here for planning purposes only.

#### **Scope**
Implement template version management, migration tools, and backward compatibility system.

#### **Prerequisites**
- All Hop 2.4 sub-hops complete (2.4a, 2.4b, 2.4c-i, 2.4c-ii, 2.4c-iii)
- Template system fully operational and validated
- Production usage feedback collected

#### **Potential Deliverables** (Preliminary)
1. **Version Management** (~350 lines)
   - Template versioning system
   - Compatibility checking
   - Deprecation warnings
   - Version migration tools

2. **Migration System** (~300 lines)
   - Auto-migration of old templates
   - Backward compatibility layer
   - Migration validation
   - Rollback support

**Status**: Deferred to Phase 3 or later based on user needs

---

## **LEGACY SECTIONS (For Historical Reference)**

### **Hop 2.1: Template Analysis & Pattern Extraction (LEGACY - TO BE REMOVED)**

### **Scope**
**NOTE**: This section is replaced by Hops 2.1a, 2.1b, 2.1c above. Preserved for reference during transition.

#### **File Structure Extension**
```
modules/
└── scene_builder/
    ├── scripts/
    │   ├── addon_analyzer.gd
    │   ├── pattern_extractor.gd
    │   ├── template_parser.gd
    │   ├── inheritance_manager.gd
    │   └── registry_manager.gd
    ├── analyzers/
    │   ├── maaacks_analyzer.gd
    │   ├── indie_blueprint_analyzer.gd
    │   ├── ui_pattern_analyzer.gd
    │   └── scene_structure_analyzer.gd
    ├── templates/
    │   ├── base/
    │   │   ├── ui_component.json
    │   │   ├── game_scene.json
    │   │   └── system_scene.json
    │   ├── extracted/
    │   │   ├── maaacks/
    │   │   └── indie_blueprint/
    │   └── custom/
    ├── data/
    │   ├── template_schema.json
    │   ├── pattern_definitions.json
    │   ├── addon_mappings.json
    │   └── inheritance_rules.json
    ├── tests/
    │   ├── test_addon_analyzer.gd
    │   ├── test_pattern_extractor.gd
    │   └── test_template_registry.gd
    └── docs/
        ├── TEMPLATE_PATTERNS.md
        └── EXTRACTION_GUIDE.md
```

#### **Signal Contracts (Hop 2.1)**
```gdscript
# Template Analysis Signals
const TEMPLATE_ANALYSIS_SIGNALS = {
    # Analysis Process
    "analysis_started": {
        "args": ["addon_name: String", "scope: String"],
        "description": "Emitted when addon analysis begins",
        "frequency": "multiple_per_session"
    },
    "pattern_discovered": {
        "args": ["pattern_type: String", "source_addon: String", "metadata: Dictionary"],
        "description": "Emitted when reusable pattern is identified",
        "frequency": "multiple_per_session"
    },
    "template_extracted": {
        "args": ["template_name: String", "source: String", "complexity_score: float"],
        "description": "Emitted when template is successfully extracted",
        "frequency": "multiple_per_session"
    },
    "analysis_complete": {
        "args": ["addon_name: String", "stats: Dictionary"],
        "description": "Emitted when addon analysis completes",
        "frequency": "multiple_per_session"
    },
    "analysis_failed": {
        "args": ["addon_name: String", "error_code: String", "details: Dictionary"],
        "description": "Emitted when analysis encounters errors",
        "frequency": "rare"
    },
    
    # Pattern Recognition
    "ui_pattern_identified": {
        "args": ["pattern_name: String", "usage_frequency: int", "examples: Array"],
        "description": "Emitted when UI pattern is identified",
        "frequency": "multiple_per_session"
    },
    "scene_structure_analyzed": {
        "args": ["scene_path: String", "structure_metadata: Dictionary"],
        "description": "Emitted when scene structure analysis completes",
        "frequency": "high_frequency"
    },
    "best_practice_identified": {
        "args": ["practice_type: String", "source: String", "confidence: float"],
        "description": "Emitted when best practice pattern is identified",
        "frequency": "multiple_per_session"
    },
    "anti_pattern_detected": {
        "args": ["pattern_type: String", "location: String", "severity: String"],
        "description": "Emitted when problematic pattern is detected",
        "frequency": "rare"
    },
    
    # Template Management
    "template_registered": {
        "args": ["template_id: String", "version: String", "metadata: Dictionary"],
        "description": "Emitted when template is registered in system",
        "frequency": "multiple_per_session"
    },
    "template_inheritance_resolved": {
        "args": ["child_template: String", "parent_template: String", "inheritance_type: String"],
        "description": "Emitted when template inheritance is established",
        "frequency": "multiple_per_session"
    },
    "template_validation_complete": {
        "args": ["template_id: String", "validation_results: Dictionary"],
        "description": "Emitted when template validation completes",
        "frequency": "multiple_per_session"
    },
    "template_registry_updated": {
        "args": ["operation: String", "affected_templates: Array"],
        "description": "Emitted when template registry is modified",
        "frequency": "multiple_per_session"
    }
}
```

### **Implementation Steps**

#### **Step 1: MAAACKS Addon Analysis**
1. Implement `maaacks_analyzer.gd` for pattern extraction
2. Analyze menu systems, scene transitions, and UI patterns
3. Extract reusable components and configurations
4. Document MAAACKS best practices and anti-patterns

#### **Step 2: Indie Blueprint RPG Analysis**
1. Implement `indie_blueprint_analyzer.gd` for RPG framework analysis
2. Extract character system patterns and UI components
3. Analyze state machine implementations and event patterns
4. Document RPG-specific best practices

#### **Step 3: Pattern Extraction Framework**
1. Create generalized pattern recognition system
2. Implement UI component hierarchy analysis
3. Create scene structure classification system
4. Build pattern confidence scoring system

#### **Step 4: Template Inheritance System**
1. Design template inheritance relationships
2. Implement template composition and override systems
3. Create template versioning and evolution tracking
4. Build template dependency resolution

### **MAAACKS Analysis Specifications**

#### **Target MAAACKS Components**
```gdscript
# MAAACKS Components to Analyze
const MAAACKS_TARGETS = {
    "menu_systems": {
        "main_menu": "res://addons/maaacks_game_template/base/scenes/MainMenu.tscn",
        "options_menu": "res://addons/maaacks_game_template/base/scenes/OptionsMenu.tscn",
        "pause_menu": "res://addons/maaacks_game_template/base/scenes/PauseMenu.tscn"
    },
    "ui_components": {
        "audio_controls": "AudioSettingsContainer",
        "video_controls": "VideoSettingsContainer",
        "input_controls": "InputSettingsContainer"
    },
    "scene_management": {
        "scene_loader": "SceneLoader.gd",
        "transition_system": "SceneTransition.gd"
    },
    "configuration": {
        "game_settings": "GameSettings.gd",
        "audio_manager": "AudioManager.gd"
    }
}
```

#### **Indie Blueprint Analysis Specifications**
```gdscript
# Indie Blueprint Components to Analyze
const INDIE_BLUEPRINT_TARGETS = {
    "rpg_framework": {
        "character_stats": "RpgCharacterMetaStats",
        "elemental_system": "ElementalResistances",
        "state_machine": "StateMachine components",
        "global_clock": "GlobalClock system"
    },
    "ui_patterns": {
        "stat_displays": "Character stat UI patterns",
        "inventory_systems": "Inventory management UI",
        "dialogue_integration": "Dialogue system UI patterns"
    },
    "data_structures": {
        "save_system": "Save/load patterns",
        "configuration": "RPG configuration patterns"
    }
}
```

### **Template Schema Design**

#### **Base Template Schema**
```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "BD DevTools Scene Template",
  "type": "object",
  "required": ["template_id", "version", "type", "structure"],
  "properties": {
    "template_id": {
      "type": "string",
      "pattern": "^[a-z][a-z0-9_]*$",
      "description": "Unique template identifier"
    },
    "version": {
      "type": "string",
      "pattern": "^\\d+\\.\\d+\\.\\d+$",
      "description": "Semantic version"
    },
    "type": {
      "type": "string",
      "enum": ["ui_component", "game_scene", "system_scene", "composite"],
      "description": "Template category"
    },
    "inherits_from": {
      "type": "string",
      "description": "Parent template ID for inheritance"
    },
    "metadata": {
      "type": "object",
      "properties": {
        "name": { "type": "string" },
        "description": { "type": "string" },
        "author": { "type": "string" },
        "source_addon": { "type": "string" },
        "complexity_score": { "type": "number", "minimum": 0, "maximum": 10 },
        "performance_tier": { "type": "string", "enum": ["high", "medium", "low"] },
        "tags": { "type": "array", "items": { "type": "string" } }
      }
    },
    "structure": {
      "type": "object",
      "description": "Node hierarchy definition",
      "$ref": "#/definitions/node_definition"
    },
    "scripts": {
      "type": "object",
      "description": "GDScript generation rules",
      "patternProperties": {
        "^[a-zA-Z_][a-zA-Z0-9_]*$": {
          "$ref": "#/definitions/script_template"
        }
      }
    },
    "signals": {
      "type": "object",
      "description": "Signal contract definitions",
      "patternProperties": {
        "^[a-z][a-z0-9_]*$": {
          "$ref": "#/definitions/signal_definition"
        }
      }
    },
    "validation_rules": {
      "type": "array",
      "description": "CTS compliance and validation rules",
      "items": { "$ref": "#/definitions/validation_rule" }
    }
  },
  "definitions": {
    "node_definition": {
      "type": "object",
      "required": ["type"],
      "properties": {
        "type": { "type": "string" },
        "name": { "type": "string" },
        "properties": { "type": "object" },
        "script": { "type": "string" },
        "children": {
          "type": "object",
          "patternProperties": {
            "^[a-zA-Z_][a-zA-Z0-9_]*$": {
              "$ref": "#/definitions/node_definition"
            }
          }
        }
      }
    },
    "script_template": {
      "type": "object",
      "properties": {
        "base_class": { "type": "string" },
        "template_file": { "type": "string" },
        "variables": { "type": "object" },
        "methods": { "type": "array" },
        "signal_connections": { "type": "array" }
      }
    },
    "signal_definition": {
      "type": "object",
      "properties": {
        "args": { "type": "array", "items": { "type": "string" } },
        "description": { "type": "string" },
        "frequency": { "type": "string" }
      }
    },
    "validation_rule": {
      "type": "object",
      "properties": {
        "rule_type": { "type": "string" },
        "severity": { "type": "string" },
        "description": { "type": "string" },
        "check": { "type": "string" }
      }
    }
  }
}
```

### **Validation Criteria (Hop 2.1)**

#### **Analysis Validation**
- [ ] MAAACKS addon components successfully analyzed
- [ ] Indie Blueprint patterns extracted correctly
- [ ] UI component hierarchies properly identified
- [ ] Best practices documented with examples
- [ ] Anti-patterns detected and flagged

#### **Template System Validation**
- [ ] Template inheritance relationships resolve correctly
- [ ] Template registry manages versions properly
- [ ] Template validation against schema passes
- [ ] Template metadata is complete and accurate
- [ ] Template dependencies track correctly

#### **Performance Validation**
- [ ] Addon analysis background operations don't impact editor (background thread)
- [ ] Pattern extraction operations complete within 2ms per pattern
- [ ] Template registry operations complete within 2ms
- [ ] Real-time UI updates maintain 2ms pipeline compliance
- [ ] Memory usage for templates below 20MB

#### **Integration Validation**
- [ ] Analysis integrates with Phase 1 index system
- [ ] Signal contracts properly documented and tested
- [ ] EventBus receives all analysis signals
- [ ] Validation engine validates extracted templates

---

## **Hop 2.2: JSON Template System & Scene Generation**

### **Scope**
Implement the core scene generation system using JSON templates, including node instantiation, GDScript generation, and proper scene wiring with CTS compliance.

### **Deliverables**

1. **Scene Generation Engine**
   - JSON template parsing and validation
   - Dynamic node instantiation from templates
   - Property assignment and configuration
   - Scene hierarchy construction

2. **GDScript Generation System**
   - Template-driven script generation
   - Signal connection automation
   - Method stub generation
   - CTS-compliant code formatting

3. **Scene Wiring System**
   - Automatic signal connection between nodes
   - Reference resolution and path validation
   - Component integration and initialization
   - Scene lifecycle management

4. **CTS Integration**
   - Proper folder structure generation
   - Naming convention enforcement
   - Documentation generation
   - Integration with validation engine

### **Technical Implementation**

#### **File Structure Extension**
```
modules/scene_builder/
├── scripts/
│   ├── scene_generator.gd          # Main scene generation orchestrator
│   ├── node_factory.gd             # Node instantiation from JSON
│   ├── script_weaver.gd            # GDScript generation and wiring
│   ├── property_mapper.gd          # Property assignment system
│   ├── reference_resolver.gd       # Node reference resolution
│   └── cts_enforcer.gd             # CTS compliance enforcement
├── generators/
│   ├── ui_scene_generator.gd       # UI-specific scene generation
│   ├── location_scene_generator.gd # Game location scene generation
│   ├── system_scene_generator.gd   # System/utility scene generation
│   └── composite_scene_generator.gd # Multi-template composition
├── script_templates/
│   ├── base_controller.gd.template # Base scene controller template
│   ├── ui_component.gd.template    # UI component template
│   ├── game_location.gd.template   # Game location template
│   └── system_manager.gd.template  # System manager template
├── validation/
│   ├── scene_validator.gd          # Generated scene validation
│   ├── script_validator.gd         # Generated script validation
│   ├── cts_checker.gd              # CTS compliance checking
│   └── integration_tester.gd       # Integration validation
└── tests/
    ├── test_scene_generation.gd
    ├── test_script_weaving.gd
    ├── test_cts_compliance.gd
    └── integration/
        ├── test_ui_generation.gd
        ├── test_location_generation.gd
        └── test_full_workflow.gd
```

#### **Signal Contracts (Hop 2.2)**
```gdscript
# Scene Generation Signals
const SCENE_GENERATION_SIGNALS = {
    # Generation Process
    "generation_requested": {
        "args": ["template_id: String", "output_path: String", "params: Dictionary"],
        "description": "Emitted when scene generation is requested",
        "frequency": "multiple_per_session"
    },
    "template_loaded": {
        "args": ["template_id: String", "validation_status: String"],
        "description": "Emitted when template is loaded and validated",
        "frequency": "multiple_per_session"
    },
    "node_created": {
        "args": ["node_type: String", "node_name: String", "properties: Dictionary"],
        "description": "Emitted when individual node is instantiated",
        "frequency": "high_frequency"
    },
    "hierarchy_built": {
        "args": ["scene_path: String", "node_count: int", "depth: int"],
        "description": "Emitted when scene hierarchy construction completes",
        "frequency": "multiple_per_session"
    },
    
    # Script Generation
    "script_generation_started": {
        "args": ["script_path: String", "template_type: String"],
        "description": "Emitted when script generation begins",
        "frequency": "multiple_per_session"
    },
    "script_generated": {
        "args": ["script_path: String", "template: String", "line_count: int"],
        "description": "Emitted when script generation completes",
        "frequency": "multiple_per_session"
    },
    "signal_connection_created": {
        "args": ["source_node: String", "signal_name: String", "target_node: String", "method: String"],
        "description": "Emitted when signal connection is established",
        "frequency": "high_frequency"
    },
    "method_stub_generated": {
        "args": ["script_path: String", "method_name: String", "parameters: Array"],
        "description": "Emitted when method stub is generated",
        "frequency": "multiple_per_session"
    },
    
    # Validation and Completion
    "scene_wiring_complete": {
        "args": ["scene_path: String", "connection_count: int"],
        "description": "Emitted when scene wiring is completed",
        "frequency": "multiple_per_session"
    },
    "cts_validation_complete": {
        "args": ["target_path: String", "compliance_score: float", "violations: Array"],
        "description": "Emitted when CTS validation completes",
        "frequency": "multiple_per_session"
    },
    "generation_complete": {
        "args": ["scene_path: String", "generation_stats: Dictionary"],
        "description": "Emitted when scene generation fully completes",
        "frequency": "multiple_per_session"
    },
    "generation_failed": {
        "args": ["error_code: String", "details: Dictionary", "partial_output: String"],
        "description": "Emitted when scene generation fails",
        "frequency": "rare"
    },
    
    # File System Integration
    "folder_structure_created": {
        "args": ["root_path: String", "structure_type: String"],
        "description": "Emitted when CTS folder structure is created",
        "frequency": "multiple_per_session"
    },
    "files_organized": {
        "args": ["target_directory: String", "file_count: int", "organization_type: String"],
        "description": "Emitted when files are organized per CTS standards",
        "frequency": "multiple_per_session"
    }
}
```

### **Implementation Steps**

#### **Step 1: Core Scene Generation Engine**
1. Implement `scene_generator.gd` as main orchestrator
2. Create `node_factory.gd` for JSON-driven node instantiation
3. Implement property mapping and configuration system
4. Add scene hierarchy validation and construction

#### **Step 2: GDScript Generation System**
1. Implement `script_weaver.gd` for template-driven script generation
2. Create script templates for common scene types
3. Add automatic signal connection generation
4. Implement method stub generation with proper signatures

#### **Step 3: Scene Wiring and Integration**
1. Create automatic node reference resolution
2. Implement signal-to-method connection automation
3. Add component integration and initialization
4. Create scene lifecycle management system

#### **Step 4: CTS Compliance Integration**
1. Implement `cts_enforcer.gd` for folder structure generation
2. Add naming convention validation and enforcement
3. Create automatic documentation generation
4. Integrate with Phase 1 validation engine

### **Scene Generation Examples**

#### **UI Scene Template (JSON)**
```json
{
  "template_id": "broken_divinity_main_ui",
  "version": "1.0.0",
  "type": "ui_component",
  "inherits_from": "ui_base",
  "metadata": {
    "name": "Broken Divinity Main UI",
    "description": "Five-panel main game UI based on existing prototype",
    "source_addon": "broken_divinity_prototype",
    "complexity_score": 7,
    "performance_tier": "high",
    "tags": ["ui", "main", "game", "panels"]
  },
  "structure": {
    "type": "Control",
    "name": "BrokenDivinityMainUI",
    "properties": {
      "layout_mode": 3,
      "anchors_preset": 15,
      "anchor_right": 1.0,
      "anchor_bottom": 1.0
    },
    "script": "bd_main_ui_controller",
    "children": {
      "MainContainer": {
        "type": "VBoxContainer",
        "properties": {
          "layout_mode": 1,
          "anchors_preset": 15
        },
        "children": {
          "StatusPanel": {
            "type": "Panel",
            "properties": {
              "custom_minimum_size": [0, 65],
              "unique_name_in_owner": true
            },
            "children": {
              "StatusLabel": {
                "type": "RichTextLabel",
                "properties": {
                  "bbcode_enabled": true,
                  "fit_content": true
                }
              }
            }
          },
          "MiddleRow": {
            "type": "HBoxContainer",
            "children": {
              "MainPanel": {
                "type": "Panel",
                "properties": {
                  "unique_name_in_owner": true
                },
                "children": {
                  "ASCIIContainer": {
                    "type": "Control",
                    "properties": {
                      "unique_name_in_owner": true
                    }
                  }
                }
              },
              "FeedbackPanel": {
                "type": "Panel",
                "properties": {
                  "custom_minimum_size": [380, 0],
                  "unique_name_in_owner": true
                }
              }
            }
          },
          "BottomRow": {
            "type": "HBoxContainer",
            "children": {
              "ActionsPanel": {
                "type": "Panel",
                "properties": {
                  "unique_name_in_owner": true
                }
              },
              "InventoryPanel": {
                "type": "Panel",
                "properties": {
                  "unique_name_in_owner": true,
                  "custom_minimum_size": [300, 0]
                }
              }
            }
          }
        }
      }
    }
  },
  "scripts": {
    "bd_main_ui_controller": {
      "base_class": "Control",
      "template_file": "ui_component.gd.template",
      "variables": {
        "status_label": "@onready var status_label: RichTextLabel = %StatusLabel",
        "ascii_container": "@onready var ascii_container: Control = %ASCIIContainer",
        "feedback_panel": "@onready var feedback_panel: Panel = %FeedbackPanel",
        "actions_panel": "@onready var actions_panel: Panel = %ActionsPanel",
        "inventory_panel": "@onready var inventory_panel: Panel = %InventoryPanel"
      },
      "methods": [
        {
          "name": "_ready",
          "parameters": [],
          "body": "initialize_ui()\nconnect_signals()"
        },
        {
          "name": "initialize_ui",
          "parameters": [],
          "body": "# Initialize UI components\nEventBus.emit_signal(\"ui_initialized\", name)"
        },
        {
          "name": "update_status",
          "parameters": ["status_text: String"],
          "body": "status_label.text = status_text"
        }
      ],
      "signal_connections": [
        {
          "source": "EventBus",
          "signal": "player_health_changed",
          "method": "_on_player_health_changed"
        },
        {
          "source": "EventBus", 
          "signal": "game_time_updated",
          "method": "_on_game_time_updated"
        }
      ]
    }
  },
  "signals": {
    "ui_initialized": {
      "args": ["ui_name: String"],
      "description": "Emitted when UI initialization completes",
      "frequency": "once_per_session"
    },
    "panel_resized": {
      "args": ["panel_name: String", "new_size: Vector2"],
      "description": "Emitted when UI panel is resized",
      "frequency": "multiple_per_session"
    }
  },
  "validation_rules": [
    {
      "rule_type": "naming_convention",
      "severity": "error",
      "description": "Panel names must end with 'Panel'",
      "check": "node.name.ends_with('Panel') if node.type == 'Panel'"
    },
    {
      "rule_type": "unique_names",
      "severity": "warning", 
      "description": "Important UI elements should have unique_name_in_owner",
      "check": "node.unique_name_in_owner if node.name in ['StatusPanel', 'FeedbackPanel', 'ActionsPanel', 'InventoryPanel']"
    }
  ]
}
```

#### **Generated GDScript Example**
```gdscript
# Auto-generated by BD DevTools Scene Generator
# Template: broken_divinity_main_ui v1.0.0
# Generated: 2025-09-30T15:30:00Z
# DO NOT EDIT: Regenerate using template system

class_name BrokenDivinityMainUI
extends Control

# Signal contracts - auto-generated from template
signal ui_initialized(ui_name: String)
signal panel_resized(panel_name: String, new_size: Vector2)

# Node references - auto-generated from template
@onready var status_label: RichTextLabel = %StatusLabel
@onready var ascii_container: Control = %ASCIIContainer  
@onready var feedback_panel: Panel = %FeedbackPanel
@onready var actions_panel: Panel = %ActionsPanel
@onready var inventory_panel: Panel = %InventoryPanel

# Auto-generated initialization
func _ready() -> void:
    initialize_ui()
    connect_signals()

# Template-generated methods
func initialize_ui() -> void:
    # Initialize UI components
    EventBus.emit_signal("ui_initialized", name)

func update_status(status_text: String) -> void:
    status_label.text = status_text

# Auto-generated signal connections
func connect_signals() -> void:
    EventBus.connect("player_health_changed", _on_player_health_changed)
    EventBus.connect("game_time_updated", _on_game_time_updated)

# Signal handler stubs - implement in extended class or modify template
func _on_player_health_changed(new_health: int, max_health: int) -> void:
    # TODO: Implement health display update
    pass

func _on_game_time_updated(time_string: String) -> void:
    # TODO: Implement time display update
    pass

# Validation metadata for BD DevTools
const BD_DEVTOOLS_METADATA = {
    "template_id": "broken_divinity_main_ui",
    "template_version": "1.0.0",
    "generated_timestamp": "2025-09-30T15:30:00Z",
    "validation_rules": [
        "naming_convention",
        "unique_names"
    ]
}
```

### **CTS Folder Structure Generation**

#### **Auto-Generated Project Structure**
```
game_systems/ui_system/
├── scenes/
│   ├── BrokenDivinityMainUI.tscn
│   ├── StatusPanel.tscn
│   └── InventoryPanel.tscn
├── scripts/
│   ├── bd_main_ui_controller.gd
│   ├── status_panel_controller.gd
│   └── inventory_panel_controller.gd
├── data/
│   ├── ui_config.json
│   └── panel_layouts.json
├── tests/
│   ├── test_main_ui.gd
│   ├── test_status_panel.gd
│   └── test_inventory_panel.gd
└── README.md
```

### **Validation Criteria (Hop 2.2)**

#### **Generation Validation**
- [ ] JSON templates parse and validate correctly
- [ ] Node hierarchies generate with proper relationships
- [ ] Properties assign correctly to generated nodes
- [ ] Scripts generate with valid GDScript syntax
- [ ] Signal connections establish correctly

#### **CTS Compliance Validation**
- [ ] Generated folder structure follows CTS standards
- [ ] File naming conventions are enforced
- [ ] Generated documentation is complete and accurate
- [ ] Code formatting follows project standards
- [ ] Integration with validation engine is functional

#### **Performance Validation**  
- [ ] Scene generation completes within 5 seconds for complex templates
- [ ] Generated scenes load without performance issues
- [ ] Memory usage for generation process below 100MB
- [ ] No memory leaks during generation process

#### **Integration Validation**
- [ ] Generated scenes integrate with existing game systems
- [ ] Signal contracts work with EventBus system
- [ ] Generated tests pass with GUT framework
- [ ] Templates work with existing addon systems

---

## **Phase 2 Validation & Completion**

### **Phase 2 Success Metrics**

#### **Template System Metrics**
1. **Analysis Coverage**
   - MAAACKS addon patterns 100% analyzed
   - Indie Blueprint RPG patterns 100% analyzed  
   - UI component hierarchy fully documented
   - Best practices extracted and validated

2. **Template Quality**
   - Template inheritance system operational
   - Template versioning and management functional
   - Template validation against schemas passes
   - Template performance metrics within targets

3. **Generation Accuracy**
   - Generated scenes match template specifications
   - Generated scripts compile without errors
   - Signal connections work as specified
   - CTS compliance validated for all outputs

#### **Integration Metrics**
1. **Phase 1 Integration**
   - Index system catalogs all generated assets
   - Validation engine validates all generated content
   - EventBus handles all generation signals
   - Performance monitoring tracks generation metrics

2. **Addon Compatibility**
   - Generated scenes work with AsciiScreen addon
   - Dialogue Manager integration functional
   - Indie Blueprint compatibility maintained
   - GUT tests pass for all generated content

### **Phase 2 Final Validation Test Suite**

#### **End-to-End Template Workflow Test**
```gdscript
# File: tests/integration/test_phase_2_complete.gd
extends GutTest

func test_complete_template_workflow():
    # Test complete Phase 2 functionality
    var scene_builder = SceneBuilder.new()
    
    # 1. Template analysis works
    scene_builder.analyze_addon("maaacks_game_template")
    yield(scene_builder, "analysis_complete")
    assert_gt(scene_builder.get_template_count(), 0, "Should extract templates from MAAACKS")
    
    # 2. Template generation works
    var generation_result = scene_builder.generate_scene("broken_divinity_main_ui", {
        "output_path": "res://test_output/",
        "custom_properties": {}
    })
    yield(scene_builder, "generation_complete")
    assert_true(generation_result.success, "Scene generation should succeed")
    
    # 3. Generated scene is valid
    var generated_scene = load(generation_result.scene_path)
    assert_not_null(generated_scene, "Generated scene should load")
    
    # 4. Generated script is valid
    var generated_script = load(generation_result.script_path)
    assert_not_null(generated_script, "Generated script should load")
    
    # 5. CTS compliance passes
    var cts_validator = CTSValidator.new()
    var compliance_result = cts_validator.validate_directory(generation_result.output_directory)
    assert_gt(compliance_result.score, 0.9, "Should meet CTS compliance standards")
    
    # 6. Integration with Phase 1 works
    var index_manager = get_node("/root/BDDevTools/IndexManager")
    index_manager.refresh_index()
    yield(index_manager, "index_update_complete")
    var search_results = index_manager.search("BrokenDivinityMainUI")
    assert_gt(search_results.size(), 0, "Generated assets should be indexed")
```

### **Phase 2 Deliverable Checklist**

- [ ] **Template Analysis System**
  - [ ] MAAACKS addon analysis complete
  - [ ] Indie Blueprint addon analysis complete
  - [ ] Pattern extraction and documentation complete
  - [ ] Template inheritance system operational

- [ ] **Template Management**
  - [ ] Template registry functional
  - [ ] Template versioning system operational
  - [ ] Template validation against schemas
  - [ ] Template dependency tracking

- [ ] **Scene Generation Engine**
  - [ ] JSON template parsing and validation
  - [ ] Dynamic node instantiation functional
  - [ ] Property assignment system operational
  - [ ] Scene hierarchy construction working

- [ ] **GDScript Generation**
  - [ ] Template-driven script generation functional
  - [ ] Signal connection automation working
  - [ ] Method stub generation operational
  - [ ] CTS-compliant code formatting

- [ ] **CTS Integration**
  - [ ] Folder structure generation functional
  - [ ] Naming convention enforcement working
  - [ ] Documentation generation operational
  - [ ] Validation engine integration complete

- [ ] **Testing & Validation**
  - [ ] All generated content passes validation
  - [ ] Performance targets met for generation
  - [ ] Integration with Phase 1 systems verified
  - [ ] GUT test integration complete

### **Phase 2 → Phase 3 Transition Criteria**

**Prerequisites for Phase 3 Start**:
1. All Phase 2 validation tests pass
2. Template system generates valid, CTS-compliant scenes
3. Generated content integrates with existing addon ecosystem
4. Performance benchmarks met for template analysis and generation
5. Template inheritance and versioning system operational
6. Integration with Phase 1 index and validation systems verified
7. Generated scenes work correctly in Broken Divinity context
8. Documentation system auto-generates complete documentation

**Handoff Deliverables**:
1. Complete template library extracted from mature addons
2. Operational scene generation system with CTS compliance
3. Template inheritance and management system
4. Generated scene validation framework
5. GD linter integration for code quality
6. Performance benchmarks for generation processes
7. Comprehensive error recovery and rollback system

---

## **Error Recovery & Rollback Strategies**

### **Template Analysis Failures**
**Failure Scenarios**: Addon analysis crashes, pattern extraction errors, malformed addon structures
**Recovery Actions**:
1. Skip problematic addon files and continue analysis with others
2. Fall back to manual template definitions for failed extractions
3. Log detailed error reports with file paths and line numbers for manual review
4. Provide partial analysis results rather than complete failure
5. Cache last successful analysis for rollback

### **Scene Generation Failures**
**Failure Scenarios**: Invalid JSON templates, node instantiation errors, script attachment failures
**Recovery Actions**:
1. Validate JSON schema BEFORE attempting scene generation
2. Use transaction-based generation with rollback on any error
3. Generate preview mode (dry-run) to catch errors before file creation
4. Maintain generation history for rollback to last working state
5. Provide detailed error messages with fix suggestions

### **GDScript Code Generation Errors**
**Failure Scenarios**: Invalid syntax generation, signal connection errors, inheritance issues
**Recovery Actions**:
1. Run GD linter validation BEFORE writing generated files
2. Use code generation templates with proven syntax patterns
3. Maintain generated code history for comparison and rollback
4. Provide manual review mode for complex generated code
5. Fall back to minimal working template if generation fails

### **CTS Compliance Violations**
**Failure Scenarios**: Generated files in wrong locations, missing required folders, naming violations
**Recovery Actions**:
1. Pre-validate target folder structure before generation
2. Auto-create missing CTS-compliant folders
3. Provide fix suggestions for placement violations
4. Allow temporary bypass with warning for special cases
5. Integrate with Phase 1 validation engine for consistency

### **Template Versioning Conflicts**
**Failure Scenarios**: Template version mismatches, incompatible inheritance, breaking changes
**Recovery Actions**:
1. Maintain template version registry with compatibility matrix
2. Auto-migrate templates to latest compatible version
3. Preserve old template versions for backward compatibility
4. Warning system for deprecated templates with migration paths
5. Manual override option for version conflicts with explicit user approval

### **Performance Degradation**
**Failure Scenarios**: Generation exceeds time budgets, background threads block main thread
**Recovery Actions**:
1. Implement chunked generation with progress tracking
2. Add cancellation tokens for long-running operations
3. Automatic timeout with partial results return
4. Performance warning system when approaching budget limits
5. Graceful degradation to simpler generation methods when complex methods timeout

### **Concurrency & Thread Safety**
**Background Operations**: Template analysis, scene generation, code validation
**Coordination Strategy**:
- Use `call_deferred()` for all UI updates from background threads
- Implement thread-safe generation queues for multiple concurrent requests
- Mutex-protected shared state (template registry, generation history)
- Cancellation propagation for user-initiated generation cancellation
- Progress reporting through signal emissions (non-blocking)

### **State Management & Rollback**
**State Tracking**: Generation transactions, template modifications, validation states
**Rollback Triggers**:
- Any generation error that creates partial/corrupted files
- User-initiated cancellation during generation
- Validation failures after generation completes
- Performance budget violations during generation
- Template system integrity violations

**Rollback Procedure**:
1. Track all file system modifications during generation
2. Maintain pre-generation snapshots for critical operations
3. Atomic file operations (write to temp, move on success)
4. Cleanup partial generations on failure
5. Restore previous state from transaction log

---
4. GDScript generation with signal integration
5. Validation framework extended for template validation
6. Performance benchmarks for generation processes
7. Integration testing framework for generated content
8. Documentation system for templates and generated assets

This foundation ensures Phase 3 can build signal visualization and debugging tools while leveraging the template system for creating debugging interfaces and maintaining the established validation and testing standards.