if ( $] ge 5.011002 and $] lt 5.021007 ) {
	$meta->{prereqs}{runtime}{recommends}{'Lexical::Var'} = '0';
}
elsif ( $] ge 5.018000 and $] lt 5.037002 ) {
	$meta->{prereqs}{runtime}{recommends}{'Alt::Lexical::Var::ButSupportModernPerl'} = '0.001';
}

# idk, this should be automatic or summint? put it in explicitly.
$meta->{prereqs}{runtime}{requires}{'Test::More'} = '0.47'
	if $] lt 5.006002;
