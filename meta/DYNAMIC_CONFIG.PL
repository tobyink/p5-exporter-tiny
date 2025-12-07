	my $prereq_type = 'recommends';

	if ( $ENV{CI}
	and defined $ENV{GITHUB_REPOSITORY}
	and $ENV{GITHUB_REPOSITORY} eq 'tobyink/p5-exporter-tiny' ) {
		$prereq_type = 'requires';
	}

	if ( "$]" >= 5.011002 and "$]" < 5.037002 ) {
		$meta->{prereqs}{runtime}{$prereq_type}{'Lexical::Var'} = '0.010';
	}

	# idk, this should be automatic or summint? put it in explicitly.
	$meta->{prereqs}{runtime}{requires}{'Test::More'} = '0.47'
		if "$]" < 5.006002;
