#$pdf_previewer = "start evince 2>/dev/null";
$pdf_previewer = "start zathura";
$pdf_pdf_update_method = 0;
$dvi_mode = 0;
$pdf_mode = 1;
$preview_continuous_mode = 1;
$pdf_mode = 5; #à partir de la version 4.52
# $pdflatex = "xelatex %O %S";
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries -q '$_[0]'";
  }
  else {
    system "makeglossaries '$_[0]'";
  };
}
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
$clean_ext .= ' %R.ist %R.xdy';
