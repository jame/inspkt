#!/usr/bin/perl
print ("Building inspkt...\n");
system("/home/cadams/git/inspkt/build/linux/./pp -o inspkt inspkt.pl");
sleep 10;
print ("Build Completed\n");

