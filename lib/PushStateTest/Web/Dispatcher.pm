package PushStateTest::Web::Dispatcher;
use common::sense;
use utf8;
use Amon2::Web::Dispatcher::Lite;

use PushStateTest::Logic::Search;

use Log::Minimal;
local $Log::Minimal::AUTODUMP = 1;

get '/' => sub { &_make_body(@_) };

get '/:region' => sub { &_make_body(@_) };

sub _make_body { my ($c, $args) = @_; #{{{
    $args //= +{};
    my $logic = PushStateTest::Logic::Search->new;
    my $is_pjax = $c->req->header('X-PJAX');
    my $data = $logic->get_data($is_pjax, $args->{region});

    my %stash = %$data;
    if ($is_pjax) {
        $stash{pjax} = 1;
        $c->render('list.tt', \%stash);

    } else {
        $stash{css_files} = [qw!
            http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.23/themes/cupertino/jquery-ui.css
        !];
        $stash{js_files} = [qw!
            http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.23/jquery-ui.min.js
            /static/js/jquery-pjax/jquery.pjax.js
        !];
        $c->render('index.tt', \%stash);
    }
} #}}}

1;
