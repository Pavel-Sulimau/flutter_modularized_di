#!/bin/sh

# Default values
MIN_CODE_COVERAGE_FILE_PATH="$MELOS_PACKAGE_PATH/test/min_code_coverage.melos"
TAGS=""
EXCLUDE_TAGS=""
EXCLUDE_COVERAGE="**/*.g.dart"

# Parse named arguments
while [ "$1" != "" ]; do
  case $1 in
    --tags )                shift
                            TAGS=$1
                            ;;
    --exclude-tags )        shift
                            EXCLUDE_TAGS=$1
                            ;;
    --exclude-coverage )    shift
                            EXCLUDE_COVERAGE=$1
                            ;;
    * )                     echo "Invalid argument: $1"
                            exit 1
  esac
  shift
done

if [ -f "$MIN_CODE_COVERAGE_FILE_PATH" ]; then
  MIN_CODE_COVERAGE=$(cat "$MIN_CODE_COVERAGE_FILE_PATH")
else
  MIN_CODE_COVERAGE=0
fi

echo "Min required code coverage for '$MELOS_PACKAGE_NAME' is $MIN_CODE_COVERAGE%"

# Construct the command with optional args
COMMAND="very_good test --coverage --no-optimization --exclude-coverage $EXCLUDE_COVERAGE --min-coverage $MIN_CODE_COVERAGE"

if [ -n "$TAGS" ]; then
  COMMAND="$COMMAND --tags $TAGS"
fi

if [ -n "$EXCLUDE_TAGS" ]; then
  COMMAND="$COMMAND --exclude-tags $EXCLUDE_TAGS"
fi

# Execute the command
eval $COMMAND
