#!/bin/bash

month="$1"
day="$2" 
year="$3"
var1=$((year % 4))
var2=$((year % 100))
var3=$((year % 400))

if [ $# -eq 3 ]; then
  case $month in
    jan | january | 1) month="Jan" ;;
    feb | febuary | 2) month="Feb" ;;
    mar | march | 3) month="Mar" ;;
    apr | april | 4) month="Apr" ;;
    may | 5) month="May" ;;
    jun | june | 6) month="Jan" ;;
    jul | july | 7) month="Jul" ;;
    aug | august | 8) month="Aug" ;;
    sep | september | 9) month="Sep" ;;
    oct | october | 10) month="Oct" ;;
    nov | november | 11) month="Nov" ;;
    dec | december | 12) month="Dec" ;;
    *) echo "입력값 오류" ;;
  esac  

  case $month in

    "Jan" | "Mar" | "May" | "Jul" | "Aug" | "Oct" | "Dec")
      if [ $day -gt 0 ] && [ $day -le 31 ]; then
        echo "$month $day $year"
      else

        if [ $var1 -eq 0 ] && [ $var2 -ne 0 ] || [ $var3 -eq 0 ]; then
          echo "$year은 윤년, 윤년인 $month의 경우 1일부터 31일까지 존재, $1 $day $year은 유효하지 않음."

        else
          echo "$year은 평년, 평년인 $month의 경우 1일부터 31일까지 존재, $1 $day $year은 유효하지 않음."
        fi  
      fi
      ;;


    "Apr" | "Jun" | "Sep" | "Nov")
    if [ $day -gt 0 ] && [ $day -le 30 ]; then
      echo "$month $day $year"
    else

      if [ $var1 -eq 0 ] && [ $var2 -ne 0 ] || [ $var3 -eq 0 ]; then
        echo "$year은 윤년, 윤년인 $month의 경우 1일부터 30일까지 존재, $1 $day $year은 유효하지 않음."

      else
        echo "$year은 평년, 평년인 $month의 경우 1일부터 30일까지 존재, $1 $day $year은 유효하지 않음."
      fi  
    fi
    ;;


    "Feb")

      if [ $var1 -eq 0 ] && [ $var2 -ne 0 ] || [ $var3 -eq 0 ]; then
        if [ $day -gt 0 ] && [ $day -le 29 ]; then
          echo "$month $day $year"
        else 
          echo "$year은 윤년, 윤년인 $month의 경우 1일부터 29일까지 존재, $1 $day $year은 유효하지 않음."
        fi

      else
        if [ $day -gt 0 ] && [ $day -le 28 ]; then
          echo "$month $day $year"
        else
          echo "$year은 평년, 평년인 $month의 경우 1일부터 28일까지 존재, $1 $day $year은 유효하지 않음."
        fi
      fi
      ;;

  esac  

else
  echo "입력값 오류"
  exit 1
fi  