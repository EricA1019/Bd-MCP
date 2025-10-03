# Hop Structure Convention Update - October 1, 2025

**Status**: Documentation Updated  
**Affected Documents**: Master Plan, Phase 1 Hops, Phase 2 Hops

---

## **What Changed**

### **New Hop Naming Convention**

**Format**: `Phase X.Y[letter]`
- **X**: Phase number (1-5)
- **Y**: Major hop within phase (1-4)
- **[letter]**: Sub-hop for CTS compliance (a, b, c, etc.)

**Before** (Old Style):
```
- Hop 1: Plugin Foundation Setup
- Hop 2: Project Index & Search
- Hop 3: Template Analysis
```

**After** (New Style):
```
- Hop 1.1: Core Infrastructure
  - Hop 1.1a: Plugin Bootstrap & EventBus
  - Hop 1.1b: Configuration & Logging
  - Hop 1.1c: Validation Engine & Tests
- Hop 1.2: File System Monitoring
  - Hop 1.2a: Basic File Monitoring
  - Hop 1.2b: Index Enhancement
  - Hop 1.2c: Performance Optimization
```

---

## **Why This Change**

### **CTS Compliance**
- **Old**: Large monolithic hops with 1000+ lines of code
- **New**: Small, testable sub-hops with <500 lines each
- **Benefit**: Always-green tests, easier to review, faster iteration

### **Regression Prevention**
- **Old**: Hops could modify previous hop code
- **New**: Sub-hops only extend, never modify previous work
- **Benefit**: Guaranteed backward compatibility

### **Logical Progression**
- **Old**: Unclear dependencies between hops
- **New**: Clear progression: a → b → c with explicit prerequisites
- **Benefit**: Reduced risk of circular dependencies

### **Signal Expert Compliance**
- **Old**: Signals added in bulk at end of hop
- **New**: Signals added incrementally per sub-hop
- **Benefit**: Better signal contract testing and documentation

---

## **Sub-Hop Structure Requirements**

Each sub-hop document must include:

1. **Scope**: One-sentence clear objective
2. **Deliverables**: Specific, testable outputs
3. **Explicit Non-Goals**: What is deferred to later sub-hops
4. **Success Criteria**: Measurable validation requirements
5. **Signal Contracts**: New signals documented
6. **Performance Targets**: Specific timing requirements
7. **Regression Prevention**: Tests ensuring previous sub-hops work

---

## **Example: Hop 1.1 Breakdown**

### **Before** (Monolithic):
```
Hop 1: Plugin Foundation Setup
- Create plugin
- Add configuration
- Add logging
- Add validation
- Add tests
(~2000 lines of code, 9 signals, hard to test incrementally)
```

### **After** (Sub-Hops):
```
Hop 1.1a: Plugin Bootstrap & EventBus Core
- Scope: Minimal plugin that loads
- Deliverables: plugin.cfg, plugin.gd, EventBus, dock
- Signals: 3 (plugin_initialized, dock_registered, module_loaded)
- Lines: ~350
- Status: ✅ COMPLETE

Hop 1.1b: Configuration & Logging Foundation
- Scope: JSON configuration and structured logging
- Deliverables: ConfigManager, Logger, schemas
- Signals: 3 (config_loaded, config_updated, config_validation_failed)
- Lines: ~650
- Status: ✅ COMPLETE

Hop 1.1c: Validation Engine & Test Templates
- Scope: CTS validation and GUT test generation
- Deliverables: ValidationEngine, test templates, UI polish
- Signals: 3 (validation_started, validation_complete, cts_violation_detected)
- Lines: ~700 (estimated)
- Status: 🚧 NEXT
```

**Benefits**:
- Each sub-hop is independently testable
- Clear progression: plugin → config → validation
- No modification of previous sub-hop code
- Signals added incrementally (3 per sub-hop = 9 total)

---

## **Regression Prevention Strategy**

### **Sub-Hop Level**
Each sub-hop must NOT:
- ❌ Modify code from previous sub-hops
- ❌ Change existing signal contracts
- ❌ Break previous tests
- ❌ Degrade previous performance

Each sub-hop must:
- ✅ Add new files only (or minimal extension of existing)
- ✅ Add new signals with full documentation
- ✅ Pass all previous sub-hop tests
- ✅ Maintain or improve performance budgets

### **Major Hop Level**
Before completing a major hop (e.g., 1.1):
- ✅ All sub-hops (a, b, c) complete
- ✅ All sub-hop tests passing
- ✅ Full regression suite passing
- ✅ Documentation updated for all sub-hops
- ✅ Performance validation complete

### **Phase Level**
Before transitioning phases:
- ✅ All major hops complete
- ✅ Complete regression suite passing
- ✅ Integration tests with all addons passing
- ✅ Performance compliance validated
- ✅ User acceptance testing complete

---

## **Updated Documentation Structure**

### **Master Plan** (`BD_DEV_SUITE_MASTER_PLAN.md`)
- ✅ Added "Hop-Based Development Convention" section
- ✅ Added "Regression Prevention Strategy" section
- ✅ Updated phase overview with hop structure
- ✅ Added explicit non-goals per sub-hop
- ✅ Documented performance budgets per sub-hop

### **Phase 1 Hops** (`BD_DEV_SUITE_PHASE_1_HOPS.md`)
- ✅ Already follows new sub-hop structure
- ✅ Hop 1.1a complete
- ✅ Hop 1.1b complete
- 🚧 Hop 1.1c in progress
- ✅ Hops 1.2, 1.3, 1.4 defined with sub-hops

### **Phase 2 Hops** (`BD_DEV_SUITE_PHASE_2_HOPS.md`)
- 🚧 Needs update to sub-hop structure
- Current: Large monolithic hops
- Target: Break down into sub-hops (a, b, c)
- Example: Hop 2.1 → 2.1a, 2.1b, 2.1c

---

## **Migration Checklist**

### **Completed**
- [x] Update master plan with hop convention
- [x] Add regression prevention requirements
- [x] Verify Phase 1 hops documentation
- [x] Implement Hop 1.1a (Plugin Bootstrap)
- [x] Implement Hop 1.1b (Configuration & Logging)
- [x] Document hop structure in master plan

### **In Progress**
- [ ] Implement Hop 1.1c (Validation Engine)
- [ ] Update Phase 2 hops document with sub-hop structure

### **Pending**
- [ ] Update Phase 3 hops when Phase 2 nears completion
- [ ] Define Phase 4 hops when Phase 3 nears completion
- [ ] Define Phase 5 hops when Phase 4 nears completion

---

## **Key Principles**

### **1. Small Hops**
**Target**: <500 lines of code per sub-hop
**Why**: Easier to review, test, and maintain
**Enforcement**: Code review process

### **2. Always-Green Tests**
**Target**: All tests pass after every sub-hop
**Why**: Prevents regression, enables continuous deployment
**Enforcement**: Automated CI/CD

### **3. No Breaking Changes**
**Target**: Previous sub-hops never broken by new sub-hops
**Why**: Guarantees backward compatibility
**Enforcement**: Regression test suite

### **4. Clear Dependencies**
**Target**: Explicit prerequisites for each sub-hop
**Why**: Prevents circular dependencies
**Enforcement**: Documentation requirements

### **5. Incremental Signals**
**Target**: 2-3 new signals per sub-hop
**Why**: Better signal contract testing
**Enforcement**: Signal Expert compliance review

---

## **Next Steps**

1. **Complete Hop 1.1c**: Validation Engine & Test Templates
2. **Update Phase 2 Hops**: Break down into sub-hop structure
3. **Implement Hop 1.2a**: Begin file system monitoring
4. **Document Lessons Learned**: Track what works/doesn't work

---

## **References**

- **Master Plan**: `docs/plans/active/BD_DEV_SUITE_MASTER_PLAN.md`
- **Phase 1 Hops**: `docs/plans/active/BD_DEV_SUITE_PHASE_1_HOPS.md`
- **Phase 2 Hops**: `docs/plans/active/BD_DEV_SUITE_PHASE_2_HOPS.md`
- **Signal Expert Guidelines**: `docs/reference/Signal Expert.prompt.md`
- **CTS Methodology**: `docs/reference/CLOSE_TO_SHORE.md`
