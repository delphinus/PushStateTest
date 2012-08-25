package PushStateTest::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::Lite;

use PushStateTest::Logic::Search;

use Log::Minimal;

get '/' => sub { my ($c) = @_; #{{{
    &_make_body($c);
}; #}}}

get '/:region' => sub { my ($c, $args) = @_; #{{{
    &_make_body($c, $args->{region});
}; #}}}

sub _make_body { my ($c, $region) = @_; #{{{
    my $logic = PushStateTest::Logic::Search->new;
    my $is_pjax = $c->req->header('X-PJAX');
    my $data = $logic->get_data($is_pjax, $region);

    if ($is_pjax) {
        $c->render('list.tt', +{%$data, is_pjax => $is_pjax});
    } else {
        $c->render('index.tt', $data);
    }
} #}}}

1;
