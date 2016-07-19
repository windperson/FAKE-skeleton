#!/bin/sh
if [ ! -f ./packages/FAKE/tools/FAKE.exe ]; then
 paket install
fi
mono ./packages/FAKE/tools/FAKE.exe $@