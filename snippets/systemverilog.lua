return {

  s({ trig = "include", desr = "Include files" }, fmta([[`include "<>"]], { i(1) })),
  -- autoinst template
  s(
    { trig = "autotemplate", desr = "Create verilog-mode autotemplate" },
    fmta(
      [[ 
            /* <> auto_template(
                
            );
            */
            
            <> 
            #( /*autoinstparam*/
            )
            <> 
            ( /*autoinst*/
            );
        ]],
      {
        i(1),
        rep(1),
        i(2, "dut"),
      }
    )
  ),

  s(
    { trig = "localvar", dscr = "Local variables of verilog-mode" },
    fmta(
      [[
      // Local Variables:
      // indent-tabs-mode: nil
      // tab-width: 4
      // verilog-typedef-regexp:"_t$"
      // verilog-library-directories:("." "../tb/")
      // verilog-auto-inst-column:30
      // End:
     ]],
      {}
    )
  ),

  s(
    { trig = "ifndef", dscr = "The defination of on the top of design file" },
    fmta(
      [[ 
            `ifndef <>
            `define <>
            `endif
      ]],
      { i(1), rep(1) }
    )
  ),

  s(
    { trig = "logic", dscr = "The defination of _d and _q signal" },
    fmta(
      [[ 
      logic [<>:0]          <>_d;
      logic [<>:0]          <>_q;
      ]],
      { i(1), i(2), rep(1), rep(2) }
    )
  ),

  s(
    { trig = "logic1", dscr = "The defination of _d and _q signal with data width = 1" },
    fmta(
      [[ 
      logic           <>_d;
      logic           <>_q;
      ]],
      { i(1), rep(1) }
    )
  ),

  s(
    { trig = "logictype", dscr = "The type_t defination of _d and _q signal" },
    fmta(
      [[ 
      <>_t        <>_d;
      <>_t        <>_q;
      ]],
      { i(1), i(2), rep(1), rep(2) }
    )
  ),

  s(
    { trig = "copyright", dscr = "The copyright of Bytedance" },
    fmta(
      [[
        //******************************************************************************
        // Copyright <> Bytedance Inc. or its affiliates. All Rights Reserved.
        //
        // File: <>
        // Authors:
        // ZheLi, zheli@bytedance.com
        //
        // Description:
        // input:
        // output:
        // function:
        // <>
        //
        // Revision history:
        // Version   Date        Author      Changes
        // 1.0    <>    Zhe Li      initial version
        //******************************************************************************
    ]],
      { p(os.date, "%Y"), i(1), i(2), p(os.date, "%Y-%m-%d") }
    )
  ),

  s(
    { trig = "clk", dscr = "Add clk and reset port" },
    fmta(
      [[ 
            input  logic                clk_i,
            input  logic                rst_i,
            ]],
      {}
    )
  ),
}
