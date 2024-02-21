local C = {
  -- im-select binary's name, or the binary's full path
  default_command = "D:\\64bit\\im-select.exe",
  -- default input method in normal mode.
  default_method_selected = "1033",

  -- Restore the default input method state when the following events are triggered
  set_default_events = { "VimEnter", "InsertLeave", "CmdlineLeave" },
  -- Restore the previous used input method state when the following events are triggered
  set_previous_events = { "InsertEnter" },

  keep_quiet_on_no_binary = false,

  async_switch_im = true,
}

local function change_im_select(cmd, method)
  local args = {}
  args = { method }

  local handle
  handle, _ = vim.loop.spawn(
    cmd,
    { args = args, detach = true },
    vim.schedule_wrap(function(_, _)
      if handle and not handle:is_closing() then
        handle:close()
      end
    end)
  )
  if not handle then
    vim.api.nvim_err_writeln([[[im-select]: Failed to spawn process for ]] .. cmd)
  end
end

local function restore_default_im()
  local current = vim.fn.system(C.default_command):match("^%s*(.-)%s*$")
  vim.api.nvim_set_var("im_select_saved_state", current)

  if current ~= C.default_method_selected then
    change_im_select(C.default_command, C.default_method_selected)
  end
end

local function restore_previous_im()
  local current = vim.fn.system("im-select.exe"):match("^%s*(.-)%s*$")
  local saved = vim.g["im_select_saved_state"]

  if current ~= saved then
    change_im_select(C.default_command, saved)
  end
end

if #C.set_default_events > 0 then
  vim.api.nvim_create_autocmd(C.set_default_events, {
    callback = restore_default_im,
  })
end

if #C.set_previous_events > 0 then
  vim.api.nvim_create_autocmd(C.set_previous_events, {
    callback = restore_previous_im,
  })
end
