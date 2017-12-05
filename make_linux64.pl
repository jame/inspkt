#!/usr/bin/perl
print ("Building inspkt...\n");
system("/home/cadams/git/inspkt/build/linux-x64/./pp -o inspkt inspkt.pl");
sleep 10;
system("rm -f /home/cadams/git/inspkt/build/linux-x64/
system("cp /home/cadams/git/inspkt/build/linux-x64/inspkt /home/cadams/git/inspkt/build/linux-x64/zip");
sleep 10;
print ("Build Completed\n");

