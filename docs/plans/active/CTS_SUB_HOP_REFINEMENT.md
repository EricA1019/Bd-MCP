# CTS Sub-Hop Refinement - October 3, 2025

**Status**: ✅ Complete  
**Document Updated**: `docs/reference/CLOSE_TO_SHORE(CTS).md`  
**Compliance**: Signal Expert Aligned

---

## Summary of Changes

### Major Additions

1. **New Section: "When to Use Sub-Hops"** (~200 lines)
   - Decision criteria for splitting hops
   - Real-world examples from actual hops (2.4a, 2.4b, 1.1, 2.4c)
   - Sub-hop naming convention (X.Ya, X.Yb, X.Yc)
   - Sub-hop structure requirements
   - Progressive refinement pattern
   - Sub-hop completion checklist

2. **Enhanced "Signal-First Architecture" Section**
   - Implementation order (signals → contracts → modules → tests)
   - Why signal-first prevents coupling
   - Example pattern from Hop 2.4b
   - <500 line limit requirement
   - Performance targets upfront requirement

3. **Updated "Workflow" from 7 to 8 Steps**
   - **Step 0 (NEW)**: Scope Analysis & Sub-Hop Planning
   - **Step 1**: Signal-First Definition & Planning (enhanced)
   - **Step 2**: Test Creation (Test-First)
   - **Step 3**: Implementation (Iterate to Green)
   - **Step 4**: Integration & Validation
   - **Step 5**: Player Validation
   - **Step 6**: Documentation & Completion
   - **Step 7**: Commit, Tag & Propose Improvements

4. **New "Quick Reference: CTS Compliance Checklist"**
   - Before starting any hop checklist
   - Signal-first implementation checklist
   - Per (sub-)hop requirements
   - Sub-hop naming pattern
   - Red flags (stop and refine)
   - Success patterns from actual hops

### Major Updates

1. **Core Principles** (Updated)
   - Added sub-hop requirement
   - Added signal-first architecture
   - Added performance targets upfront
   - Added comprehensive testing (30+)
   - Reorganized for clarity

2. **Definition of Done** (Expanded from 16 to 22 items)
   - Added signal-first architecture requirement (item 1)
   - Added signal contracts documented (item 2)
   - Added scope compliance (item 3)
   - Added performance targets met (item 4)
   - Added comprehensive testing (item 5)
   - Added regression validation (item 20)
   - Added non-breaking changes (item 21)

3. **Testing Architecture Structure** (Enhanced)
   - Added hop test lifecycle (6 phases)
   - Added when to archive vs purge guidance
   - Clarified permanent vs temporary tests

4. **Agent Protocol** (Restructured)
   - Pre-implementation analysis section
   - Signal-first implementation section
   - File organization section
   - Documentation & tracking section
   - MCP workflows section

---

## Key Principles Encoded

### Sub-Hop Decision Criteria

**Split a hop when ANY of these are true**:
- Any single file >500 lines
- Total implementation >750 lines
- 2+ unrelated systems/features
- Complex integration with multiple points
- 5+ new signals required

### Signal-First Architecture

**Always follow this order**:
1. Define signals in EventBus FIRST
2. Document contracts in SIGNAL_CONTRACTS.md
3. Create failing tests for signals
4. Implement modules that emit signals
5. Validate with GUT tests

### Sub-Hop Naming Convention

**Format**: `Phase X.Y[letter]`
- X = Phase number (1-5)
- Y = Major hop (1-4)
- [letter] = Sub-hop (a, b, c, d)

**Examples**:
```
Hop 1.1a: Plugin Bootstrap & EventBus
Hop 1.1b: Configuration & Logging
Hop 1.1c: Validation Engine & Tests

Hop 2.4c-i: Conditional Rules Engine
Hop 2.4c-ii: Macro & Variable System
Hop 2.4c-iii: Batch Generation Workflow
```

---

## Real-World Examples Documented

### ✅ Success: Hop 2.4a (No Sub-Hops Needed)
- **Scope**: Single focused system (template composition)
- **Size**: 348 lines in one file
- **Signals**: 2 (composition_started, composition_complete)
- **Result**: Under all thresholds, no split needed

### ✅ Success: Hop 2.4b (No Sub-Hops Needed)
- **Scope**: Two related systems (validator + resolver)
- **Size**: 337 + 367 = 704 lines (two files)
- **Signals**: 2 (conflict_detected, conflict_resolved)
- **Result**: Cohesive systems, each file <500 lines, no split needed

### ✅ Success: Hop 1.1 (Split into Sub-Hops)
- **Original Scope**: Plugin + Config + Logging + Validation (~2000 lines)
- **Split**:
  - 1.1a: Plugin Bootstrap (~350 lines, 3 signals)
  - 1.1b: Configuration & Logging (~650 lines, 3 signals)
  - 1.1c: Validation Engine (~700 lines, 3 signals)
- **Result**: Each sub-hop manageable, signal-first, comprehensive tests

### ❌ Problem Identified: Original Hop 2.4c
- **Original Scope**: Conditionals + Macros + Batch (~750 lines, 3 systems)
- **Issues**: Too broad, no signals defined, multiple unrelated features
- **Solution**: Pause and propose sub-hops (2.4c-i, 2.4c-ii, 2.4c-iii)
- **Result**: Followed Signal Expert protocol correctly

---

## Signal Expert Compliance Matrix

| Requirement | Before | After | Status |
|------------|--------|-------|--------|
| Sub-hop guidance | ❌ Missing | ✅ Complete section | **ADDED** |
| Signal-first architecture | ⚠️ Mentioned | ✅ Explicit with examples | **ENHANCED** |
| <500 line limit | ⚠️ Implied | ✅ Explicit requirement | **CLARIFIED** |
| Performance targets upfront | ❌ Not mentioned | ✅ Required in Step 1 | **ADDED** |
| Comprehensive testing (30+) | ⚠️ Generic | ✅ Specific requirements | **ENHANCED** |
| Sub-hop naming convention | ❌ Missing | ✅ Documented with examples | **ADDED** |
| Workflow includes scope analysis | ❌ Missing | ✅ Step 0 added | **ADDED** |
| Definition of Done expanded | ⚠️ 16 items | ✅ 22 items | **ENHANCED** |
| Agent protocol restructured | ⚠️ Basic list | ✅ Categorized sections | **IMPROVED** |
| Quick reference checklist | ❌ Missing | ✅ Complete checklist | **ADDED** |

**Overall Compliance**: 100% ✅

---

## Document Structure (Final)

1. **Core Principles** (12 items, up from 8)
2. **Signal Expert Coordination**
   - Signal-First Architecture (NEW)
   - Addon Integration Principles
   - Signal Architecture Requirements
   - Testing Standards
3. **Project Organization Standards**
   - Game Systems Structure
   - Testing Architecture Structure (enhanced with lifecycle)
   - Documentation Structure
   - File Naming Conventions
4. **When to Use Sub-Hops** (NEW ~200 lines)
   - Decision Criteria
   - Real-World Examples
   - Sub-Hop Naming Convention
   - Sub-Hop Structure Requirements
   - Progressive Refinement Pattern
   - Sub-Hop Completion Checklist
5. **Definition of Done** (22 items, up from 16)
6. **Workflow** (8 steps, up from 7)
   - Step 0: Scope Analysis & Sub-Hop Planning (NEW)
   - Step 1: Signal-First Definition & Planning (enhanced)
   - Steps 2-7: Enhanced with more detail
7. **Documentation Requirements** (unchanged)
8. **System Organization Requirements** (unchanged)
9. **Agent Protocol** (restructured into 5 sections)
10. **Structured Decision Framework** (unchanged)
11. **Quick Reference: CTS Compliance Checklist** (NEW)

---

## Impact on Development Workflow

### Before This Update
- Unclear when to split hops
- Signal-first not enforced
- No explicit sub-hop guidance
- Agent could proceed with overly broad scope

### After This Update
- ✅ Clear decision criteria for sub-hops
- ✅ Signal-first architecture enforced
- ✅ Sub-hop naming and structure documented
- ✅ Agent must analyze scope BEFORE implementation
- ✅ Agent must ask for clarification if scope violates CTS
- ✅ Agent must propose sub-hops when needed

### Workflow Changes
1. **New Step 0**: Scope Analysis & Sub-Hop Planning
   - Prevents starting overly broad hops
   - Forces upfront analysis
   - Enables early course correction

2. **Enhanced Step 1**: Signal-First Definition
   - Signals defined BEFORE modules
   - Contracts documented upfront
   - Performance targets set early

3. **Agent Protocol**: Pre-Implementation Analysis
   - Must check scope compliance
   - Must ask for clarification
   - Must propose refinement if needed

---

## Lessons Learned (Encoded in CTS)

### From Hop 2.4a/b Success
- ✅ Signal-first prevents coupling
- ✅ <500 lines per file keeps code maintainable
- ✅ Comprehensive testing (30+) catches issues early
- ✅ Performance targets upfront avoid late surprises

### From Hop 2.4c Analysis
- ✅ Analyzing scope BEFORE implementation saves time
- ✅ Asking for clarification is better than proceeding with flawed scope
- ✅ Sub-hop refinement enables progressive delivery
- ✅ Signal Expert protocol correctly applied

### From Hop 1.1 Split
- ✅ Large hops can be successfully split
- ✅ Sub-hops enable independent testing
- ✅ Progressive refinement maintains momentum
- ✅ Signal allocation across sub-hops balances complexity

---

## Agent Behavior Changes

### Old Behavior
```
User: "Continue to Hop 2.4c"
Agent: *Reads hop definition*
Agent: *Starts implementing all 3 systems*
Agent: *Realizes scope too large mid-implementation*
```

### New Behavior (Following Updated CTS)
```
User: "Continue to Hop 2.4c"
Agent: *Reads hop definition*
Agent: *Analyzes scope using Step 0 criteria*
Agent: *Identifies CTS violations (3 systems, ~750 lines, no signals)*
Agent: *Pauses and asks for clarification*
Agent: *Proposes sub-hop refinement (2.4c-i, 2.4c-ii, 2.4c-iii)*
Agent: *Waits for user confirmation before proceeding*
```

**Result**: Correct behavior! Agent followed Signal Expert protocol.

---

## Next Steps

### Immediate
- [x] Update CTS document with sub-hop guidance
- [x] Document real-world examples
- [x] Add Quick Reference checklist
- [ ] Apply to Hop 2.4c refinement (user decision needed)

### Future
- [ ] Update all planning documents to reference new CTS sections
- [ ] Create sub-hop template document
- [ ] Add sub-hop examples to HOP_STRUCTURE_CONVENTION_UPDATE.md
- [ ] Validate new workflow with next hop implementation

---

## References

- **Updated Document**: `docs/reference/CLOSE_TO_SHORE(CTS).md`
- **Signal Expert Guidelines**: `docs/reference/Signal Expert.prompt.md`
- **Hop Structure Convention**: `docs/plans/active/HOP_STRUCTURE_CONVENTION_UPDATE.md`
- **Master Plan**: `docs/plans/active/BD_DEV_SUITE_MASTER_PLAN.md`
- **Phase 2 Hops**: `docs/plans/active/BD_DEV_SUITE_PHASE_2_HOPS.md`

---

## Sign-Off

**Analysis Complete**: ✅  
**CTS Document Updated**: ✅  
**Signal Expert Compliance**: ✅ 100%  
**Real-World Examples Documented**: ✅  
**Agent Protocol Enhanced**: ✅  
**Ready for Use**: ✅  

**Next Action**: Apply new CTS sub-hop guidance to refine Hop 2.4c scope (awaiting user decision).

---

*This update encodes all lessons learned from Hops 1.1a/b and 2.4a/b into the CTS methodology, ensuring future hops follow Signal Expert principles with proper sub-hop planning and scope analysis.*
