#!/bin/sh

sudo=`which sudo`

################################################################################
#  Install Utils
################################################################################

$sudo apt-get update

$sudo apt-get install \
        openssh-server \
        git vim \
        make gcc g++ \
        gcc-avr avr-libc


################################################################################
#  Install Jenkins
################################################################################

wget -q -O- http://pkg.jenkins.io/debian-stable/jenkins.io.key | $sudo apt-key add -
echo 'deb http://pkg.jenkins.io/debian-stable binary/' | $sudo tee /etc/apt/sources.list.d/jenkins.list

$sudo apt-get update

$sudo apt-get install \
        jenkins


