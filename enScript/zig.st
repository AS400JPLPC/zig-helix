/**
 * Name: Zig
 * Description: Zig programming language.
 * Author: Jean-Pierre Laroche <pnfisher@eos.ncsu.edu>
 */

state x_string extends Highlight
{
  /\"/ {
    language_print ($0);
    return;
  }
}




zig_special_re =
/* Keywords.
   (build-re '(undefined true false null err and or))
  */
  /\b(undefined|true|false|null|err|and|or)\b/;



state special extends Highlight
{
  BEGIN {
      type_re = zig_special_re;
  }


  zig_special_re{
    face_string[fg_color] =		language_color("red");
    string_face(true);
    language_print ($0);
    string_face(false);
	face_string[fg_color] =		language_color("rosy brown");
  }


}


/*extends HighlightEntry*/
state zig extends special
{



  /* Comments. */
  /\/\// {
    comment_face (true);
    language_print ($0);
    call (eat_one_line);
    comment_face (false);
  }

  /* String constants. */
  /\"/ {
	face_string[fg_color] =     language_color("forest green");
    string_face (true);
    language_print ($0);
    call (x_string);
    string_face (false);
	face_string[fg_color] =		language_color("rosy brown");
  }

  /* Matrix [].  */ 
  /\[|\]|\{|\}|\(|\)/ {
	face_string[fg_color] =		language_color("firebrick");
    string_face(true);
	language_print ($0);
	string_face(false);
	face_string[fg_color] =		language_color("rosy brown");
  }

  /* Matrix start.  */ 
  /[0-9]/ {
	face_string[fg_color] =		language_color("Coral");
    string_face(true);
	language_print ($0);
	string_face(false);
	face_string[fg_color] =		language_color("rosy brown");
  }


  /* Character constants. */
  /'.'|'\\\\.'/ {
    string_face (true);
    language_print ($0);
    string_face (false);
  }


/* function */

/([@][A-Za-z]*)/{
 
 /* Types. */

	face_string[fg_color] =		language_color("blue");
    string_face(true);
    language_print ($0);
    string_face(false);
	face_string[fg_color] =		language_color("black");
 

}





  /* Keywords.
     (build-re '(addrspace align allowzero and anyframe anyerror anyopaque anytype asm async await
     bool break
     callconv catch comptime const comptime_int comptime_float continue c_char c_short c_ushort c_int c_uint c_long c_ulong c_longlong c_ulonglong c_longdouble
     defer
     else enum errdefer error 
     fn for f16 f32 f64 f80 f128
     if import inline isize i8 i19 i32 i64 i80 i128 
     linksection
     noalias noinline noreturn nosuspend 
     or orelse
     packed pub
     return resume 
     struct suspend switch
     test threadlocal try type
     union unreachable usingnamespace usize u8 16 u32 u64 u80 u128
     var void volatile
     while
))
  */

  /\b(a(ddrspace|lign|llowzero|nd|ny(frame|error|opaque|type)|sm|sync|wait)\
|b(ool|reak)\
|c(allconv|atch|onst|ompt(ime|ime_int|ime_float)|on(st|tinue)|(_(char|short|ushort|int|uint|long|ulong|longlong|ulonglong|longdouble)))\
|d(efer)\
|e(lse|num|r(rdefer|ror))\
|f(n|or|16|32|64|80|128)\
|i(f|(nline)|size|8|16|32|64|80|128)\
|linksection\
|n(o(alias|inline|return|suspend))\
|o(r|relse)\
|p(acked|ub)\
|r(e(turn|sume))\
|s(truct|uspend|witch)\
|t(est|hreadlocal|ry|ype)\
|u(n(ion|reachable)|singnamespace|size|8|16|32|64|80|128)\
|v(ar|o(id|latile))\
|w(hile))\b/ {
    keyword_face (true);
    language_print ($0);
    keyword_face (false);
  }


}





/*
Local variables:
mode: c
End:
*/
