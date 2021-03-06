-module('ex_7.9_single_quoted_lines').

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, "test/parsing/" ?MODULE_STRING ".yaml").

single_test_() ->
    ?_assertMatch(
      {yamerl_parser,
        {file,?FILENAME},
        [],
        <<>>,
        50,
        true,
        [],
        0,
        51,
        5,
        1,
        false,
        4,
        17,
        utf8,
        false,
        undefined,
        _,
        _,
        [],
        {bcoll,root,0,-1,1,1,-1,1,1},
        false,
        false,
        false,
        [{impl_key,false,false,undefined,undefined,1,1}],
        false,
        false,
        _,
        [],
        0,
        6,
        5,
        undefined,
        undefined,
        _,
        false,
        [],
        [
          {yamerl_stream_end,4,17},
          {yamerl_doc_end,4,17},
          {yamerl_scalar,1,1,
            {yamerl_tag,1,1,{non_specific,"!"}},
            flow,single_quoted,
            " 1st non-empty\n2nd non-empty 3rd non-empty "},
          {yamerl_doc_start,1,1,{1,2},_},
          {yamerl_stream_start,1,1,utf8}
        ]
      },
      yamerl_parser:file(?FILENAME)
    ).
