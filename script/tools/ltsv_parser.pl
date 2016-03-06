#!/usr/bin/env perl

use strict;
use warnings;
use Text::LTSV;
use Data::Dumper;

my $log_name = $ARGV[0];
my $key      = $ARGV[1];
my $num      = $ARGV[2] || 100000000;
die "usage: perl ./check_access_log.pl [/var/log/access.log] request_url" unless ( $log_name );
die "usage: perl ./check_access_log.pl [/var/log/access.log] request_url" unless ( $key );

my $in_fh;

system("sudo chmod 777 $log_name");

if (! open $in_fh, '<', $log_name ) {
    die "Can not open '$log_name':$!";
}

my $access_count = +{};
while (<$in_fh>) {
    my $log_hash = Text::LTSV->parse_line($_);
    #print Dumper $log_hash;
    my $value = $log_hash->{$key} || undef;
    $access_count->{$value} ++ if ( $value );
}

my $count = 0;

for (sort { $access_count->{$b} <=> $access_count->{$a} } keys %$access_count){
    print "$key:$_\n";
    print "count:$access_count->{$_}\n\n";
    last if $count == $num;
    $count ++;
}
