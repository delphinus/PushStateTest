package PushStateTest::Util;
use common::sense;
use Encode;

sub new { my ($class, @args) = @_; #{{{
    my %opt = ref $args[0] ? %{$args[0]} : @args;
    return bless \%opt => $class;
} #}}}

sub url { my ($self, $str) = @_; #{{{
    return '' unless defined $str;

    # Perlメモ
    # http://www.din.or.jp/~ohzaki/perl.htm#JP_Escape
    my $url = encode(utf8 => $str);
    $url =~ s/([^a-zA-Z0-9_.!~*'()-])/'%' . unpack('H2', $1)/eg;

    return $url;
} #}}}

1;
