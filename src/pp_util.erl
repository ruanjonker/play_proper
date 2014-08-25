-module(pp_util).

-export([
        identity/1,
        to_string/1,
        add/2
        ]).

-spec identity(integer()) -> integer().
identity(X) when X < 10 -> X;
identity(_) -> 0.

-type number() :: integer() | float().

-spec add(number(), number()) -> number().
add(A,B) -> A + B.

-spec to_string(atom()) -> string().
to_string(V) -> atom_to_list(V).

%EOF
