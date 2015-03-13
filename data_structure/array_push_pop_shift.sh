#!/usr/bin/env bash

# Implementing queue in shell script using simple array

function arr_push() {
  arr=( "${arr[@]}" "$1" )
}

function arr_pop() {
  i=$(expr ${#arr[@]} - 1)
  placeholder=${arr[$i]}
  unset arr[$i]
  arr=( "${arr[@]}" )
}

function arr_shift() {
  arr=("$1" "${arr[@]}")
}

function arr_unshift() {
  placeholder=${arr[0]}
  unset arr[0]
  arr=("${arr[@]}")
}

function main() {
  arr_push "rafael"
  arr_push "henrique"
  arr_push "da"
  arr_push "silva"
  arr_push "correia"
  echo ${arr[@]} # rafael henrique da silva correia
  echo ${arr[0]} # rafael
  arr_pop
  echo ${arr[@]} # rafael henrique da silva
  arr_shift "hello"
  echo ${arr[@]} # hello rafael henrique da silva
  arr_unshift
  echo ${arr[@]} # rafael henrique da silva
  arr_push "correia"
  echo ${arr[@]} # rafael henrique da silva correia
}

main