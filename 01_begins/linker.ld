ENTRY(_start)
SECTIONS{
  . = START;
  .data   : {*(.data)}
  .bss    : {*(.bss)}
  . = . + 0x800;
  sp_top = .;
}
