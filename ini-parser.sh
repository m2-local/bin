#!/bin/bash
# A simple ini parser for BASH
# https://gist.github.com/splaspood/1473761

# sample usage
#cfg.parser '/etc/my.ini'
#cfg.section.images

cfg.parser () {
    fixed_file=$(cat $1 | sed 's/ = /=/g')  # fix ' = ' to be '='
    IFS=$'\n' && ini=( $fixed_file )              # convert to line-array
    ini=( ${ini[*]//;*/} )                   # remove comments
    ini=( ${ini[*]/#[/\}$'\n'cfg.section.} ) # set section prefix
    ini=( ${ini[*]/%]/ \(} )                 # convert text2function (1)
    ini=( ${ini[*]/=/=\( } )                 # convert item to array
    ini=( ${ini[*]/%/ \)} )                  # close array parenthesis
    ini=( ${ini[*]/%\( \)/\(\) \{} )         # convert text2function (2)
    ini=( ${ini[*]/%\} \)/\}} )              # remove extra parenthesis
    ini[0]=''                                # remove first element
    ini[${#ini[*]} + 1]='}'                  # add the last brace
    eval "$(echo "${ini[*]}")"               # eval the result
}
