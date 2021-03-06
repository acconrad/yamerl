-module(bool).

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, "test/construction/" ?MODULE_STRING ".yaml").

setup() ->
    application:start(yamerl).

schema_failsafe_simple_test_() ->
    {setup,
      fun setup/0,
      [
        ?_assertMatch(
          [
            [
              "true", "True", "TRUE",
              "y", "Y",
              "yes", "Yes", "YES",
              "on", "On", "ON",
              "false", "False", "FALSE",
              "n", "N",
              "no", "No", "NO",
              "off", "Off", "OFF",
              "Not a bool"
            ]
          ],
          yamerl_constr:file(?FILENAME,
            [{detailed_constr, false}, {schema, failsafe}])
        )
      ]
    }.

schema_json_simple_test_() ->
    {setup,
      fun setup/0,
      [
        ?_assertThrow(
          {yamerl_exception, [
              {yamerl_parsing_error,error, "Invalid string", 2, 3, not_a_string,
                {yamerl_scalar, 2, 3,
                  {yamerl_tag, 2, 3, {non_specific, "?"}},
                  flow, plain, "True"},
                []}]},
          yamerl_constr:file(?FILENAME,
            [{detailed_constr, false}, {schema, json}])
        )
      ]
    }.

schema_core_simple_test_() ->
    {setup,
      fun setup/0,
      [
        ?_assertMatch(
          [
            [
              true, true, true,
              "y", "Y",
              "yes", "Yes", "YES",
              "on", "On", "ON",
              false, false, false,
              "n", "N",
              "no", "No", "NO",
              "off", "Off", "OFF",
              "Not a bool"
            ]
          ],
          yamerl_constr:file(?FILENAME,
            [{detailed_constr, false}, {schema, core}])
        )
      ]
    }.

schema_failsafe_bool_ext_simple_test_() ->
    {setup,
      fun setup/0,
      [
        ?_assertMatch(
          [
            [
              true, true, true,
              true, true,
              true, true, true,
              true, true, true,
              false, false, false,
              false, false,
              false, false, false,
              false, false, false,
              "Not a bool"
            ]
          ],
          yamerl_constr:file(?FILENAME,
            [{detailed_constr, false}, {schema, failsafe},
              {node_mods, [yamerl_node_bool_ext]}])
        )
      ]
    }.

schema_failsafe_detailed_test_() ->
    {setup,
      fun setup/0,
      [
        ?_assertMatch(
          [
            {yamerl_doc,
              {yamerl_seq,yamerl_node_seq,"tag:yaml.org,2002:seq",
                [{line,1},{column,1}],
                [{yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,1},{column,3}],
                    "true"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,2},{column,3}],
                    "True"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,3},{column,3}],
                    "TRUE"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,4},{column,3}],
                    "y"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,5},{column,3}],
                    "Y"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,6},{column,3}],
                    "yes"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,7},{column,3}],
                    "Yes"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,8},{column,3}],
                    "YES"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,9},{column,3}],
                    "on"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,10},{column,3}],
                    "On"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,11},{column,3}],
                    "ON"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,13},{column,3}],
                    "false"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,14},{column,3}],
                    "False"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,15},{column,3}],
                    "FALSE"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,16},{column,3}],
                    "n"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,17},{column,3}],
                    "N"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,18},{column,3}],
                    "no"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,19},{column,3}],
                    "No"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,20},{column,3}],
                    "NO"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,21},{column,3}],
                    "off"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,22},{column,3}],
                    "Off"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,23},{column,3}],
                    "OFF"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,25},{column,3}],
                    "Not a bool"}],
                23}
            }
          ],
          yamerl_constr:file(?FILENAME,
            [{detailed_constr, true}, {schema, failsafe}])
        )
      ]
    }.

schema_json_detailed_test_() ->
    {setup,
      fun setup/0,
      [
        ?_assertThrow(
          {yamerl_exception, [
              {yamerl_parsing_error,error, "Invalid string", 2, 3, not_a_string,
                {yamerl_scalar, 2, 3,
                  {yamerl_tag, 2, 3, {non_specific, "?"}},
                  flow, plain, "True"},
                []}]},
          yamerl_constr:file(?FILENAME,
            [{detailed_constr, true}, {schema, json}])
        )
      ]
    }.

schema_core_detailed_test_() ->
    {setup,
      fun setup/0,
      [
        ?_assertMatch(
          [
            {yamerl_doc,
              {yamerl_seq,yamerl_node_seq,"tag:yaml.org,2002:seq",
                [{line,1},{column,1}],
                [{yamerl_bool,yamerl_node_bool,"tag:yaml.org,2002:bool",
                    [{line,1},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool,"tag:yaml.org,2002:bool",
                    [{line,2},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool,"tag:yaml.org,2002:bool",
                    [{line,3},{column,3}],
                    true},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,4},{column,3}],
                    "y"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,5},{column,3}],
                    "Y"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,6},{column,3}],
                    "yes"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,7},{column,3}],
                    "Yes"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,8},{column,3}],
                    "YES"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,9},{column,3}],
                    "on"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,10},{column,3}],
                    "On"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,11},{column,3}],
                    "ON"},
                  {yamerl_bool,yamerl_node_bool,"tag:yaml.org,2002:bool",
                    [{line,13},{column,3}],
                    false},
                  {yamerl_bool,yamerl_node_bool,"tag:yaml.org,2002:bool",
                    [{line,14},{column,3}],
                    false},
                  {yamerl_bool,yamerl_node_bool,"tag:yaml.org,2002:bool",
                    [{line,15},{column,3}],
                    false},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,16},{column,3}],
                    "n"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,17},{column,3}],
                    "N"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,18},{column,3}],
                    "no"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,19},{column,3}],
                    "No"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,20},{column,3}],
                    "NO"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,21},{column,3}],
                    "off"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,22},{column,3}],
                    "Off"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,23},{column,3}],
                    "OFF"},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,25},{column,3}],
                    "Not a bool"}],
                23}
            }
          ],
          yamerl_constr:file(?FILENAME,
            [{detailed_constr, true}, {schema, core}])
        )
      ]
    }.

schema_failsafe_bool_ext_detailed_test_() ->
    {setup,
      fun setup/0,
      [
        ?_assertMatch(
          [
            {yamerl_doc,
              {yamerl_seq,yamerl_node_seq,"tag:yaml.org,2002:seq",
                [{line,1},{column,1}],
                [{yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,1},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,2},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,3},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,4},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,5},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,6},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,7},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,8},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,9},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,10},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,11},{column,3}],
                    true},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,13},{column,3}],
                    false},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,14},{column,3}],
                    false},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,15},{column,3}],
                    false},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,16},{column,3}],
                    false},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,17},{column,3}],
                    false},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,18},{column,3}],
                    false},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,19},{column,3}],
                    false},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,20},{column,3}],
                    false},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,21},{column,3}],
                    false},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,22},{column,3}],
                    false},
                  {yamerl_bool,yamerl_node_bool_ext,"tag:yaml.org,2002:bool",
                    [{line,23},{column,3}],
                    false},
                  {yamerl_str,yamerl_node_str,"tag:yaml.org,2002:str",
                    [{line,25},{column,3}],
                    "Not a bool"}],
                23}
            }
          ],
          yamerl_constr:file(?FILENAME,
            [{detailed_constr, true}, {schema, failsafe},
              {node_mods, [yamerl_node_bool_ext]}])
        )
      ]
    }.
