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
    { INFO => 1, Bind => [ $uid ] }
  );

  return $self;
}

#**********************************************************
=head2 main_info($tid)

=cut
#**********************************************************
sub main_info {
  my $self = shift;
  my ($tid) = @_;

  $self->query2("SELECT uid, tid, role
      FROM vacations_main
      WHERE tid= ?",
    undef,
    { Bind => [ $tid ], COLS_NAME => 1 }
  );

  return $self->{list};
}

#**********************************************************
=head2 emp_info($tid)

=cut
#**********************************************************
sub emp_info {
  my $self = shift;
  my ($tid, $attr) = @_;

  $self->query2("SELECT tid, surname
      FROM vacations_employees
      WHERE tid= ?",
    undef,
    { Bind => [ $tid ], COLS_NAME => 1 }
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

#**********************************************************

=head2 user_add($attr)
=cut

#**********************************************************
sub user_add {
  my $self = shift;
  my ($attr) = @_;
  
  $self->query_add('vacations_main', $attr);
  return [ ] if ($self->{errno});
  
  return $self;
}

#**********************************************************
=head2 orders_list($uid, $attr)

=cut
#**********************************************************
sub orders_list {
  my $self = shift;
  my ($tid) = @_;

  $self->query2("SELECT tid,
    order_id,
    order_date,
    vct_start,
    vct_end,
    vct_days,
    used
      FROM vacations_orders
      WHERE tid= ?",
    undef,
    { Bind => [ $tid ], COLS_NAME => 1 }
  );

  return $self->{list};
}

#**********************************************************
=head2 periods_list($uid, $attr)

=cut
#**********************************************************
sub periods_list {
  my $self = shift;
  my ($tid) = @_;

  $self->query2("SELECT tid,
    start_period,
    end_period,
    days_accrued,
    days_used
      FROM vacations_accrued_periods
      WHERE tid= ?",
    undef,
    { Bind => [ $tid ], COLS_NAME => 1 }
  );

  return $self->{list};
}

1