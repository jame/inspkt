#!/usr/bin/perl

#=======================================================================================================
#Perl Packet Inspector
#Written By: nugax (Chad Adams)
#Contact: nugax@1:19/37@fidonet, chad adams@40:1/100@cybernet, or nugax@thebytexchange.com
#Github: http://www.github.com/chadeadams/inspkt
#=======================================================================================================

use Switch;
use FTN::Packet;

#Turn off autobuffering
local $| = 1;

#Version information / Determine version and alpha release
my $alpha_version = 1; # 1=Yes 2=No
my $version_number = ".01";
if ($alpha_version == 1){
	our $version = $version_number . "-alpha";
}
if($alpha_version != 1){
	our $version = $version_number;
}

my $ver_short = "Perl Packet Inspector : TBX Software : bbs.thebytexchange.com:23\nVersion: " . $version . "\n\n";

print $ver_short;


#View Arguments
check_arguments();

sub check_arguments {

	switch ($ARGV[0]) {
	 	case "-v"       {check_alpha(); view_packet()}
		case "-va"			{view_packet();}
		case "-av"			{view_packet();}
		case "-h"       {check_alpha(); print_help()}
		case "-ah"			{print_help()}
		case "-ha"      {print_help()}
		case "-ver"     {check_alpha(); print_version()}
		case "-hver"    {check_alpha(); print_version(); print_help();}
		case "-verh"    {check_alpha(); print_version(); print_help();}
		case ""         {check_alpha(); print "Error 100: No argument(s) specified, exiting.\n -h for help information.\n"; exit}
		case "-install" {check_alpha(); install_dependencies()}
		case "-errors"  {check_alpha(); print error_list()}
		else		{check_alpha(); print "Error 101: Invalid argument(s) specificed.\n-h for help information.\n"}
	}
}

sub check_pktfile {
	my $packet_filename = shift;
	#Check to ensure packet file exists and can be opened
	my $fh;
	open($fh,"<",$packet_filename) or
		die ("Error 110: Could not open $packet_filename\nCheck the directory and packet filename. The packet could be corrupt.\n");

}



#Print help file

sub print_help {
print "Packet Inspector Help File\n";
print "Syntax expected:  inspkt -[arguments] /path/to/packet/packet.pkt\n\n";
print "Available Arguments:\n";
print "-argument        Description\n";
print "================================================================\n";
print "-v               View Packet Information\n";
print "-h               This help file\n";
print "-ver             Perl Packet Inspector version information\n";
print "-a               Skip Alpha Version warning (not recommended)\n";
print "\n\n";
print "You can combine certain arguments with others\ne.g.: inspkt -verh = Shows version and help file\n\n";
return 0;

}

sub print_version {
print "Version Information:\n";
print "======================\n";
print "inspkt - Perl Packet Inspector\n";
print "Version: $ver_short\n";
print "Written by TBX Software - The ByteXchange BBS\n";
print "Author: Chad Adams (nugax)\n";
print "Help? Fidonet: chad adams".'@'. "1:19/35" . '@' . "fidonet\n";
print "E-mail: cadams\@thebytexchange.com\n";
print "BBS: Telnet @ bbs.thebytexchange.com port 23";
print "\n\n";

return 0;
}

sub error_list {
print "  inspkt Error List\n";
print "=========================\n\n";
print "error 100  - No argument specified on command line - none\n";
print "error 101  - Invalid argument specified on command line\n";
print "error 104  - No filename specified for packet for use with -v\n";
print "error 110  - Could not open give packet file\n";
print "error 115  - The packet specified was empty or had no data\n";
print "error 120  - Invalid option (y/n) selected. Must select either Y or N\n";
print "\n";
exit;
}


sub view_packet {

#Check for filename give
if ($ARGV[1] eq "") {
 	print "Error 104: No packet filename specified.\n";
	return 0;
	}


#Check to ensure file exists - that was give for filename for packet
my $filename = $ARGV[1];

#Check the packet and file that was given
my $packet_check_result=check_pktfile($filename);
print ("Checking " . $filename . "...\n");

my $messages = FTN::Packet::read_ftn_packet($filename);

#Check to see if there are no messages or data
#todo


for $i ( 0 .. $#{$messages} ) {


        $msg_area = ${$messages}[i]{area};
        $msg_date = ${$messages}[i]{ftscdate};
        $msg_tonode = ${$messages}[i]{tonode};
        $msg_from = ${$messages}[i]{from};
        $msg_to = ${$messages}[i]{to};
        $msg_subj = ${$messages}[i]{subj};
        $msg_msgid = ${$messages}[i]{msgid};
        $msg_replyid = ${$messages}[i]{replyid};
        $msg_body = ${$messages}[i]{body};
        $msg_ctrl = ${$messages}[i]{ctrlinfo};


	#Print packet contents
	print "\n";
	print "==================================================================\n";
	print " Packet $filename contents\n";
	print "==================================================================\n\n";
	print "Message Area: " . $msg_area . "\n";
	print "Message Date: " . $msg_date . "\n";
	print "To Node Address: " . $msg_tonode . "\n";
	print "Message From: " . $msg_from . "\n";
	print "Message To: " . $msg_to . "\n";
	print "Subject: " . $msg_subj . "\n";
	print "MSG ID: " . $msg_msgid . "\n";
	print "Reply ID: " . $msg_replyid . "\n\n";
	print "          Kludge Line(s):\n ";
	print "  ---------------------------------\n\n";
	print $msg_ctrl . "\n\n";

	print "Do you want to view the message? (y/n) <ENTER=YES> ";

	my $answer = <STDIN>;
	$answer = uc($answer);
	chomp($answer);

	if ($answer eq "Y" or $answer eq "") {
		print "\n\n";
		print "           Message Body:\n";
		print "  ---------------------------------\n\n";


	        print $msg_body;

	        print "\n\n\n";
       	        print "Press any key to exit...";
	        <STDIN>;
		return 0;
	}

	if ($answer eq "N") {
		exit;
        }


	else {
	print "\nError 120: Unexpected entry. (Y/N or ENTER)\n";}
	return 0;

	}

}

sub check_alpha {
	#Check to see if version is an aplha version - display warning if so.

	if (index($version, "alpha") != -1) {
	print "DO NOT USE THIS APLHA VERSION... IT IS UNTESTED...\n";
	print "PAUSING FOR 10 SECONDS FOR YOU TO THINK ABOUT IT...\n";
	print "HIT CTL-C TO QUIT\n";

	#Code to make pause happen
	for (my $i = 0; $i <= 10; $i++) {
		printf("#");
		sleep 1;
	}

	print "\n";

	}
}
