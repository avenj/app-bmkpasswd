use Test::More;
use strict; use warnings;

BEGIN {
  use_ok( 'App::bmkpasswd', qw/mkpasswd passwdcmp mkpasswd_forked/ );
}

my $bc;
ok( $bc = mkpasswd('snacks'), 'Bcrypt crypt()' );
ok( index($bc, '$2a$') == 0, 'Looks like bcrypt' );
ok( passwdcmp('snacks', $bc), 'Bcrypt compare' );
ok( !passwdcmp('things', $bc), 'Bcrypt negative compare' );

$bc = undef;
ok( $bc = mkpasswd('snacks', 'bcrypt', 2), 'Bcrypt tuned workcost' );
ok( index($bc, '$2a$02') == 0, 'Bcrypt tuned workcost looks ok' );
ok( passwdcmp('snacks', $bc), 'Bcrypt tuned workcost compare' );
ok( !passwdcmp('things', $bc), 'Bcrypt tuned negative compare' );

mkpasswd_forked;
$bc = mkpasswd('snacks');
ok( index($bc, '$2a$') == 0, 'Bcrypt after mkpasswd_forked ok' );

done_testing
