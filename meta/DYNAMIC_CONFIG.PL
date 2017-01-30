# idk, this should be automatic or summint? put it in explicitly.
$meta->{prereqs}{runtime}{requires}{'Test::More'} = '0.47'  if $] < 5.008001;
