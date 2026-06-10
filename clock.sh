#!/usr/bin/env bash

NOW=$(date)
TIME=$(date +"%H:%M:%S")
DATE=$(date +"%A, %d %B %Y")
TZ_NAME=$(date +%Z)
WEEK=$(date +%V)
DOY=$(date +%j)
SEC=$(date +%-S)
YEAR=$(date +%Y)
MONTH=$(date +%-m)
DAY=$(date +%-d)

MNAMES=("" "January" "February" "March" "April" "May" "June"
  "July" "August" "September" "October" "November" "December")

echo ""
echo "  ┌─────────────────────────────────┐"
printf "  │        \033[1;32m%s\033[0m               │\n" "$TIME"
echo "  │"
printf "  │  Date   \033[0;32m%s\033[0m\n" "$DATE"
printf "  │  Zone   \033[0;32m%s\033[0m\n" "$TZ_NAME"
printf "  │  Week   \033[0;32mW%s\033[0m\n" "$WEEK"
printf "  │  Day    \033[0;32m%s / 365\033[0m\n" "$DOY"
echo "  └─────────────────────────────────┘"
echo ""

# Calendar
echo "  ${MNAMES[$MONTH]} $YEAR"
echo ""
echo "  Mo  Tu  We  Th  Fr  Sa  Su"
echo "  ───────────────────────────"

# Day of week for 1st (Mon=1..Sun=7)
fdow=$(date -d "$YEAR-$(printf '%02d' $MONTH)-01" +%u)

days_in_month() {
  case $1 in
  1 | 3 | 5 | 7 | 8 | 10 | 12) echo 31 ;;
  4 | 6 | 9 | 11) echo 30 ;;
  2) [[ $((YEAR % 4)) -eq 0 && ($((YEAR % 100)) -ne 0 || $((YEAR % 400)) -eq 0) ]] && echo 29 || echo 28 ;;
  esac
}

dim=$(days_in_month $MONTH)

# Build the row
cur_col=$((fdow - 1))
line="  "
for ((i = 0; i < cur_col; i++)); do line+="    "; done

for ((d = 1; d <= dim; d++)); do
  if [[ $d -eq $DAY ]]; then
    line+="\033[7;32m$(printf '%2d' $d)\033[0m  "
  elif ((cur_col >= 5)); then
    line+="\033[0;36m$(printf '%2d' $d)\033[0m  "
  else
    line+="\033[0;32m$(printf '%2d' $d)\033[0m  "
  fi
  ((cur_col++))
  if ((cur_col >= 7)); then
    echo -e "$line"
    line="  "
    cur_col=0
  fi
done
[[ $line != "  " ]] && echo -e "$line"

echo ""
