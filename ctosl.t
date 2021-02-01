#!/usr/bin/perl
use feature qw(say);

open($fh, "<", "/usr/include/vulkan/vulkan_core.h");

while($line = <$fh>) {
  $core .= $line;
}

while($core =~ /typedef\s+struct\s+(\w+)\s+\{\s*((.*;\n)*)\s*\}.*?;/g) {
  $fields = $2;
  $ty = $1;
  $ty =~ s/^Vk//g;
  say "type $ty {";
  $fields =~ s/\s\s+/ /g;
  @fieldsx = split(";",$fields); 
  foreach $field (@fieldsx) {
    $field =~ /^(.*)\s+(\w+)/;
    $var = $2;
    if ($var) {
      $field = $1;
      $var =~ s/type/ty/g;
      $field =~ s/const//g;
      $field =~ s/struct//g;
      $field =~ s/ //g;
      $field =~ s/PFN_vk/PFN/g;
      $field =~ s/^Vk//;
      $field =~ s/(\w+)(\*+)/$2$1/;
      $field =~ s/uint32_t/int/g;
      $field =~ s/char/byte/g;
      $field =~ s/void/[]/g;
      $field =~ s/float/real/g;
      $var ="\t$var $field,";
      say $var;
    }
  }
  say "}\n";
}


