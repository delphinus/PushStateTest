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
        my @css_files = qw!
            http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.23/themes/cupertino/jquery-ui.css
        !;
        $c->render('index.tt', $data);
    }
}; #}}}

1;
