return {
  s(
    { trig = "create_clk", dscr = "Create clock constraint" },
    fmta("create_clock -name <> -period <> [get_ports <>]", { i(1), i(2), i(3) })
  ),
  s(
    { trig = "create_gen_clk", dscr = "Crate generated clock constraint" },
    fmta(
      "create_generated_clock -name <> -source [get_ports <>] -divide_by <> [get_pins <>]",
      { i(1), i(2), i(3), i(4) }
    )
  ),
  s(
    { trig = "set_input_delay", dscr = "Set input delay constraint" },
    fmta("set_input_delay -clock <> -max <> -min <> [get_ports <>]", { i(1), i(2), i(3), i(4) })
  ),
  s(
    { trig = "set_output_delay", dscr = "Set output delay constraint" },
    fmta("set_output_delay -clock <> -max <> -min <> [get_ports <>]", { i(1), i(2), i(3), i(4) })
  ),
  s(
    { trig = "set_clock_group", dscr = "Set clock group constraint" },
    fmta(
      "set_clock_groups -name <> -asynchronous -group [get_clocks --include_generated_clocks <>] -group [get_clocks -include_generated_clocks <>]",
      { i(1), i(2), i(3) }
    )
  ),
}
