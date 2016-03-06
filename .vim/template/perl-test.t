use strict;
use warnings;
use Test::More;
use Test::Exception;
use Test::Mock::Guard qw/mock_guard/;

BEGIN {
    plan tests => 1;
    use_ok('package');
};

done_testing;
