#!/bin/bash
# Runs different tags of testing
if [[ $1=='beta' ]]; then
	pybot -i beta tests/
elif [[ $1=='qa_only' ]]; then
	pybot -i qa_only tests/
elif [[ $1=='prod_only' ]]; then
  pybot -i prod_only tests/
elif [[ $1=='' ]]; then
  pybot tests/
fi
