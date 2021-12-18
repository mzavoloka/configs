use Time::HiRes qw( gettimeofday tv_interval );
use feature 'say';

my $n = 10_000_000;
say "Num of loops 'n' is $n";

{
    my $t0 = [ gettimeofday ];

    for ( 1 .. $n ) {
    }

    my $t1 = [ gettimeofday ];

    my $elapsed = tv_interval( $t0, $t1 );

    say "Empty 'for' loop elapsed time is $elapsed";
}

{
    my $t0 = [ gettimeofday ];

    for ( 1 .. $n ) {
        my $a = 0;
    }

    my $t1 = [ gettimeofday ];

    my $elapsed = tv_interval( $t0, $t1 );

    say "Assignment in 'for' loop elapsed time is $elapsed";
}


my $n = 1_000;
{
    my $t0 = [ gettimeofday ];

    for ( 1 .. $n ) {
        `touch test`;
        `rm test`;
    }

    my $t1 = [ gettimeofday ];

    my $elapsed = tv_interval( $t0, $t1 );

    say "Empty file disk writes in 'for' loop elapsed time is $elapsed";
}
