/**
 * Name: Zig
 * Description: Zig programming language.
 * Author: Jean-Pierre Laroche <pnfisher@eos.ncsu.edu>
 */



cpp_type_re =
/* Types.
   (build-re '(tagName panic))
  */
  /\b(tagName|panic)\b/;


/*extends HighlightEntry*/
state zig extends c 
{

BEGIN {
    /* See `c.st' for the comments on this one. */
    type_re = cpp_type_re;
  }

  /* Comments. */
  /\/\// {
    comment_face (true);
    language_print ($0);
    call (eat_one_line);
    comment_face (false);
  }

  /* String constants. */
  /\"/ {
    string_face (true);
    language_print ($0);
    call (c_string);
    string_face (false);
  }


  /* Character constants. */
  /'.'|'\\\\.'/ {
    string_face (true);
    language_print ($0);
    string_face (false);
  }



  /* Keywords.
     (build-re '(addrspace align allowzero and anyframe anyerror anyopaque anytype asm async await
     bool break
     callconv catch comptime const comptime_int comptime_floatcontinue c_char c_short c_ushort c_int c_uint c_long c_ulong c_longlong c_ulonglong c_longdouble
     defer 
     else enum errdefer error export extern
     fn for f16 f32 f64 f80 f128
     if import inline isize i8 i19 i32 i64 i80 i128 
     linksection
     noalias noinline noreturn nosuspend 
     or orelse
     packed pub
     return resume 
     struct suspend switch
     test threadlocal try type
     union unreachable usingnamespace usize u8 16 u32 u64 80 u128
     var void volatile
     while
))
  */

  /\b(a|(ddrspace|l(ign|lowzero)|nd|ny(frame|error|opaque|type)|s(m|ync|wait))\
|b(ool|reak)\
|c(a|llconv|tch|onst|(ompt|ime|ime_int|ime_float) |on(st|tinue)(_(har|short|ushort|int|uint|long|ulong|longlong|ulongulong|longdouble)))\
|d(efer)\
|e(lse |num|r(rdefer|ror)|x(port| tern))\
|f(n|or|16|32|64|128)\
|i(f|(mport|nline)|size|8|16|32|64|80|128)\
|linksection\
|no(alias|inline|return|suspend)\
|or|orelse\
|p(acked|ub)\
|re(turn|sume)\
|s(truct|uspend|witch)\
|t(est|hreadlocal|ry|ype)\
|u(n(ion|reachable)|singnamespace|size|8|16|32|64|80|128)\
|v(ar|o(id|latile))\
|while)\b/ {
    keyword_face (true);
    language_print ($0);
    keyword_face (false);
  }

 /* Types. */
  cpp_type_re {
    reference_face(true);
    language_print ($0);
    reference_face (false);
  }
}




/*
Local variables:
mode: c
End:
*/
