-- 如果snippet里本身就有<>，则可以敲两次来escape，<<>>
return {
  s(
    { trig = "signal", dscr = "Define a signal" },
    fmta(
      [[
        signal <> {
        name="";
        desc="";
        activehigh;
        };

        <> <>;
        ]],
      { i(1), rep(1), i(2) }
    )
  ),

  s(
    { trig = "field", dscr = "Define reused field" },
    fmta(
      [[
        field <> {
            name = "";
            desc = "";
            sw = <>;
            hw = <>;
        }

        <> <>;
        ]],
      { i(1), i(2), i(3), rep(1), i(2) }
    )
  ),

  s(
    { trig = "field", dscr = "Define anonymous field" },
    fmta(
      [[
            field {
            } <>;
            ]],
      { i(1) }
    )
  ),

  s(
    { trig = "reg", dscr = "Define a register" },
    fmta(
      [[
  reg <> {
     name = "";
     desc = "";

     field {
       hw   = w;
       sw   = r;
       desc = "";
     }  <>[:] = 'h12_34_56_7;

     field {
       hw   = na;
       sw   = r;
       desc = "";
     } <>[:] = 4'b00_01;
  };

            ]],
      { i(1), i(2), i(3) }
    )
  ),
  s(
    { trig = "fifo", dscr = "Define fifo registers" },
    fmta(
      [[
    regfile <> {
    reg pointerReg { field { we;} data[31:0]; };

    reg fifoStatusReg {
        field {} full;
        field {} empty;
        field {} almost_empty[4:4];
        field {} almost_full[5:5];

        full->>reset  = 1'b0;
        full->>resetsignal = generic_reset
        empty->>reset = 1'b1;
        almost_empty->>reset = 1'b1;
        almost_full ->>reset = 1'b0;
    };

    pointerReg head;
    head.data->>resetsignal = generic_reset;

    pointerReg tail;
    fifoStatusReg status;
    };
            ]],
      { i(1) }
    )
  ),
  s(
    { trig = "enum", dscr = "Define enumeration" },
    fmta(
      [[
    enum <> {
        not_present = 4'd0  { desc = "No link peer is currently detected"; };
        training    = 4'd1  { desc = "Link is currently training"; };
        snooze      = 4'd5  { desc = "Link is in a partial low power state"; };
        sleep       = 4'd6  { desc = "Link is a Full low power state"; };
        wake        = 4'd7  { desc = "Link is waking up from snooze or sleep state"; };
        active      = 4'd10 { desc = "Link is opertating normally"; };
    };

    field link_status_field {
        hw     = rw;
        sw     = r;
        desc   = "Status of a Serdes Link";
        encode = link_status_enum;
        fieldwidth = 4;
    };

    reg serdes_link_status_reg {
    link_status_field port0;
    link_status_field port1;
    link_status_field port2;
    link_status_field port3;
    };
            ]],
      { i(1) }
    )
  ),
  s(
    { trig = "counter", dscr = "Define a counter" },
    fmta(
      [[
    field <> {
        hw   = r; sw = rw; rclr; counter;
        desc = "Number of certain packet type seen";
    };

    reg spi4_pkt_count_reg {
        count_field port0[31:16];
        count_field port1[15:0];
        port0->>threshold = 16'hCFFF;
        port1->>threshold = 16'hCFFF;
    };
            ]],
      { i(1) }
    )
  ),
}
