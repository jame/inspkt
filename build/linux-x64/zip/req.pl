#!/usr/bin/perl

#Install needed modules

print ("\nInstalling system modules... please wait...\n");
system("cpan install Switch FTN::Packet");
sleep 5;
print ("Modules Switch & FTN::Packet installed.\n\n");
