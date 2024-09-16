#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from dataclasses import dataclass
from glob import iglob

import re
import sys

if len(sys.argv) != 2:
	sys.exit(f'Usage: {sys.argv[0]} pokecrystal.sym')

invalid_rx = re.compile(r'''
	\.
	| ^[vwsh]  # RAM
	| ^oam     # RAM
	| ^Tileset.+(?:GFX.|Meta|Coll|Attr|Anim)$  # must exist for every tileset
	| _Map(?:Attributes|ScriptHeader)$         # must exist for every map
	| _BlockData$                              # must exist for every map
	| _MapSetupCmd$  # generated by `add_mapsetup`
	| Predef$        # generated by `add_predef`
	| Special$       # generated by `add_special`
	| ^PokeAnim_.+_SetupCommand$  # referenced by `pokeanim`
	| ^BattleCommand_             # referenced by `command`
	| (?:Front|Back)pic$          # referenced by `pics`
	| (?:Icon|Mini|MiniMask)$     # referenced by `mini_icon`
	| Text_(?:Greeting|WinLoss|Done)$  # referenced by `rematch_script`
''', re.X)

@dataclass
class Label:
	label: str
	address: str
	references = 0
	filename = None
	line_no = None

labels = {}
with open(sys.argv[1], 'r', encoding='utf8') as sym_file:
	for line in sym_file:
		if (line := line.split(';', 1)[0].rstrip()):
			address, label = line.split(maxsplit=1)
			labels[label] = Label(label, address)

label_rx = re.compile(r'^\s*([a-z_][a-z0-9_#@]*):{1,2}(.*)', re.I)
reference_rx = re.compile(r'\b([a-z_][a-z0-9_#@]*)\b', re.I)
string_rx = re.compile(r'"(?:[^"\\]|\\.)*"')

for filename in iglob('**/*.asm', recursive=True):
	with open(filename, 'r', encoding='utf8') as asm_file:
		scope = None
		for index, line in enumerate(asm_file):
			line = re.sub(string_rx, '""', line).split(';', 1)[0].rstrip()
			if (m := label_rx.match(line)):
				scope, line = m.groups()
				if scope in labels:
					labels[scope].filename = filename
					labels[scope].line_no = index + 1
			for label in re.findall(reference_rx, line):
				if label in labels:
					labels[label].references += 1

for label in labels.values():
	if not label.references and not re.search(invalid_rx, label.label):
		print(f'{label.address} {label.label} [{label.filename}:{label.line_no}]'
			if label.filename else f'{label.address} {label.label}')