
# Name: percent_base_10
# File: conversion.s
# Declaration:  int percent_base_10( int value)
# Semantics:
#    - iteratively divides the input value by 10.
#    - converts the remainder to ASCII
#    - print outs the ASCII character to the stdout
#    - returns the number of ASCII characters printed
# Edge Condition:
#    - value = 0;

# Starter Code:
    .text
    .globl main
 .data
newline: .asciiz "\n"
.text
.global percent_base_10

percent_base_10:
   li $v0, 1
   move $t0, $a0
   move $t1, $zero

   # check for edge case

   bne $t0, $zero, loop

   # if value is 0, print 0 and return 1

   addi $v0, $zero, '0'
   syscall
   li $v0, 1
   jr $ra

loop:
   # divide by 10

   div $t0, $zero

   # get remainder

   mfhi $t2

   # convert remainder to ASCII

   addi $t2, $t2, '0'

   # print character

   move $a0, $t2
   syscall

   # increment counter
   addi $t1, $t1, 1

   # check if value is 0
   bne $t0, $zero, loop

   # return counter

   move $v0, $t1
   jr $ra


code 2 
.data
newline: .asciiz "\n"
.text
.global version_2version_2
li $v0, 1
move $t0, $a0
move $t1, $zero
# check for edge case
bne $t0, $zero, loop
# if value is 0, print 0 and return 1
addi $v0, $zero, '0'
syscall
li $v0, 1
jr $ra

loop:
# divide by 10
div $t0, $zero
# get remainder
mfhi $t2
# push remainder
addi $sp, $sp, -4
sw $t2, 0($sp)
# increment counter
addi $t1, $t1, 1
# check if value is 0
bne $t0, $zero, loop
# print values in reverse order

print:
# pop values
lw $t2, 0($sp)
addi $sp, $sp, 4
# convert remainder to ASCII
addi $t2, $t2, '0'
# print character
move $a0, $t2
syscall
# check if counter is 0
bnez $t1, print
# return counter
move $v0, $t1
jr $ra

