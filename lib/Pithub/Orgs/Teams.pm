package Pithub::Orgs::Teams;

# ABSTRACT: Github v3 Org Teams API

use Moose;
use Carp qw(croak);
use namespace::autoclean;
extends 'Pithub::Base';

=method add_member

=over

In order to add a user to a team, the authenticated user must have
'admin' permissions to the team or be an owner of the org that the
team is associated with.

    PUT /teams/:id/members/:user

=back

Examples:

    $result = $p->orgs->teams->add_member(
        team_id => 1,
        user    => 'plu',
    );

=cut

sub add_member {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: team_id' unless $args{team_id};
    croak 'Missing key in parameters: user'    unless $args{user};
    return $self->request( PUT => sprintf( '/teams/%d/members/%s', $args{team_id}, $args{user} ) );
}

=method add_repo

=over

In order to add a repo to a team, the authenticated user must be
an owner of the org that the team is associated with.

    PUT /teams/:id/repos/:repo

=back

Examples:

    $result = $p->orgs->teams->add_repo(
        team_id => 1,
        repo    => 'some_repo',
    );

=cut

sub add_repo {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: team_id' unless $args{team_id};
    croak 'Missing key in parameters: repo'    unless $args{repo};
    return $self->request( PUT => sprintf( '/teams/%d/repos/%s', $args{team_id}, $args{repo} ) );
}

=method create

=over

In order to create a team, the authenticated user must be an
owner of the given organization.

    POST /orgs/:org/teams

=back

Examples:

    $result = $p->orgs->teams->create(
        org  => 'CPAN-API',
        data => {
            name       => 'new team',
            permission => 'push',
            repo_names => ['github/dotfiles']
        }
    );

=cut

sub create {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: org' unless $args{org};
    croak 'Missing key in parameters: data (hashref)' unless ref $args{data} eq 'HASH';
    return $self->request( POST => sprintf( '/orgs/%s/teams', $args{org} ), $args{data} );
}

=method delete

=over

In order to delete a team, the authenticated user must be an owner
of the org that the team is associated with.

    DELETE /teams/:id

=back

Examples:

    $result = $p->orgs->teams->delete( team_id => 1 );

=cut

sub delete {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: team_id' unless $args{team_id};
    return $self->request( DELETE => sprintf( '/teams/%d', $args{team_id} ) );
}

=method get

=over

Get team

    GET /teams/:id

=back

Examples:

    $result = $p->orgs->teams->get( team_id => 1 );

=cut

sub get {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: team_id' unless $args{team_id};
    return $self->request( GET => sprintf( '/teams/%d', $args{team_id} ) );
}

=method get_repo

=over

Get team repo

    GET /teams/:id/repos/:repo

=back

Examples:

    $result = $p->orgs->teams->get_repo(
        team_id => 1,
        repo    => 'some_repo',
    );

=cut

sub get_repo {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: team_id' unless $args{team_id};
    croak 'Missing key in parameters: repo'    unless $args{repo};
    return $self->request( GET => sprintf( '/teams/%d/repos/%s', $args{team_id}, $args{repo} ) );
}

=method is_member

=over

In order to get if a user is a member of a team, the authenticated
user must be a member of the team.

    GET /teams/:id/members/:user

=back

Examples:

    $result = $p->orgs->teams->is_member(
        team_id => 1,
        user    => 'plu',
    );

=cut

sub is_member {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: team_id' unless $args{team_id};
    croak 'Missing key in parameters: user'    unless $args{user};
    return $self->request( GET => sprintf( '/teams/%d/members/%s', $args{team_id}, $args{user} ) );
}

=method list

=over

List teams

    GET /orgs/:org/teams

=back

Examples:

    $result = $p->orgs->teams->list( org => 'CPAN-API' );

=cut

sub list {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: org' unless $args{org};
    return $self->request( GET => sprintf( '/orgs/%s/teams', $args{org} ) );
}

=method list_members

=over

In order to list members in a team, the authenticated user must be
a member of the team.

    GET /teams/:id/members

=back

Examples:

    $result = $p->orgs->teams->list_members( team_id => 1 );

=cut

sub list_members {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: team_id' unless $args{team_id};
    return $self->request( GET => sprintf( '/teams/%d/members', $args{team_id} ) );
}

=method list_repos

=over

List team repos

    GET /teams/:id/repos

=back

Examples:

    $result = $p->orgs->teams->list_repos( team_id => 1 );

=cut

sub list_repos {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: team_id' unless $args{team_id};
    return $self->request( GET => sprintf( '/teams/%d/repos', $args{team_id} ) );
}

=method remove_member

=over

In order to remove a user from a team, the authenticated user must
have 'admin' permissions to the team or be an owner of the org that
the team is associated with. NOTE: This does not delete the user,
it just remove them from the team.

    DELETE /teams/:id/members/:user

=back

Examples:

    $result = $p->orgs->teams->remove_member(
        team_id => 1,
        user    => 'plu',
    );

=cut

sub remove_member {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: team_id' unless $args{team_id};
    croak 'Missing key in parameters: user'    unless $args{user};
    return $self->request( DELETE => sprintf( '/teams/%d/members/%s', $args{team_id}, $args{user} ) );
}

=method remove_repo

=over

In order to remove a repo from a team, the authenticated user must be
an owner of the org that the team is associated with.

    DELETE /teams/:id/repos/:repo

=back

Examples:

    $result = $p->orgs->teams->remove_repo(
        team_id => 1,
        repo    => 'some_repo',
    );

=cut

sub remove_repo {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: team_id' unless $args{team_id};
    croak 'Missing key in parameters: repo'    unless $args{repo};
    return $self->request( DELETE => sprintf( '/teams/%d/repos/%s', $args{team_id}, $args{repo} ) );
}

=method update

=over

In order to edit a team, the authenticated user must be an owner
of the org that the team is associated with.

    PATCH /teams/:id

=back

Examples:

    $result = $p->orgs->teams->update(
        team_id => 1,
        data    => {
            name       => 'new team name',
            permission => 'push',
        }
    );

=cut

sub update {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: team_id' unless $args{team_id};
    croak 'Missing key in parameters: data (hashref)' unless ref $args{data} eq 'HASH';
    return $self->request( PATCH => sprintf( '/teams/%d', $args{team_id} ), $args{data} );
}

__PACKAGE__->meta->make_immutable;

1;
