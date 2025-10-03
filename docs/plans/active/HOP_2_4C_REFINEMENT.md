# Hop 2.4c Refinement - CTS Compliance Update

**Date**: October 3, 2025  
**Status**: ✅ Planning Complete - Ready for Implementation  
**Compliance**: Signal Expert CTS Aligned

---

## Summary

Hop 2.4c has been refined from a single monolithic hop into 3 CTS-compliant sub-hops following the successful pattern established in Hops 1.1 (1.1a/b/c) and validated through Hops 2.4a/b.

---

## Original Scope (Rejected for CTS Violations)

**Original Hop 2.4c**: Advanced Composition Features
- **Total Scope**: ~750 lines across 3 unrelated systems
- **Systems**: Conditional Rules + Macros + Batch Generation
- **Signals**: 7+ signals (undefined)
- **Performance Targets**: None specified
- **Tests**: Generic criteria only

**CTS Violations Identified**:
- ❌ Total scope >750 lines (violates CTS limit)
- ❌ 3 unrelated systems (violates single-focus guideline)
- ❌ 7+ signals in one hop (exceeds 2-3 guideline)
- ❌ No signal contracts defined (violates signal-first)
- ❌ No performance targets (violates upfront validation)
- ❌ Mixed concerns (selection + parameterization + workflow)

**Decision**: Following Signal Expert protocol, **paused implementation** and requested user clarification before proceeding.

---

## Refined Scope (CTS Compliant)

### **Hop 2.4c-i: Conditional Rules Engine** 🎯 RECOMMENDED FIRST

**Scope**: Context-aware template selection based on configurable rule evaluation

**Size Estimate**:
- ConditionalRuleEngine: ~300 lines
- Rule schemas: ~50 lines JSON
- Tests: ~350 lines (15+ tests)
- Documentation: ~200 lines
- **Total**: ~900 lines (split across files, each <500)

**Signals** (2):
1. `rule_evaluated(rule_id, context, result, execution_time_ms)`
2. `context_selected(template_id, context_data, rule_chain)`

**Performance Targets**:
- <5ms for 10 rules
- <100ms for 100 rules
- <2ms for simple single-rule evaluation

**Tests**: 15+ comprehensive tests
- Rule evaluation (5 tests)
- Context matching (3 tests)
- Integration (3 tests)
- Performance (2 tests)
- Signal contracts (2 tests)

**Non-Goals** (Deferred):
- ❌ Macro expansion → Hop 2.4c-ii
- ❌ Variable substitution → Hop 2.4c-ii
- ❌ Batch processing → Hop 2.4c-iii

**CTS Compliance**:
- ✅ <500 lines per file
- ✅ <750 total lines (excluding tests/docs)
- ✅ Single focused system
- ✅ 2 signals (within 2-3 guideline)
- ✅ Performance targets defined
- ✅ Signal contracts documented upfront

---

### **Hop 2.4c-ii: Macro & Variable System** 🔮 FUTURE

**Scope**: Template parameterization with macro expansion and variable substitution

**Size Estimate**:
- MacroProcessor: ~150 lines
- VariableResolver: ~100 lines
- Tests: ~400 lines (20+ tests)
- Documentation: ~250 lines
- **Total**: ~900 lines (split across files, each <500)

**Signals** (2):
1. `macro_expanded(macro_id, expanded_content, variables_used)`
2. `variables_substituted(template_id, variable_map, substitution_count)`

**Performance Targets**:
- <10ms macro expansion
- <5ms variable substitution (50 vars)
- <20ms combined processing

**Tests**: 20+ comprehensive tests
- Macro expansion (8 tests)
- Variable substitution (6 tests)
- Integration (4 tests)
- Performance (2 tests)

**Non-Goals** (Deferred):
- ❌ Conditional rules → Completed in Hop 2.4c-i
- ❌ Batch processing → Hop 2.4c-iii
- ❌ Advanced macro features (loops, conditionals)

**CTS Compliance**:
- ✅ <500 lines per file (150, 100)
- ✅ <750 total lines (excluding tests/docs)
- ✅ Single focused system (parameterization)
- ✅ 2 signals (within guideline)
- ✅ Performance targets defined
- ✅ Signal contracts documented upfront

---

### **Hop 2.4c-iii: Batch Generation Workflow** 🚀 FUTURE

**Scope**: Multi-composition workflow orchestration with batch processing

**Size Estimate**:
- BatchCompositionManager: ~250 lines
- Tests: ~350 lines (15+ tests)
- Documentation: ~220 lines
- **Total**: ~820 lines (split across files, each <500)

**Signals** (3):
1. `batch_started(batch_id, composition_count, estimated_time_ms)`
2. `batch_progress(batch_id, completed, total, current_template)`
3. `batch_complete(batch_id, success_count, failure_count, total_time_ms)`

**Performance Targets**:
- <200ms for 10 compositions
- <1000ms for 50 compositions
- <20ms per composition average

**Tests**: 15+ comprehensive tests
- Batch workflow (5 tests)
- Progress tracking (3 tests)
- Error recovery (4 tests)
- Performance (3 tests)

**Non-Goals** (Deferred):
- ❌ Conditional rules → Completed in Hop 2.4c-i
- ❌ Macros/variables → Completed in Hop 2.4c-ii
- ❌ Advanced batch scheduling
- ❌ Distributed processing

**CTS Compliance**:
- ✅ <500 lines per file (250)
- ✅ <750 total lines (excluding tests/docs)
- ✅ Single focused system (workflow orchestration)
- ✅ 3 signals (acceptable for workflow tracking)
- ✅ Performance targets defined
- ✅ Signal contracts documented upfront

---

## Comparison: Original vs Refined

| Aspect | Original Hop 2.4c | Refined (3 Sub-Hops) |
|--------|-------------------|----------------------|
| **Total Lines** | ~750 (monolithic) | ~250-300 each (split) |
| **Systems** | 3 unrelated | 1 per sub-hop |
| **Signals** | 7+ (undefined) | 2-3 per sub-hop (7 total) |
| **Signal Contracts** | ❌ None | ✅ All defined upfront |
| **Performance Targets** | ❌ None | ✅ All specified |
| **File Size** | ❌ Would exceed 500 | ✅ All <500 lines |
| **Focus** | ❌ Mixed concerns | ✅ Single purpose each |
| **Tests** | ❌ Generic | ✅ 50+ specific tests |
| **CTS Compliance** | ❌ Multiple violations | ✅ Fully compliant |

---

## Implementation Strategy

### **Recommended Order**

1. **Hop 2.4c-i First** (Conditional Rules)
   - **Why**: Foundation for context-aware template selection
   - **Dependencies**: None (builds on Hop 2.4b)
   - **Standalone Value**: Can ship independently
   - **Estimated Time**: 1-2 development cycles

2. **Hop 2.4c-ii Second** (Macros & Variables)
   - **Why**: Builds on conditional rules for dynamic templates
   - **Dependencies**: Benefits from 2.4c-i but not required
   - **Standalone Value**: Enables template parameterization
   - **Estimated Time**: 1-2 development cycles

3. **Hop 2.4c-iii Last** (Batch Generation)
   - **Why**: Orchestrates all previous features
   - **Dependencies**: Works best with both 2.4c-i and 2.4c-ii
   - **Standalone Value**: Optional (single compositions work fine)
   - **Estimated Time**: 1 development cycle

### **Signal-First Workflow**

Each sub-hop follows this pattern:

**Step 0: Scope Analysis** (Already done ✅)
- Analyzed original Hop 2.4c
- Identified CTS violations
- Created sub-hop refinement plan
- Documented decision in this file

**Step 1: Signal-First Definition** (Before implementation)
1. Define signals in EventBus FIRST
2. Document contracts in SIGNAL_CONTRACTS.md
3. Update version (v0.11.0-alpha, v0.12.0-alpha, v0.13.0-alpha)
4. Create failing tests for signal emissions

**Step 2: Implementation**
1. Implement modules that emit pre-defined signals
2. Follow performance targets
3. Keep files <500 lines
4. Iterate to green (all tests pass)

**Step 3: Validation**
1. Run comprehensive test suite
2. Validate performance targets
3. Check regression (all previous tests pass)
4. Create completion documentation

---

## Signal Allocation

### **Hop 2.4c-i Signals** (2)
```gdscript
signal rule_evaluated(rule_id: String, context: Dictionary, result: bool, execution_time_ms: float)
signal context_selected(template_id: String, context_data: Dictionary, rule_chain: Array)
```
**Version**: v0.11.0-alpha (52 total signals)

### **Hop 2.4c-ii Signals** (2)
```gdscript
signal macro_expanded(macro_id: String, expanded_content: Dictionary, variables_used: Array)
signal variables_substituted(template_id: String, variable_map: Dictionary, substitution_count: int)
```
**Version**: v0.12.0-alpha (54 total signals)

### **Hop 2.4c-iii Signals** (3)
```gdscript
signal batch_started(batch_id: String, composition_count: int, estimated_time_ms: float)
signal batch_progress(batch_id: String, completed: int, total: int, current_template: String)
signal batch_complete(batch_id: String, success_count: int, failure_count: int, total_time_ms: float)
```
**Version**: v0.13.0-alpha (57 total signals)

---

## Success Patterns Applied

This refinement follows the **successful pattern** from:

### **Hop 1.1 Split** (Precedent)
- Original: Plugin + Config + Logging + Validation (~2000 lines)
- Split into: 1.1a, 1.1b, 1.1c
- Result: ✅ All sub-hops complete, CTS compliant

### **Hop 2.4a/b Success** (Validation)
- **2.4a**: Single system (348 lines), 2 signals → ✅ No split needed
- **2.4b**: Two related systems (704 lines), 2 signals → ✅ No split needed
- Pattern: CTS analysis before implementation prevents issues

### **This Refinement**
- Analyzed scope BEFORE implementation
- Identified CTS violations early
- Proposed sub-hop split
- Followed Signal Expert protocol (ask before proceeding)
- Result: ✅ Ready for compliant implementation

---

## Files Modified

**Updated**:
- `docs/plans/active/BD_DEV_SUITE_PHASE_2_HOPS.md` (Hop 2.4c section completely rewritten)

**Created**:
- `docs/plans/active/HOP_2_4C_REFINEMENT.md` (This document)

**To Be Created** (per sub-hop):
- `docs/plans/active/HOP_2_4C_I_COMPLETE.md` (after 2.4c-i)
- `docs/plans/active/HOP_2_4C_II_COMPLETE.md` (after 2.4c-ii)
- `docs/plans/active/HOP_2_4C_III_COMPLETE.md` (after 2.4c-iii)

---

## Next Actions

### **Immediate** (Awaiting User Confirmation)
1. ✅ Analyze Hop 2.4c scope (DONE)
2. ✅ Identify CTS violations (DONE)
3. ✅ Create sub-hop refinement plan (DONE)
4. ✅ Update planning document (DONE)
5. ⏳ **Wait for user decision** on sub-hop approach
6. ⏳ User confirms to proceed with Hop 2.4c-i

### **After User Confirmation**
1. Begin Hop 2.4c-i implementation
2. Follow Step 1 (Signal-First):
   - Add 2 signals to EventBus
   - Document in SIGNAL_CONTRACTS.md v0.11.0-alpha
3. Follow Steps 2-7 (Implementation → Completion)
4. Create HOP_2_4C_I_COMPLETE.md

---

## CTS Compliance Checklist

### **Scope Analysis** ✅
- [x] Read hop definition from planning document
- [x] Analyze scope using CTS decision criteria
- [x] Identified violations (>750 lines, 3 systems, 7+ signals)
- [x] Proposed sub-hop split (2.4c-i, 2.4c-ii, 2.4c-iii)
- [x] Documented decision and rationale

### **Sub-Hop Planning** ✅
- [x] Each sub-hop <500 lines per file
- [x] Each sub-hop <750 total lines
- [x] Single focused system per sub-hop
- [x] 2-3 signals per sub-hop
- [x] Performance targets defined
- [x] Signal contracts specified
- [x] Explicit non-goals documented
- [x] Test coverage planned (50+ total)

### **Signal-First Preparation** ✅
- [x] All signals defined before implementation
- [x] Signal contracts documented upfront
- [x] Signal allocation balanced (2, 2, 3)
- [x] Version progression planned (v0.11, v0.12, v0.13)

### **Documentation** ✅
- [x] Refinement rationale documented
- [x] Sub-hop structure defined
- [x] Implementation order recommended
- [x] Success patterns referenced
- [x] Files modified tracked

---

## Lessons Learned

### **From This Analysis**
1. ✅ **CTS scope analysis BEFORE implementation saves time**
   - Caught violations before any code written
   - Prevented wasted effort on wrong approach
   - Enabled proper planning upfront

2. ✅ **Signal Expert protocol works**
   - Paused when scope violated CTS
   - Asked for clarification
   - Proposed refinement with rationale
   - Waited for user decision

3. ✅ **Sub-hop pattern is reliable**
   - Hop 1.1 split succeeded
   - Hop 2.4a/b validated pattern
   - Hop 2.4c refinement follows same approach
   - Pattern now documented in CTS

4. ✅ **Signal-first prevents coupling**
   - Defining signals upfront clarifies interfaces
   - Enables parallel development (if needed)
   - Documents system boundaries
   - Prevents architectural drift

---

## References

- **Updated CTS**: `docs/reference/CLOSE_TO_SHORE(CTS).md` (October 3, 2025)
- **Signal Expert**: `docs/reference/Signal Expert.prompt.md`
- **Phase 2 Hops**: `docs/plans/active/BD_DEV_SUITE_PHASE_2_HOPS.md`
- **Hop 2.4a Complete**: `docs/plans/active/HOP_2_4A_COMPLETE.md`
- **Hop 2.4b Complete**: `docs/plans/active/HOP_2_4B_COMPLETE.md`
- **CTS Refinement**: `docs/plans/active/CTS_SUB_HOP_REFINEMENT.md`

---

## Sign-Off

**Scope Analysis**: ✅ Complete  
**CTS Violations**: ✅ Identified  
**Sub-Hop Refinement**: ✅ Planned  
**Signal Contracts**: ✅ Defined  
**Performance Targets**: ✅ Specified  
**Documentation**: ✅ Complete  
**Ready for Implementation**: ✅ Awaiting User Confirmation

**Recommended Next Step**: User confirms approach, then begin Hop 2.4c-i (Conditional Rules Engine) with signal-first implementation.

---

*This refinement demonstrates proper application of Signal Expert CTS methodology: analyze scope, identify violations, pause for clarification, propose compliant solution, wait for user decision.*
