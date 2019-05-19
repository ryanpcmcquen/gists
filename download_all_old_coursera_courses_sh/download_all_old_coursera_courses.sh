#!/bin/sh

USERNAME=""
PASSWORD=""

for C in `cat ./all_coursera_old_courses.txt`; do
  coursera-dl -u "${USERNAME}" -p "${PASSWORD}" $C
done
