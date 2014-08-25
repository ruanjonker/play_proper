-module(pp_util_tests).

-include_lib("proper/include/proper.hrl").
-include_lib("eunit/include/eunit.hrl").

identity_test() ->

    ?assertEqual(true, proper:check_spec({pp_util,identity, 1})),

    Props = 
        [ ?FORALL(X, ?SUCHTHAT(X, integer(), (X < 10)), pp_util:identity(X) =:= X)
        , ?FORALL(X, ?SUCHTHAT(X, integer(), (X >= 10)), pp_util:identity(X) =:= 0)
        ],

    [?assertEqual(true, proper:quickcheck(P, [{to_file, user}, {constraint_tries, 100000}])) || P <- Props],

    ok.

to_string_test() ->

    ok.

%EOF
