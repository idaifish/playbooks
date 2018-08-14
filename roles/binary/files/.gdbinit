set disassembly-flavor intel
set pagination off
set breakpoint pending on
set history save on
set history filename ~/.gdb_history
set history size 32768
set history expansion on

macro define offsetof(s, m) &((s *) 0)->m