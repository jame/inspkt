                  inspkt Installation notes:

      1) Please be running Linux/64 Bit (Tested on Ubuntu/Debian with stock Perl)
      2) Make sure you have Perl installed. We suggest Strawberry perl. Reboot after installing.
      3) This should work on most ditros (note: perl 6 untested).
      4) Run perl req.pl in the extract directory in a console. This installs 2 needed modules. You will get errors if you do not run this before the program.
      5) To see available commands use:
      inspkt -h

      6) To view a packet - the syntax is: inspkt -v /path/to/packet.pkt


      Issues Known:
      1) Zip files or compressed packets are not supported. They have to be unzipped first.
      2) .MSG files are unknown if they work.
      3) Multiple messages in a PKT behavior SHOULD work, unknown if it does. This wi


      Note: The aplha versions have an annoying warning on them to dissuade their use, except for testing.
