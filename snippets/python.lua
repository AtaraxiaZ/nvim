return {
  s(
    { trig = "copyright", dscr = "The copyright" },
    fmta(
      [[
        '''
        Copyright <> Microwave System Lab or its affiliates. All Rights Reserved.
        File: <>
        Authors:
        Zhe Li, 904016301@qq.com
        
        Description:
        <>
        
        Revision history:
        Version   Date        Author      Changes
        1.0    <>    Zhe Li      initial version
        '''
    ]],
      { p(os.date, "%Y"), i(1), i(2), p(os.date, "%Y-%m-%d") }
    )
  ),

  s(
    {
      trig = "docstring",
      dscr = "The description of function/module, etc",
    },
    fmta(
      [[
            """
            <>

            Args:
                <>: <>
            Returns:
                <>: <>
            """
    ]],
      { i(1), i(2), i(3), i(4), i(5) }
    )
  ),
}
