#!/bin/bash

rebar3  get-deps
cp ./fix/erlzmq_nif.erl ./_build/default/lib/erlzmq/src/
rebar3 escriptize