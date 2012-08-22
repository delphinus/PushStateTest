package PushStateTest::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::Lite;

use PushStateTest::Logic::Search;

use Log::Minimal;
local $Log::Minimal::AUTODUMP = 1;

any '/' => sub { my $c = shift; #{{{
    my $p = $c->req->parameters;
    my $logic = PushStateTest::Logic::Search->new;
    my $data = $logic->search($p);

    my %stash;

    if ($c->req->header('X-PJAX')) {
        %stash = (
            %$data,
            pjax => 1,
        );
        $c->render('list.tt', \%stash);

    } else {
        my $index = $logic->index($p);
        %stash = (
            %$data,
            %$index,
            css_files => [qw!
                http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.23/themes/cupertino/jquery-ui.css
            !],
            js_files => [qw!
                http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.23/jquery-ui.min.js
                /static/js/jquery-pjax/jquery.pjax.js
            !],
        );
        $c->render('index.tt', \%stash);
    }
}; #}}}

1;
