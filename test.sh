#!/bin/bash
# Runs different tags of testing
# beta 				-	run currently worked on tests with a beta tag 			:- 	[Tags]	beta
# qa_only			-	run currently worked on tests with the qa_only tag 		:- 	[Tags]	qa_only
# prod_only 		-	run currently worked on tests with the prod_only tag 	:- 	[Tags]	prod_only
# leave params to run all tests
if [[ $1=='beta' ]]; then
	pybot -i beta tests/
elif [[ $1=='qa_only' ]]; then
	pybot -i qa_only tests/
elif [[ $1=='prod_only' ]]; then
  pybot -i prod_only tests/
elif [[ $1=='' ]]; then
  pybot tests/
fi
