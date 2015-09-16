use Test::More;
use strict; use warnings;

use App::bmkpasswd ();

my $cmp = \&App::bmkpasswd::_eq;
ok  $cmp->('foo', 'foo'), 'foo eq foo';
ok !$cmp->('abc', '123'), 'abc ne 123';
ok !$cmp->('foo', 'Foo'), 'foo ne Foo';
ok !$cmp->('Foo', 'foo'), 'Foo ne foo';
ok !$cmp->('foo', 'fooo'), 'foo ne fooo';
ok !$cmp->('fooo', 'foo'), 'fooo ne foo';
ok !$cmp->('aaa', 'aaaa'), 'aaa ne aaaa';
ok !$cmp->('aaaa', 'aaa'), 'aaaa ne aaa';
ok !$cmp->('abcd', 'abc'), 'abcd ne abc';
ok !$cmp->('abc', 'abcd'), 'abc ne abcd';
ok !$cmp->('abcd', 'abce'), 'abcd ne abce';
ok !$cmp->('abce', 'abcd'), 'abce ne abcd';
ok !$cmp->('dcba', 'ecba'), 'dcba ne ecba';
ok !$cmp->('ecba', 'dcba'), 'ecba ne dcba';
ok !$cmp->('', 'abc'), 'empty string ne abc';
ok !$cmp->('abc', ''), 'abc ne empty string';

done_testing
