use strict;
use warnings;
use utf8;
use t::Util;
use Plack::Test;
use Plack::Util;
use Test::More;
use Test::Requires 'Test::WWW::Mechanize::PSGI';

my $app = Plack::Util::load_psgi 'app.psgi';

my $mech = Test::WWW::Mechanize::PSGI->new(app => $app);
note 'normal access';
$mech->get_ok('/');
$mech->content_contains('pjax のテスト');
$mech->content_contains('日本');
$mech->content_contains('ニューヨーク');

$mech->get_ok('/東アジア');
$mech->content_contains('pjax のテスト');
$mech->content_contains('日本');
$mech->content_lacks('ニューヨーク');

$mech->get_ok('/北アメリカ');
$mech->content_contains('pjax のテスト');
$mech->content_lacks('日本');
$mech->content_contains('ニューヨーク');

note 'pjax access';
$mech->add_header('X-PJAX', 'true');

$mech->get_ok('/');
$mech->content_lacks('pjax のテスト');
$mech->content_contains('日本');
$mech->content_contains('ニューヨーク');

$mech->get_ok('/東アジア');
$mech->content_lacks('pjax のテスト');
$mech->content_contains('日本');
$mech->content_lacks('ニューヨーク');

$mech->get_ok('/北アメリカ');
$mech->content_lacks('pjax のテスト');
$mech->content_lacks('日本');
$mech->content_contains('ニューヨーク');

done_testing();
