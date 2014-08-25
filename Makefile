.PHONY: all deps clean test

all: clean deps ebin/pp.app test

deps:
	./rebar get-deps

clean:
	rm -f erl_crash.dump
	./rebar clean

ebin/pp.app: rebar.config src/*.erl include/*
	./rebar compile

test: ebin/pp.app test/*
	./rebar eunit skip_deps=true

run: clean deps ebin/pp.app
	erl -pa ebin -sname ppdev@$(shell hostname -s) -s pp_app start_dev

#EOF
