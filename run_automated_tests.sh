#!/usr/bin/env bash

# remember some failed commands and report on exit
error=false

show_help() {
    printf "usage: $0 [--help] [--report] [<path to package>]

Tool for running all unit and widget tests with code coverage.
(run from root of repo)

where:
    DES|UAT|des|uat
        rodar de acordo com ambiente
"
    exit 1
}

# run unit and widget tests
runTestsDES () {
  cp -- "src/test/resources/environment/des.json" "src/test/resources/environment/main.json"
}


runTestsUAT () {
  cp -- "src/test/resources/environment/uat.json" "src/test/resources/environment/main.json"
}

case $1 in
    DES|des)
        runTestsDES
        ;;
    UAT|uat)
        runTestsUAT
        ;;
esac

# Fail the build if there was an error
if [ "$error" = true ] ;
then
    # shellcheck disable=SC2242
    # shellcheck disable=SC2242
    exit -1;
fi