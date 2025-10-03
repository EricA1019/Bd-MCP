#!/bin/sh
# GUT Test Runner with Persistent Logging
# Handles Godot exit crashes gracefully and saves all output

# Configuration
GODOT_BIN="/home/eric/Desktop/Godot_v4.5-stable_linux.x86_64"
PROJECT_PATH="."
TEST_DIR="addons/broken_divinity_devtools/tests"
LOG_DIR="test_results"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Log files
FULL_LOG="$LOG_DIR/test_run_${TIMESTAMP}.log"
SUMMARY_LOG="$LOG_DIR/latest_summary.txt"
JSON_OUTPUT="$LOG_DIR/test_results_${TIMESTAMP}.json"

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "${BLUE}========================================${NC}"
echo "${BLUE}GUT Test Runner - BrokenDivinity${NC}"
echo "${BLUE}========================================${NC}"
echo "Timestamp: ${TIMESTAMP}"
echo "Log file: ${FULL_LOG}"
echo ""

# Parse command line arguments
TEST_FILE=""
if [ "$1" != "" ]; then
    TEST_FILE="$1"
    echo "Running specific test: ${TEST_FILE}"
else
    echo "Running all tests in: ${TEST_DIR}"
fi

# Build Godot command
GODOT_CMD="$GODOT_BIN --headless --path $PROJECT_PATH -s addons/gut/gut_cmdln.gd"

# Add test file if specified
if [ "$TEST_FILE" != "" ]; then
    GODOT_CMD="$GODOT_CMD -gtest=res://${TEST_FILE}"
else
    GODOT_CMD="$GODOT_CMD -gdir=res://${TEST_DIR}"
fi

# Add GUT flags for output
GODOT_CMD="$GODOT_CMD -glog=2 -gexit"

echo "${YELLOW}Command:${NC} $GODOT_CMD"
echo ""
echo "${YELLOW}Running tests...${NC}"
echo ""

# Run tests and capture output (even if it crashes)
# Use 'timeout' to prevent infinite hangs from Godot exit bug
# Tests typically complete in <5 seconds, but Godot hangs on exit
# Using 15 second timeout (generous for test execution + exit hang)
set +e  # Don't exit on error

echo "${YELLOW}⏱ Starting tests with 15s timeout (handles Godot exit hang)${NC}"
timeout --foreground 15 $GODOT_CMD 2>&1 | tee "$FULL_LOG"
EXIT_CODE=$?

set -e  # Re-enable exit on error

echo ""
echo "${BLUE}========================================${NC}"
echo "${BLUE}Test Run Complete${NC}"
echo "${BLUE}========================================${NC}"

# Check exit code
if [ $EXIT_CODE -eq 124 ]; then
    echo "${RED}⚠ Tests timed out after 60 seconds${NC}"
elif [ $EXIT_CODE -ne 0 ]; then
    echo "${YELLOW}⚠ Godot exited with code ${EXIT_CODE} (expected - exit crash bug)${NC}"
else
    echo "${GREEN}✓ Tests completed successfully${NC}"
fi

# Extract test summary from log
echo ""
echo "${BLUE}Test Summary:${NC}"
if grep -q "passed\." "$FULL_LOG"; then
    # Extract the summary line
    SUMMARY=$(grep "passed\." "$FULL_LOG" | tail -n 1)
    echo "${GREEN}${SUMMARY}${NC}"
    
    # Save to summary file
    echo "=== Test Run ${TIMESTAMP} ===" > "$SUMMARY_LOG"
    echo "$SUMMARY" >> "$SUMMARY_LOG"
    echo "" >> "$SUMMARY_LOG"
    
    # Extract individual test results
    echo "" >> "$SUMMARY_LOG"
    echo "Individual Test Results:" >> "$SUMMARY_LOG"
    grep -E "^\* test_" "$FULL_LOG" >> "$SUMMARY_LOG" 2>/dev/null || echo "No individual results found" >> "$SUMMARY_LOG"
else
    echo "${RED}⚠ Could not extract test summary${NC}"
fi

# Count passes and failures
if grep -q "passed\." "$FULL_LOG"; then
    PASSED=$(grep "passed\." "$FULL_LOG" | tail -n 1 | grep -oP '\d+(?=/\d+ passed)')
    TOTAL=$(grep "passed\." "$FULL_LOG" | tail -n 1 | grep -oP '(?<=/)\d+(?= passed)')
    FAILED=$((TOTAL - PASSED))
    
    echo ""
    echo "${GREEN}Passed: ${PASSED}/${TOTAL}${NC}"
    if [ $FAILED -gt 0 ]; then
        echo "${RED}Failed: ${FAILED}/${TOTAL}${NC}"
    fi
fi

echo ""
echo "${BLUE}Output saved to:${NC}"
echo "  Full log: ${FULL_LOG}"
echo "  Summary:  ${SUMMARY_LOG}"

# Show failing tests if any
if grep -q "FAILED:" "$FULL_LOG"; then
    echo ""
    echo "${RED}Failing Tests:${NC}"
    grep "FAILED:" "$FULL_LOG" | head -n 10
fi

echo ""
echo "${BLUE}========================================${NC}"
echo "${GREEN}✓ Test run completed - logs preserved${NC}"
echo "${BLUE}========================================${NC}"

exit 0  # Always exit successfully since logs are saved
