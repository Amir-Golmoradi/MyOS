#!/run/current-system/sw/bin/python3
"""Update only two GTK3 keys, preserving other user settings and sections."""
import re
import sys
from pathlib import Path

path = Path(sys.argv[1]); name = sys.argv[2]; scheme = sys.argv[3]
path.parent.mkdir(parents=True, exist_ok=True)
text = path.read_text() if path.exists() else ''
lines = text.splitlines(keepends=True)
header = re.compile(r'^\s*\[([^\]]+)\]')
section = None
seen = set(); output = []
settings_section_found = False
for line in lines:
    m = header.match(line)
    if m:
        if section and section.lower() == 'settings':
            for key,value in [('gtk-theme-name',name), ('gtk-application-prefer-dark-theme','true' if scheme == 'prefer-dark' else 'false')]:
                if key not in seen:
                    output.append(f'{key}={value}\n')
                    seen.add(key)
        section = m.group(1).strip()
        if section.lower() == 'settings':
            settings_section_found = True
        output.append(line)
        continue
    if section and section.lower() == 'settings':
        m = re.match(r'^\s*(gtk-theme-name|gtk-application-prefer-dark-theme)\s*=', line)
        if m:
            key = m.group(1)
            if key in seen:
                continue
            seen.add(key)
            value = name if key == 'gtk-theme-name' else ('true' if scheme == 'prefer-dark' else 'false')
            line = f'{key}={value}\n'
    output.append(line)
if settings_section_found:
    for key,value in [('gtk-theme-name',name),('gtk-application-prefer-dark-theme','true' if scheme == 'prefer-dark' else 'false')]:
        if key not in seen:
            output.append(f'{key}={value}\n')
else:
    output.append('\n[Settings]\n')
    output.append(f'gtk-theme-name={name}\n')
    output.append(f"gtk-application-prefer-dark-theme={'true' if scheme == 'prefer-dark' else 'false'}\n")
path.write_text(''.join(output))
