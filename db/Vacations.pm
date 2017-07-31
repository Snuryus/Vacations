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
=head2 users_list($uid, $attr)

=cut
#**********************************************************
sub users_list {
  my $self = shift;

  $self->query2("SELECT u.uid,
    u.id AS login,
    pi.email,
    vm.tid,
    vm.role,
    ve.surname AS surname,
    ve.name AS name,
    ve.mid_name AS mid_name,
    ve.surname_genetive as gen_surname,
    ve.start_date,
    ve.position,
    ve.email,
    ve.company,
    ve.vct_days,
    ve.vct_left AS total_days_left,
    ve.vct_earned AS total_days_earned
      FROM users u
      LEFT JOIN users_pi pi ON (u.uid=pi.uid)
      LEFT JOIN vacations_main vm ON (u.uid=vm.uid)
      LEFT JOIN vacations_employees ve ON (ve.tid=vm.tid)
      ORDER BY 4",
    undef,
    { COLS_NAME => 1 }
  );

  return $self->{list};
}

#**********************************************************
=head2 info($uid, $attr)

=cut
#**********************************************************
sub info {
  my $self = shift;
  my ($uid) = @_;

  $self->query2("SELECT vm.uid,
    u.id AS login,
    pi.email,
    vm.tid,
    vm.role,
    ve.surname AS surname,
    ve.name AS name,
    ve.mid_name AS mid_name,
    ve.surname_genetive as gen_surname,
    ve.start_date,
    ve.position,
    ve.email,
    ve.vct_days,
    ve.vct_left AS total_days_left,
    ve.vct_earned AS total_days_earned,
    ve.company
      FROM vacations_main vm
      LEFT JOIN users u ON (u.uid=vm.uid)
      LEFT JOIN users_pi pi ON (vm.uid=pi.uid)
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
sub emp_list {
  my $self = shift;

  $self->query2("SELECT ve.tid,
    ve.surname,
    ve.name,
    ve.mid_name,
    ve.surname_genetive,
    ve.start_date,
    ve.email,
    ve.vct_left,
    ve.vct_earned,
    vm.uid,
    vm.role
      FROM vacations_employees ve
      LEFT JOIN vacations_main vm ON (vm.tid=ve.tid)",
    undef,
    { COLS_NAME => 1 }
  );

  return $self->{list};
}
#**********************************************************
=head2 emp_change($attr)

=cut
#**********************************************************
sub emp_change {
  my $self = shift;
  my ($attr) = @_;

   $self->changes2(
    {
      CHANGE_PARAM    => 'TID',
      TABLE           => 'vacations_employees',
      DATA            => $attr,
    }
  );
  
  return $self;
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
=head2 user_del($uid, $table)

=cut
#**********************************************************
sub user_del {
  my $self = shift;
  my ($uid, $table_name) = @_;
  
  $self->query2( "DELETE 
    FROM $table_name 
    WHERE uid= ?",
    'do', 
    { Bind => [ $uid ] } 
  );
  
  return $self;
}

#**********************************************************
=head2 user_change($uid, $role)

=cut
#**********************************************************
sub user_change {
  my $self = shift;
  my ($uid, $role) = @_;

  $self->query2( "UPDATE vacations_main
    SET role= $role 
    WHERE uid= $uid",
    'do', 
    { } 
  );
  
  return $self;
}

#**********************************************************
=head2 orders_list($tid)

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
      WHERE tid= ?
      ORDER by vct_start",
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
      WHERE tid= ?
      ORDER by 2",
    undef,
    { Bind => [ $tid ], COLS_NAME => 1 }
  );

  return $self->{list};
}

#**********************************************************
=head2 holidays()

=cut
#**********************************************************
sub holidays {
  my $self = shift;
  my ($attr) = @_;
  
  $self->{EXT_TABLES}     = '';
  $self->{SEARCH_FIELDS}  = '';
  $self->{SEARCH_FIELDS_COUNT} = 0;
  
  if ($attr->{INTERVAL}) {
    ($attr->{FROM_DATE}, $attr->{TO_DATE}) = split(/\//, $attr->{INTERVAL}, 2);
  }
  
  my $WHERE =  $self->search_former($attr, [
      ['DATE',           'DATE',        'date',                1 ],
      ['WORKDAY',        'INT',         'workday',            1 ],
      ['FROM_DATE|TO_DATE','DATE',"DATE_FORMAT(date, '%Y-%m-%d')"],
    ],
    { WHERE => 1 }
  );
  
  $self->query2("SELECT 
    $self->{SEARCH_FIELDS}
      date
      FROM vacations_holidays
      $WHERE;",
    undef,
    { COLS_NAME => 1, %$attr }
  );

  return $self->{list};
}

#**********************************************************
=head2 log_list($attr) - Vacations log list

=cut
#**********************************************************
sub log_list {
  my $self   = shift;
  my ($attr) = @_;

  my $SORT      = ($attr->{SORT})      ? $attr->{SORT}      : 'date';
  my $DESC      = ($attr->{DESC})      ? $attr->{DESC}      : 'DESC';
  my $PG        = ($attr->{PG})        ? $attr->{PG}        : 0;
  my $PAGE_ROWS = ($attr->{PAGE_ROWS}) ? $attr->{PAGE_ROWS} : 25;

  $self->{EXT_TABLES}     = '';
  $self->{SEARCH_FIELDS}  = '';
  $self->{SEARCH_FIELDS_COUNT} = 0;

  if ($attr->{INTERVAL}) {
    ($attr->{FROM_DATE}, $attr->{TO_DATE}) = split(/\//, $attr->{INTERVAL}, 2);
  }

  my $WHERE =  $self->search_former($attr, [
      ['DATE',           'DATE',        'date',                1 ],
      ['IP',             'INT',         'ip',  'INET_NTOA(ip) AS ip'],
      ['EMAIL',          'STR',         'email',               1 ],
      ['COMMENTS',       'STR',         'comments',            1 ],
      ['FROM_DATE|TO_DATE','DATE',"DATE_FORMAT(date, '%Y-%m-%d')"],
      ['ID',             'INT',         'id'                     ],
    ],
    { WHERE => 1 }
  );

  $self->query2("SELECT 
      $self->{SEARCH_FIELDS}
      date,
      id
      FROM vacations_log
      $WHERE
      ORDER BY $SORT $DESC LIMIT $PG, $PAGE_ROWS;",
    undef,
    $attr
  );

  return [] if ($self->{errno});

  my $list = $self->{list};

  if ($self->{TOTAL} >= 0 && !$attr->{SKIP_TOTAL}) {
    $self->query2("SELECT count( DISTINCT id) AS total FROM vacations_log
    $WHERE",
      undef,
      { INFO => 1 }
    );
  }

  return $list;
}

#**********************************************************
=head2 log_add($attr)

=cut
#**********************************************************
sub log_add {
  my $self = shift;
  my ($attr) = @_;

  $self->query_add( 'vacations_log', $attr );

  return 1;
}



1