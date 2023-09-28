/**
 * Name: Zig
 * Description: Zig programming language.
 * Author: Jean-Pierre Laroche <pnfisher@eos.ncsu.edu>
 */
/* The super state of all C highlightings. */


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



zig_func_re =
/* Keywords.
   (build-re '(addrSpaceCast addWithOverflow alignCast alignOf as atomicLoad atomicRmw atomicStore
bitCast bitOffsetOf bitSizeOf bitReverse breakpoint byteSwap
call cDefine ceil cImport cInclude clz cmpxchgStrong cmpxchgWeak compileError compileLog cos constCast ctz cUndef cVaArg cVaCopy cVaEnd cVaStart
divExact divFloor divTrunc
embedFile enumFromInt errorFromInt errorName errorReturnTrace errSetCast export extern exp exp2
fabs fence field fieldParentPtr floatCast floatFromInt floor frameAddress
hasDecl hasField
import inComptime intCast intFromBool intFromEnum intFromError intFromFloat intFromPtr
log log2 log10
max memcpy memset min mod mulAdd mulWithOverflow
offsetOf
panic popCount prefetch ptrCast ptrFromInt
rem returnAddress
select setAlignStack setCold setEvalBranchQuota setFloatMode setRuntimeSafety shlExact shlWithOverflow shrExact shuffle sizeOf splat subWithOverflow src sqrt sin
prefetch
reduce round
tagName tan trap trunc truncate typeInfo typeName
This Type TypeOf
unionInit
volatileCast
Vector
wasmMemorySize wasmMemoryGrow workGroupId workGroupSize workItemId
))
  */
  /\b(a(ddrSpaceCast|ddWithOverflow|lignCast|lignOf|s|tomicLoad|tomicRmw|tomicStore)\
|b(itCast|itOffsetOf|itSizeOf|itReverse|reakpoint|yteSwap)\
|c(all|Define|eil|Import|Include|lz|mpxchg(Strong|Weak)|ompile(Error|Log)|os|onstCast|tz|Undef|Va(Arg|Copy|End|Start))\
|d(iv(Exact|Floor|Trunc))\
|e(mbedFile|numFromInt|rror(FromInt|Name|ReturnTrace)|rrSetCast|x(port|tern|p|p2))\
|f(abs|ence|iel(d|dParentPtr)|loat(Cast|FromInt)|loor|rameAddress)\
|h(as(Decl|Field))\
|i(mport|nComptime|nt(Cast|From(Bool|Enum|Error|Float|Ptr)))\
|l(og|og2|og10)\
|m(ax|em(cpy|set)|in|od|ul(Add|WithOverflow))\
|o(ffsetOf)\
|p(refetch)\
|p(anic|opCount|tr(Cast|FromInt))\
|r(em|eturnAddress)\
|s(|rc|in|qrt|el(ect)|et(AlignStack|Cold|EvalBranchQuota|FloatMode|RuntimeSafety)|hl(Exact|WithOverflow)|hrExact|huffle|izeOf|plat|ubWithOverflow)\
|r(educe|ound)\
|t(a(gName|n)|r(ap|unc|uncate)|this|ype(Info|Name))\
|T(his|ype|ypeOf)\
|u(nionInit)\
|v(olatileCast)\
|V(ector)\
|w(ork(GroupId|GroupSize|ItemId))\
|wasmMemorySize|wasmMemoryGrow\
)\b/;



/*extends HighlightEntry*/
state zig extends special
{

BEGIN {
    /* See `c.st' for the comments on this one. */
    type_re = zig_func_re ;
	
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



 /* Types. */
  zig_func_re {
    function_name_face(true);
    language_print ($0);
    function_name_face (false);
  }


}





/*
Local variables:
mode: c
End:
*/
