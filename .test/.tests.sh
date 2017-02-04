#! /bin/bash

test -e ssshtest || wget -q https://raw.githubusercontent.com/ryanlayer/ssshtest/master/ssshtest
source ssshtest

set -o nounset

STOP_ON_FAIL=1

answerfile='../answers.yml'
if [[ ! -f $answerfile ]]; then
    echo "Missing 'answers.yml' file. Exiting."
    exit 1
fi

answers=('North_Dakota' 4 438 250 57
         20 'LOC100288142' 25 3325 'chr9')

for answer_num in $(seq 1 10); do
    truth=${answers[$(($answer_num - 1))]}
    run "answer-$answer_num" true
    assert_equal $truth $(grep "answer-$answer_num:" $answerfile | cut -f2 -d' ')
done

