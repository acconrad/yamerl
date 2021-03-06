-module(timestamp).

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, "test/construction/" ?MODULE_STRING ".yaml").

setup() ->
      application:start(yamerl),
      Node_Mods = yamerl_app:get_param(node_mods),
      yamerl_app:set_param(node_mods, [yamerl_node_timestamp]),
      Node_Mods.

teardown(Node_Mods) ->
      yamerl_app:set_param(node_mods, Node_Mods).

simple_test_() ->
    {setup,
      fun setup/0,
      fun teardown/1,
      [
        ?_assertMatch(
          [
            [
              {{2011, 5, 26}, undefined},
              {undefined, {14,58,3}},
              {{2011, 5, 26}, {14,58,3}},
              {{2011, 5, 26}, {14,58,3}},
              {{2011, 5, 26}, {14,58,3}},
              "Not a timestamp"
            ]
          ],
          yamerl_constr:file(?FILENAME, [{detailed_constr, false}])
        )
      ]
    }.

detailed_test_() ->
    {setup,
      fun setup/0,
      fun teardown/1,
      [
        ?_assertMatch(
          [
            {yamerl_doc,
              {yamerl_seq,yamerl_node_seq,"tag:yaml.org,2002:seq",
                [{line,1},{column,1}],
                [{yamerl_timestamp,yamerl_node_timestamp,
                    "tag:yamerl,2012:timestamp",
                    [{line,1},{column,3}],
                    2011,5,26,undefined,undefined,undefined,
                    0,0},
                  {yamerl_timestamp,yamerl_node_timestamp,
                    "tag:yamerl,2012:timestamp",
                    [{line,2},{column,3}],
                    undefined,undefined,undefined,14,58,3,
                    0,0},
                  {yamerl_timestamp,yamerl_node_timestamp,
                    "tag:yamerl,2012:timestamp",
                    [{line,3},{column,3}],
                    2011,5,26,14,58,3,
                    0,0},
                  {yamerl_timestamp,yamerl_node_timestamp,
                    "tag:yamerl,2012:timestamp",
                    [{line,4},{column,3}],
                    2011,5,26,14,58,3,
                    0,0},
                  {yamerl_timestamp,yamerl_node_timestamp,
                    "tag:yamerl,2012:timestamp",
                    [{line,5},{column,3}],
                    2011,5,26,14,58,3,
                    0,0},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,7},{column,3}],
                    "Not a timestamp"}],
                6}}
          ],
          yamerl_constr:file(?FILENAME, [{detailed_constr, true}])
        )
      ]
    }.
