package PushStateTest::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::Lite;

use PushStateTest::Logic::Search;

use Log::Minimal;

any '/' => sub { my $c = shift; #{{{
    my $p = $c->req->parameters;
    my $logic = PushStateTest::Logic::Search->new;
    my $data = $logic->search($p);
    local $Log::Minimal::AUTODUMP = 1;

    if ($c->req->header('X-PJAX')) {
        $c->render('list.tt', +{%$data, pjax => 1});
    } else {
        my $index = $logic->index($p);
        $c->render('index.tt', +{%$data, %$index});
    }
}; #}}}

1;
