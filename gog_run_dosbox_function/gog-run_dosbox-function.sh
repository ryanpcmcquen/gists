run_dosbox() {
  local conf_1="${1}"
  local conf_2="${2}"
  if [ -z `which dosbox` ]; then
    ./dosbox/dosbox -conf "${conf_1}" -conf "${conf_2}"  -no-console -c exit 
  else
    dosbox -conf "${conf_1}" -conf "${conf_2}"  -no-console -c exit 
  fi
}