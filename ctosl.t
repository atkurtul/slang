#!/usr/bin/perl
use feature qw(say);

open($fh, "<", "/usr/include/vulkan/vulkan_core.h");


sub map_type {
  my ($ty) = @_;
  $ty =~ s/^Vk//g;
  $ty =~ s/PFN_vk/PFN/g;
  $ty =~ s/uint32_t/uint/g;
  $ty =~ s/int32_t/int/g;
  $ty =~ s/uint8_t/ubyte/g;
  $ty =~ s/uint64_t/ulong/g;
  $ty =~ s/uint16_t/ushort/g;
  $ty =~ s/int64_t/long/g;
  $ty =~ s/size_t/word/g;
  $ty =~ s/char/byte/g;
  $ty =~ s/float/real/g;
  $ty =~ s/(\w+)(\*+)/$2$1/;
  $ty =~ s/void/[]/g;
  return $ty;
}


while($line = <$fh>) {
  $core .= $line;
  if ($line =~ /^typedef\s+enum\s+(\w+)/) {
    $name = $1;
    $name =~ s/^Vk//;
    say "enum $name {}";
  }

  if ($line =~ /^typedef\s+(\w+)\s+(\w+);/) {
    $name1 = map_type $1;
    $name2 = map_type $2;
    say "alias $name1 $name2";
  }

  if ($line =~ /^VK_DEFINE_NON_DISPATCHABLE_HANDLE\((\w+)\)/) {
    $name = map_type $1;
    say "alias long $name";
  }
  if ($line =~ /^VK_DEFINE_HANDLE\((\w+)\)/) {
    $name = map_type $1;
    say "alias long $name";
  }

  if ($line =~ /^typedef.*PFN_.*/) {
    my $pfn = $line;
    while (!($line =~ /;/g)) {
      $line = <$fh>;
      $pfn .= $line;
    }
    $pfn =~ s/\n//g;
    $pfn =~ s/\t//g;
    $pfn =~ s/VKAPI_PTR//g;
    $pfn =~ s/typedef //g;
    $pfn =~ s/\(\s*/\(/g;
    $pfn =~ s/\s*\)/\)/g;
    $pfn =~ s/ +/ /g;

    $pfn =~ /(.+?)\(\*PFN_vk(\w+)\)/;
    say "alias () PFN$2";
  }
}


sub write_types {
  my ($kind, $out) = @_;
  while($core =~ /typedef\s+$kind\s+(\w+)\s+\{\s*((.*;\n)*)\s*\}.*?;/g) {
    $fields = $2;
    $ty = $1;
    $ty =~ s/^Vk//g;
    say "$out $ty {";
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
        $field = map_type $field;
        $var ="\t$var $field";
        say $var;
      }
    }
    say "}\n";
  }
}



write_types "struct", "type";
write_types "union", "union";

