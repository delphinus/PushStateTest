package PushStateTest::Logic::Search;
=head1 NAME

PushStateTest::Logic::Search

=head1 DESCRIPTION

検索モジュール

=cut

use common::sense;
use parent qw!PushStateTest::Logic::Base!;
use Log::Minimal;

=head2 METHODS

=over 4

=item * index()

=cut
sub index { my ($self, $p) = @_; #{{{
    my @regions = map {$_->[0]} @{$self->dbh->selectall_arrayref(<<SQL)};
        SELECT region, COUNT(*) c FROM population
        GROUP BY region ORDER BY c DESC
SQL

    return +{regions => \@regions};
} #}}}

=item * search()

=cut
sub search { my ($self, $p) = @_; #{{{
    my %data;

    my %criteria;
    if (defined $p->{region}) {
        $criteria{region} = $p->{region};
        $data{title} = "検索結果 - region => '$p->{region}'";
    }

    my ($stmt, @binds) = $self->sqla->select('population',
        '*',
        \%criteria,
    );
    my $sth = $self->dbh->prepare($stmt);
    $sth->execute(@binds);

    $data{ths} = $sth->{NAME};

    while (my $row = $sth->fetchrow_hashref) {
        push @{$data{list}}, $row;
    }

    return \%data;
} #}}}

1;
