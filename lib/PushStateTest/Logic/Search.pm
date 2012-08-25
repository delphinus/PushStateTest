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

=item * get_data()

=cut
sub get_data { my ($self, $is_pjax, $region) = @_; #{{{
    my $data = $self->search($region);

    if ($is_pjax) {
        return $data;
    } else {
        my $index = $self->index;
        return +{%$data, %$index};
    }
} #}}}

=item * index()

=cut
sub index { my ($self) = @_; #{{{
    my @regions = map {$_->[0]} @{$self->dbh->selectall_arrayref(<<SQL)};
        SELECT region, COUNT(*) c FROM population
        GROUP BY region ORDER BY c DESC
SQL

    return +{regions => \@regions};
} #}}}

=item * search()

=cut
sub search { my ($self, $region) = @_; #{{{
    my %data;

    my %criteria;
    if (defined $region) {
        $criteria{region} = $self->encoding->decode($region);
        $data{title} = "検索結果 - region => '$criteria{region}'";
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

    $data{no_rec} = 1 unless @{$data{list}};

    return \%data;
} #}}}

1;
