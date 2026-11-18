#!/usr/bin/perl
use strict;
use warnings;

# Check if input file is provided
if (@ARGV != 1) {
    die "Usage: $0 <input_file>\n";
}

my $input_file = $ARGV[0];
my $output_file = "mbist_file_list";

open(my $in_fh, '<', $input_file) or die "Cannot open input file $input_file: $!";
open(my $out_fh, '>', $output_file) or die "Cannot create output file $output_file: $!";

my $in_rtl_section = 0;
my @rtl_files = ();

while (my $line = <$in_fh>) {
    chomp $line;
    
    # Skip comments and empty lines
    next if $line =~ /^\s*#/ || $line =~ /^\s*$/;
    
    # Detect the start of RTL file sections
    if ($line =~ /read_hdl.*\{/ && $line !~ /ijtag|mbist/) {
        $in_rtl_section = 1;
        next;
    }
    
    # Detect the end of RTL file sections
    if ($line =~ /\}\s*$/ && $in_rtl_section) {
        $in_rtl_section = 0;
        next;
    }
    
    # Process RTL files within the section
    if ($in_rtl_section) {
        # Remove leading/trailing whitespace and quotes
        $line =~ s/^\s+|\s+$//g;
        $line =~ s/["']//g;
        
        # Remove trailing backslash if present
        $line =~ s/\\\s*$//;
        
        # Add to list if not empty
        push @rtl_files, $line if $line =~ /\S/;
    }
}

# Write the formatted output
foreach my $file (@rtl_files) {
    print $out_fh "$file\n";
}

close($in_fh);
close($out_fh);

print "Conversion complete. Output written to $output_file\n";
