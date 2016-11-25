#!/bin/bash
function file_count() {
  NUM_FILES=$(ls | wc -w)
  echo "There are ${NUM_FILES} files in $(pwd)"
  return 0
}

file_count
