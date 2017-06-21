package Vacations;

=head1 NAME

 Vacations pm

=cut

use strict;
use parent 'main';
my $MODULE = 'Vacations';

my Admins $admin;
my $CONF;

use Abills::Base qw/_bp/;

#**********************************************************

=head2 new($db, $admin, \%conf)

=cut

#**********************************************************
sub new {
  my $class = shift;
  my $db = shift;
  ($admin, $CONF) = @_;
  
  $admin->{MODULE} = $MODULE;
  
  my $self = {
    db    => $db,
    admin => $admin,
    conf  => $CONF
  };
  
  bless($self, $class);
  
  return $self;
}

#**********************************************************
=head2 info($uid, $attr)

=cut
#**********************************************************
sub info {
  my $self = shift;
  my ($uid, $attr) = @_;

  my $password = "''";
  if ($attr->{SHOW_PASSWORD}) {
    $password = "DECODE(u.password, '$self->{conf}->{secretkey}') AS password";
  }

  $self->query2("SELECT vm.uid,
    vm.tid,
    vm.role,
    ve.surname AS surname,
    ve.name AS name,
    ve.mid_name AS mid_name,
    ve.surname_genetive as gen_surname,
    ve.start_date,
    ve.position,
    ve.vct_days AS total_days_used,
    ve.vct_left AS total_days_left,
    ve.company,
    $password
      FROM vacations_main vm
      LEFT JOIN users u ON (u.uid=vm.uid)
      LEFT JOIN vacations_employees ve ON (ve.tid=vm.tid)
      WHERE vm.uid= ?",
    undef,
    { Bind => [ $uid ] }
  );

  return $self->{list};
}

#**********************************************************
=head2 main_info($tid)

=cut
#**********************************************************
sub main_info {
  my $self = shift;
  my ($tid) = @_;

  $self->query2("SELECT uid, tid
      FROM vacations_main
      WHERE tid= ?",
    undef,
    { Bind => [ $tid ] }
  );

  return $self->{list};
}

#**********************************************************
=head2 emp_info($tid)

=cut
#**********************************************************
sub emp_info {
  my $self = shift;
  my ($tid) = @_;

  $self->query2("SELECT tid
      FROM vacations_employees
      WHERE tid= ?",
    undef,
    { Bind => [ $tid ] }
  );

  return $self->{list};
}

#**********************************************************
=head2 vacations_users_list($attr)

  Arguments:
    $attr - hash_ref

  Returns:
    list

=cut
#**********************************************************
sub vacations_users_list {

}

#**********************************************************
=head2 add($attr)

=cut
#**********************************************************
sub add {
  my $self = shift;
  my ($table_name, $attr) = @_;

  $self->query_add($table_name, $attr);

  return $self;
}


#**********************************************************
=head2 truncate_table($attr)

=cut
#**********************************************************
sub truncate_table {
  my $self = shift;
  my ($table_name) = @_;

  $self->query2("TRUNCATE TABLE $table_name;", 'do');
  return $self;
}

1